// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  final String amount;
  void Function(BuildContext)? delete;

  ExpenseTile(
      {super.key,
      required this.title,
      required this.dateTime,
      required this.amount,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: delete,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade600,
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(
              onPressed: (p0) {},
              icon: Icons.settings,
              backgroundColor: Colors.green.shade700,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[900],
          ),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              "${dateTime.day} / ${dateTime.month} / ${dateTime.year}",
              style: TextStyle(color: Colors.grey[500]),
            ),
            trailing: Text(
              "\$$amount",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
