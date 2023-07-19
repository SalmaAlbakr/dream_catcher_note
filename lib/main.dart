import 'package:dream_catcher_note/note_app/model_class.dart';
import 'package:dream_catcher_note/note_app/note_first_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dynamic_color_theme/dynamic_color_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'templets/thems.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
   final directory = await getApplicationDocumentsDirectory();
   Hive.init(directory.path);
  Hive.registerAdapter(ModelClassAdapter());
  await Hive.openBox("NoteBox");
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'assets/translation',
        child: FirstScreen(),
      ));
}


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
  static _FirstScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<_FirstScreenState>()!;
}

class _FirstScreenState extends State<FirstScreen> {
  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light,),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          /* dark theme settings */
        ),
        themeMode: _themeMode,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home:
        NoteHomeScreen());
  }
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DynamicColorTheme(
//       data: (Color color, bool isDark) {
//         return buildTheme( color, isDark); // TODO define your own buildTheme method here
//       },
//       defaultColor: Colors.black,
//       defaultIsDark: false,
//       themedWidgetBuilder: (BuildContext context, ThemeData theme) {
//         return MaterialApp(
//           home: NoteHomeScreen(),
//         );
//       },
//     );
//   }
// }





