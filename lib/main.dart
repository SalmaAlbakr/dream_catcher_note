import 'package:dream_catcher_note/note_app/model_class.dart';
import 'package:dream_catcher_note/note_app/note_first_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
   final directory = await getApplicationDocumentsDirectory();
   Hive.init(directory.path);
  Hive.registerAdapter(ModelClassAdapter());
  await Hive.openBox("NoteBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: const NoteHomeScreen(),
    );
  }
}

