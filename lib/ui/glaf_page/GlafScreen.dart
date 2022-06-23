import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/model/User.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../model/GlafData.dart';
import 'AllGlafBarScreen.dart';

////////////////////////////////////////////////////////////////////////
///////////////////////////Home画面のグラフ///////////////////////////////
///////////////////////////////////////////////////////////////////////
class glaf extends ConsumerStatefulWidget {
  const glaf({Key? key, required this.progressValue}) : super(key: key);
  final double progressValue;

  @override
  ConsumerState<glaf> createState() => _glafState();
}

class _glafState extends ConsumerState<glaf> {
  int touchedIndex = -1;

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(userModelProvider);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: const Text(
                      'カロリー',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  //↓ 円の大きさ
                  SizedBox(
                    height: 180,
                    width: 180,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                          minimum: 0,
                          //↓ 円の最大量（人によって変化する部分）
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
                                //↓ 食べた総カロリー（人によって変化する部分）
                                //なぜか数字が小さいと角張るけどわからんかったから放置
                                value: 200,
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
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              positionFactor: 0.1,
                              angle: 90,
                              widget: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                        //↓ 食べた総カロリー（人によって変化する部分）
                                        text: "100",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                    TextSpan(
                                        //↓ 円の最大量（人によって変化する部分）と不足分
                                        text:
                                            '${currentUser.targetCalories}\n不足500Kcal',
                                        // ('${user.lastName} ブロックしました。'.tr()) ' / 1000\n不足500Kcal',
                                        style: const TextStyle(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                                  //各人によって変わる数値//////////////////////////////////////////////
                                  text: "6",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  //各人によって変わる数値////////////////////////////////////////////////
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  text: "不足", style: TextStyle(fontSize: 12)),
                              TextSpan(
                                  //各人によって変わる数値//////////////////////////////////////////////////////////////
                                  text: ' 500',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: 'g', style: TextStyle(fontSize: 12)),
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
                                  text: "100",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: ' / 1000',
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  text: "不足", style: TextStyle(fontSize: 12)),
                              TextSpan(
                                  text: ' 500',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: 'g', style: TextStyle(fontSize: 12)),
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
                                  text: "100",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: ' / 1000',
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  text: "不足", style: TextStyle(fontSize: 12)),
                              TextSpan(
                                  text: ' 500',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: 'g', style: TextStyle(fontSize: 12)),
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
          SizedBox(
            height: 33,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              //ここがNUllで通らんくて１入れたら通った。よくわからんかったから頼むorz
                              builder: (context) => const AllGlafBar(
                                    progressValue: 1,
                                  )));
                    },
                    child: const Text('さらに表示 >'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
