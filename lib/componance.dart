import 'package:flutter/material.dart';

class TextFileCustom extends StatelessWidget {
  const TextFileCustom({
    super.key,
    this.maxLine,
     this.tiltleHeard,
    required this.titleTextFiled,
    required this.controller,
  });

  final int? maxLine;
  final String? tiltleHeard;
  final String titleTextFiled;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  tiltleHeard != null ? MainAxisAlignment.spaceEvenly: MainAxisAlignment.center,
      children: [
        tiltleHeard != null ? Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            tiltleHeard!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ): Container(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            maxLines: maxLine,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              // contentPadding: const EdgeInsets.only(
              //     left: 15, bottom: 15, top: 15, right: 15),
              hintText: titleTextFiled,
            ),
          ),
        ),
      ],
    );
  }
}