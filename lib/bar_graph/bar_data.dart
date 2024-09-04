import 'package:b/bar_graph/individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double frimount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.frimount,
    required this.satAmount,
  });

  List<IndividualBar> barData = [];

  void initializedBarData() {
    barData = [
      IndividualBar(x: 0, y: sunAmount),
      IndividualBar(x: 1, y: monAmount),
      IndividualBar(x: 2, y: tueAmount),
      IndividualBar(x: 3, y: wedAmount),
      IndividualBar(x: 4, y: thurAmount),
      IndividualBar(x: 5, y: frimount),
      IndividualBar(x: 6, y: satAmount),
    ];
  }
}
