import 'package:flutter/material.dart';
import 'package:notepad/widgets/todoAddForm.dart';

class CustomBottomSheet {
  static void bottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return TodoForm();
        });
  }
}
