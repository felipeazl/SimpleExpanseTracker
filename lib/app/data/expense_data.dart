import 'package:flutter/material.dart';
import 'package:simple_expense_tracker/app/data/hive_database.dart';
import 'package:simple_expense_tracker/app/helpers/date_time_helper.dart';
import 'package:simple_expense_tracker/app/models/expense_item.dart';

class ExpenseData extends ChangeNotifier {
  //Lista de todas as despesas
  List<ExpenseItem> overallExpenseList = [];

  //GET lista de despesas
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  //Link com HiveDB
  final db = Database();
  prepareData() {
    if (db.readData().isNotEmpty) {
      overallExpenseList = db.readData();
    }
  }

  //ADD nova despesa
  addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  //DELETE despesa
  deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  //GET dia da semana do objeto datetime
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thur";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "";
    }
  }

  //GET dia inicial da semana (domingo)
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //GET dia atual
    DateTime today = DateTime.now();

    //Achar domingo a partir do dia atual
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == "Sun") {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  /* Converte:

  overallExpenseList = [
    [item, 2023/04/25, $10],
  ]

  ->

  dailyExpenseSummary = [
    [20230425: $10]
  ]

  */
  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.date);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
