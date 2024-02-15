import 'package:flutter/material.dart';
import 'package:flutter_mammoth_thai/controller.dart';
import 'package:flutter_mammoth_thai/create.dart';
import 'package:flutter_mammoth_thai/list.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      navigatorKey: Get.key,
      home: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 400),
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'To Do App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.view_list_rounded)),
                Tab(icon: Icon(Icons.create_rounded)),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  controller.deleteMarkedTodos();
                },
                icon: const Icon(Icons.delete_forever_rounded),
              )
            ],
          ),
          body: const TabBarView(
            children: [
              ListToDo(),
              CreateToDo(),
            ],
          )),
    );
  }
}
