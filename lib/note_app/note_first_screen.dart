import 'package:dream_catcher_note/note_app/model_class.dart';
import 'package:dream_catcher_note/note_app/note_creat_data.dart';
import 'package:dream_catcher_note/note_app/note_widget/single_note_widget.dart';
import 'package:dream_catcher_note/note_app/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class NoteHomeScreen extends StatefulWidget {
  const NoteHomeScreen({Key? key}) : super(key: key);

  @override
  State<NoteHomeScreen> createState() => _NoteHomeScreenState();
}

class _NoteHomeScreenState extends State<NoteHomeScreen> {
  @override
  void initState() {
    var box = Hive.openBox<ModelClass>("NoteBox");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("AppName".tr()),
            Expanded(child: SizedBox()),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingScreen()));
                },
                child: Icon(Icons.settings))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF533f6a),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const NoteCreateData(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: FutureBuilder(
              builder: (context, snapshot) {
                final hiveBox = Hive.box("NoteBox");
                return ValueListenableBuilder(
                  valueListenable: hiveBox.listenable(),
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: hiveBox.length,
                      itemBuilder: (context, index) {
                        final helper = hiveBox.getAt(index) as ModelClass;
                        return SingleNote(
                          helper: helper,
                          hiveBox: hiveBox,
                          index: index,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
