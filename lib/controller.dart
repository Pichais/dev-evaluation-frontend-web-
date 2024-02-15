import 'package:flutter/material.dart';
import 'package:flutter_mammoth_thai/model.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController detail = TextEditingController();

  RxList<ToDoListModel> todolist = <ToDoListModel>[].obs;


  addToList() {
    todolist.add(
      ToDoListModel(
        title: title.text,
        detail: detail.text,
        checkToDelete: false,
      ),
    );
    title.clear();
    detail.clear();
  }


  checkToDelete({required int index}) {
    var todoItem = todolist[index];
    todoItem.checkToDelete = !todoItem.checkToDelete; 
    todolist[index] = todoItem; 
    todolist.refresh();
  }

  deleteMarkedTodos() {
    todolist.removeWhere((item) => item.checkToDelete);
  }

   void updateItem(int index, String title, String detail) {
    if (index >= 0 && index < todolist.length) {
      var item = todolist[index];
      item.title = title;
      item.detail = detail;
      todolist[index] = item;
      todolist.refresh(); 
    }
  }
}
