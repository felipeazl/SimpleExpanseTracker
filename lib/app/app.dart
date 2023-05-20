import 'package:flutter/material.dart';
import 'package:simple_expense_tracker/app/pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.grey[900]),
      home: const HomePage(),
    );
  }
}
