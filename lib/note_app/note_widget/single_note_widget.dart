import 'package:dream_catcher_note/note_app/model_class.dart';
import 'package:dream_catcher_note/note_app/note_edit_data.dart';
import 'package:dream_catcher_note/templets/thems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SingleNote extends StatelessWidget {
  const SingleNote({
    Key? key,
    required this.helper,
    required this.hiveBox,
    required this.index
  }) : super(key: key);

  final ModelClass helper;
  final Box hiveBox;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        key: ValueKey(index),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => NoteEditData(
                      index: index,
                      name: helper.name,
                    ),
                  ),
                );
              },
              icon: Icons.edit,
              label: "Edit",
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.white,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                hiveBox.deleteAt(index);
              },
              icon: Icons.delete,
              label: "delete",
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ],
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor().mainColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                helper.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                helper.age,
                maxLines: 1,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}