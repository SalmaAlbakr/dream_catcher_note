import 'package:dream_catcher_note/note_app/model_class.dart';
import 'package:dream_catcher_note/note_app/note_first_screen.dart';
import 'package:dream_catcher_note/templets/thems.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NoteCreateData extends StatefulWidget {
  const NoteCreateData({Key? key}) : super(key: key);

  @override
  State<NoteCreateData> createState() => _NoteCreateDataState();
}

class _NoteCreateDataState extends State<NoteCreateData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFc793ce),
        title: const Text("Notes"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
                style: const TextStyle(fontWeight: FontWeight.bold),
                controller: _nameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor().mainColor,
                    ),
                  ),
                  hintText: "title",
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  maxLines: 9999,
                  controller: _ageController,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor().mainColor,
                      ),
                    ),
                    hintText: "note",
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  backgroundColor: const Color(0xFF533f6a),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final value = ModelClass(
                        name: _nameController.text, age: _ageController.text);
                    Hive.box("NoteBox").add(value);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const NoteHomeScreen(),
                      ),
                    );
                  }
                },
                child: const Text("create"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
