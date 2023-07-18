import 'package:dream_catcher_note/note_app/model_class.dart';
import 'package:dream_catcher_note/note_app/note_first_screen.dart';
import 'package:dream_catcher_note/templets/thems.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:easy_localization/easy_localization.dart';
class NoteEditData extends StatefulWidget {
  int index;
  String name;
  NoteEditData({required this.name, required this.index, Key? key})
      : super(key: key);

  @override
  State<NoteEditData> createState() => _NoteEditDataState();
}

class _NoteEditDataState extends State<NoteEditData> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    final element = Hive.box("NoteBox").getAt(widget.index) as ModelClass;
    _nameController.text = element.name;
    _ageController.text = element.age.toString();
    super.initState();
  }

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
        title: Text(widget.name),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(

                onChanged: (value){
                  final titleValue = ModelClass(
                    name: _nameController.text,
                    age: _ageController.text,
                  );
                  Hive.box("NoteBox").putAt(widget.index, titleValue);
                },

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
                  hintText: "title".tr(),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: TextFormField(

                  onChanged: (value){
                    final noteValue = ModelClass(
                      name: _nameController.text,
                      age: _ageController.text,
                    );
                    Hive.box("NoteBox").putAt(widget.index, noteValue);
                  },


                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  maxLines: null,
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
                    hintText: "note".tr(),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final value = ModelClass(
                      name: _nameController.text,
                      age: _ageController.text,
                    );
                    Hive.box("NoteBox").putAt(widget.index, value);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const NoteHomeScreen(),
                      ),
                    );
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFF533f6a),
                  ),
                ),
                child: Text("done".tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
