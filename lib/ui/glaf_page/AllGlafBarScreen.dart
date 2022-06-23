import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:food_app/ui/glaf_page/GlafScreen.dart';
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
  double progressValue = 0;
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
            glaf(progressValue: progressValue),
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
