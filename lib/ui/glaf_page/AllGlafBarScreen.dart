import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../model/GlafData.dart';
import 'nutrition/Calcium.dart';
import 'nutrition/Cholesterol.dart';
import 'nutrition/DietaryFiber.dart';
import 'nutrition/Iron.dart';
import 'nutrition/Potassium.dart';
import 'nutrition/Sodium.dart';
import 'nutrition/SugarBar.dart';
import 'nutrition/VitaminA.dart';
import 'nutrition/VitaminC.dart';

////////////////////////////////////////////////////////////////////////
///////////////////////////さらに表示の先の画面/////////////////////////////
///////////////////////////////////////////////////////////////////////

class AllGlafBar extends StatefulWidget {
  const AllGlafBar({Key? key, required this.progressValue}) : super(key: key);
  final double progressValue;

  @override
  State<AllGlafBar> createState() => _AllGlafBarState();
}

class _AllGlafBarState extends State<AllGlafBar> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text(
          '栄養グラフ',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: const Text(
                          'カロリー',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 180,
                        width: 180,
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 1000,
                              showLabels: false,
                              showTicks: false,
                              radiusFactor: 0.8,
                              axisLineStyle: const AxisLineStyle(
                                thickness: 0.17,
                                cornerStyle: CornerStyle.bothCurve,
                                color: Color.fromARGB(30, 100, 100, 100),
                                thicknessUnit: GaugeSizeUnit.factor,
                              ),
                              pointers: const <GaugePointer>[
                                RangePointer(
                                    value: 450,
                                    cornerStyle: CornerStyle.bothCurve,
                                    enableAnimation: true,
                                    animationDuration: 1200,
                                    animationType: AnimationType.ease,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    gradient: SweepGradient(colors: <Color>[
                                      Color.fromRGBO(253, 216, 53, 1),
                                      Color.fromRGBO(255, 167, 38, 1),
                                    ], stops: <double>[
                                      0.25,
                                      0.75
                                    ]),
                                    color: Color(0xFF00A8B5),
                                    width: 0.22),
                              ],
                              annotations: const <GaugeAnnotation>[
                                GaugeAnnotation(
                                  positionFactor: 0.1,
                                  angle: 90,
                                  widget: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "100",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                        TextSpan(
                                            text: ' / 1000\n不足500Kcal',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                )
                              ])
                        ]),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PFCバランス',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 9, bottom: 2),
                        width: 175,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'タンパク質',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "65",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  TextSpan(
                                      text: ' / 109',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: SizedBox(
                          width: 10,
                          height: 180,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Card(
                              elevation: 0,
                              color: const Color(0xffFAFAFA),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                        child: BarChart(
                                          mainBarData(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                        width: 175,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "不足",
                                      style: TextStyle(fontSize: 12)),
                                  TextSpan(
                                      text: ' 35',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  TextSpan(
                                      text: 'g',
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 175,
                        padding: const EdgeInsets.only(top: 10, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '脂質',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "56",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  TextSpan(
                                      text: ' / 81',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: SizedBox(
                          width: 10,
                          height: 180,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Card(
                              elevation: 0,
                              color: const Color(0xffFAFAFA),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                        child: BarChart(fatmainBarData()),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                        width: 175,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "不足",
                                      style: TextStyle(fontSize: 12)),
                                  TextSpan(
                                      text: ' 25',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  TextSpan(
                                      text: 'g',
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 175,
                        padding: const EdgeInsets.only(top: 10, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '炭水化物',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "356",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  TextSpan(
                                      text: ' / 435',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: SizedBox(
                          width: 10,
                          height: 180,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Card(
                              elevation: 0,
                              color: const Color(0xffFAFAFA),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                        child: BarChart(
                                          carbohydratemainBarData(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                        width: 175,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "不足",
                                      style: TextStyle(fontSize: 12)),
                                  TextSpan(
                                      text: ' 129',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  TextSpan(
                                      text: 'g',
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 5,
                  left: 10,
                ),
                child: const Text(
                  '栄養素',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
              padding: const EdgeInsets.only(
                  top: 10, bottom: 15, left: 22, right: 13),
              child: Column(children: const [
                Sugar(),
                DietaryFiber(),
                Calcium(),
                VitaminA(),
                VitaminC(),
                Iron(),
                Cholesterol(),
                Sodium(),
                Potassium(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
