import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simple_expense_tracker/app/app.dart';
import 'package:simple_expense_tracker/app/data/expense_data.dart';

void main() async {
  //Inicializar hive
  await Hive.initFlutter();

  //Abrir hive box
  await Hive.openBox("expense_database");

  runApp(
    ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => const App(),
    ),
  );
}
