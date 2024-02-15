import 'package:flutter/material.dart';
import 'package:flutter_mammoth_thai/componance.dart';
import 'package:flutter_mammoth_thai/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateToDo extends StatefulWidget {
  const CreateToDo({super.key});

  @override
  State<CreateToDo> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDo> {
  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Create your todo!',
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20.0)),
            Column(
              children: [
                TextFileCustom(
                  controller: controller.title,
                  titleTextFiled: 'Title',
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                TextFileCustom(
                  maxLine: 5,
                  controller: controller.detail,
                  titleTextFiled: 'Detail',
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.025,
            ),
            ElevatedButton(
              onPressed: () => controller.addToList(),
              child: const Text('Create'),
            )
          ],
        ),
      ),
    );
  }
}
