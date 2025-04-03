import 'package:flutter/material.dart';
import 'package:lab1/model/task.dart';

class DeleteButton extends StatelessWidget {
   const DeleteButton({required this.onPressed, super.key});

   final void Function() onPressed;

   @override
   Widget build(BuildContext context) {
      return IconButton(
         icon: Icon(Icons.delete),
         onPressed: () {
           onPressed();
      },
    );
 }
}


