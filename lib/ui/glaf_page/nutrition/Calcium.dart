import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../model/GlafData.dart';

class Calcium extends StatelessWidget {
  const Calcium({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 9, bottom: 5),
              width: size.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'カルシウム',
                    style: TextStyle(fontSize: 12),
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 10),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "65",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            TextSpan(
                                text: ' / 109',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "不足", style: TextStyle(fontSize: 12)),
                            TextSpan(
                                text: ' 129',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            TextSpan(
                                text: 'mg', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        RotatedBox(
          quarterTurns: 1,
          child: SizedBox(
            width: 10,
            height: 360,
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
                            calciumBarData(),
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
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
        ),
      ],
    );
  }
}
