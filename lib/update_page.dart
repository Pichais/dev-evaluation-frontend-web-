import 'package:flutter/material.dart';
import 'package:flutter_mammoth_thai/componance.dart';
import 'package:flutter_mammoth_thai/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatePage extends StatefulWidget {
 final int index;
  const UpdatePage({super.key, required this.index});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final Controller controller = Get.put(Controller());

  @override
  void initState() {
    var currentItem = controller.todolist[widget.index];
    controller.title.text = currentItem.title;
    controller.detail.text = currentItem.detail;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Update your todo!',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 20.0)),
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
                onPressed: () {
                   controller.updateItem(widget.index, controller.title.text, controller.detail.text);
                  Navigator.pop(context);
                },
                child: const Text('Update Value'),
              )
            ],
          )
      ));

  }
}
