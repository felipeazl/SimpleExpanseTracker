// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NewExpense extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController dollarController;
  final TextEditingController centsController;
  final VoidCallback save;
  final VoidCallback cancel;

  const NewExpense({
    Key? key,
    required this.nameController,
    required this.dollarController,
    required this.centsController,
    required this.save,
    required this.cancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add new expanse"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Expense name"),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: dollarController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Dollars"),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: centsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Cents"),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        MaterialButton(
          onPressed: cancel,
          color: Colors.red[900],
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        MaterialButton(
          onPressed: save,
          color: Colors.green[600],
          child: const Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
