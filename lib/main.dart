import 'package:dream_catcher_note/note_app/model_class.dart';
import 'package:dream_catcher_note/note_app/note_first_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dynamic_color_theme/dynamic_color_theme.dart';

import 'templets/thems.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
   final directory = await getApplicationDocumentsDirectory();
   Hive.init(directory.path);
  Hive.registerAdapter(ModelClassAdapter());
  await Hive.openBox("NoteBox");

  runApp(MaterialApp(
    home: NoteHomeScreen(),
  ));
  //runApp(const MyApp());
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





