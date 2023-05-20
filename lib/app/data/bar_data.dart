// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:simple_expense_tracker/app/models/individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<IndividualBar> barData = [];

  //Inicializar os dados do gráfico
  initializeBarData() {
    barData = [
      //sun
      IndividualBar(x: 0, y: sunAmount),
      //sun
      IndividualBar(x: 1, y: monAmount),
      //sun
      IndividualBar(x: 2, y: tueAmount),
      //sun
      IndividualBar(x: 3, y: wedAmount),
      //sun
      IndividualBar(x: 4, y: thurAmount),
      //sun
      IndividualBar(x: 5, y: friAmount),
      //sun
      IndividualBar(x: 6, y: satAmount),
    ];
  }
}
