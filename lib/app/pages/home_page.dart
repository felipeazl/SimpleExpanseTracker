import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_expense_tracker/app/data/expense_data.dart';
import 'package:simple_expense_tracker/app/models/expense_item.dart';
import 'package:simple_expense_tracker/app/widgets/expense_summary.dart';
import 'package:simple_expense_tracker/app/widgets/expense_tile.dart';
import 'package:simple_expense_tracker/app/widgets/new_expense.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TextControllers
  final _newExpenseNameController = TextEditingController();
  final _newExpenseDollarController = TextEditingController();
  final _newExpenseCentsController = TextEditingController();

  @override
  initState() {
    super.initState();
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  //ADD nova despesa
  addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => NewExpense(
        nameController: _newExpenseNameController,
        dollarController: _newExpenseDollarController,
        centsController: _newExpenseCentsController,
        save: saveNewExpense,
        cancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  //SAVE nova despesa
  saveNewExpense() {
    String amount =
        "${_newExpenseDollarController.text}.${_newExpenseCentsController.text}";

    ExpenseItem newExpense = ExpenseItem(
      name: _newExpenseNameController.text,
      amount: amount,
      date: DateTime.now(),
    );

    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
    _newExpenseNameController.clear();
    _newExpenseDollarController.clear();
    _newExpenseCentsController.clear();
    Navigator.of(context).pop();
  }

  //DELETE despesa
  deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[500],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          backgroundColor: Colors.grey[900],
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ExpenseSummary(startOfWeek: value.startOfWeekDate()),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.getAllExpenseList().length,
                  itemBuilder: (context, index) => ExpenseTile(
                    title: value.getAllExpenseList()[index].name,
                    dateTime: value.getAllExpenseList()[index].date,
                    amount: value.getAllExpenseList()[index].amount,
                    delete: (p0) => deleteExpense(
                      value.getAllExpenseList()[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
