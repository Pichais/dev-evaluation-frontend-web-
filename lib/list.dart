import 'package:flutter/material.dart';
import 'package:flutter_mammoth_thai/model.dart';
import 'package:flutter_mammoth_thai/update_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller.dart';

class ListToDo extends StatefulWidget {
  const ListToDo({super.key});

  @override
  State<ListToDo> createState() => _ListToDoState();
}

class _ListToDoState extends State<ListToDo> {
  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.todolist.length,
          itemBuilder: (_, index) {
            ToDoListModel todoItem = controller.todolist[index];
            return Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: InkWell(
                  onTap: (){
                    Get.to(()=>  UpdatePage(index: index,));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Title:",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: Get.width * 0.025,
                              ),
                              Text(todoItem.title),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Detail:",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: Get.width * 0.025,
                              ),
                              Text(todoItem.detail),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Checkbox(
                        value: todoItem.checkToDelete,
                        onChanged: (value) => controller.checkToDelete(index: index),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
