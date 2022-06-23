import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:food_app/const.dart';

int touchedIndex = -1;

////////////////////////////////////////////////////////////////////////
///////////////////全ての栄養素のグラフが格納されている////////////////////////
//////////////////////////////////////////////////////////////////////
final _barsGradient = const LinearGradient(
  colors: [
    Color(COLOR_SUBCOLOR),
    Color(COLOR_PRIMARY),
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);

////////////////////////////////////////////////////////////////////////
//////////////////////////////タンパク質///////////////////////////////////
////////////////////////////////////////////////////////////////////////
BarChartGroupData makeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  //線の太さ
  double width = 12,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          //↓線の最大値////////////////////////////////////////////////////////////////////
          toY: 109,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> showingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          /////////////////////////↓1日に摂取した量//////////////////////////////////////////////////////////////
          return makeGroupData(0, 65, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData mainBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: showingGroups(),
    gridData: FlGridData(show: false),
  );
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////脂質/////////////////////////////////////
////////////////////////////////////////////////////////////////////////
BarChartGroupData fatmakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 12,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 81,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> fatshowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return fatmakeGroupData(0, 56, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData fatmainBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: fatshowingGroups(),
    gridData: FlGridData(show: false),
  );
}

////////////////////////////////////////////////////////////////////////
//////////////////////////////炭水化物///////////////////////////////////
////////////////////////////////////////////////////////////////////////
BarChartGroupData carbohydratemakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 12,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 435,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> carbohydrateshowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return carbohydratemakeGroupData(0, 356,
              isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData carbohydratemainBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: carbohydrateshowingGroups(),
    gridData: FlGridData(show: false),
  );
}

////////////////////////////////////////////////////////////////////////
//////////////////////////////糖質///////////////////////////////////
////////////////////////////////////////////////////////////////////////
BarChartGroupData sugarmakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 4,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 435,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> sugarshowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return sugarmakeGroupData(0, 356, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData sugarBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: sugarshowingGroups(),
    gridData: FlGridData(show: false),
  );
}

///////////////////////////////////////////////////////////////////////
/////////////////////////////食物繊維///////////////////////////////////
//////////////////////////////////////////////////////////////////////
BarChartGroupData dietaryfibermakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 4,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 435,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> dietaryfibershowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return dietaryfibermakeGroupData(0, 356,
              isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData dietaryfiberBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: dietaryfibershowingGroups(),
    gridData: FlGridData(show: false),
  );
}

///////////////////////////////////////////////////////////////////////
/////////////////////////////カルシウム///////////////////////////////////
//////////////////////////////////////////////////////////////////////
BarChartGroupData calciummakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 4,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 435,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> calciumshowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return calciummakeGroupData(0, 356, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData calciumBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: calciumshowingGroups(),
    gridData: FlGridData(show: false),
  );
}

///////////////////////////////////////////////////////////////////////
/////////////////////////////ビタミンA///////////////////////////////////
//////////////////////////////////////////////////////////////////////
BarChartGroupData vitaminAmakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 4,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 435,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> vitaminAshowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return vitaminAmakeGroupData(0, 356, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData vitaminABarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: vitaminAshowingGroups(),
    gridData: FlGridData(show: false),
  );
}

///////////////////////////////////////////////////////////////////////
/////////////////////////////ビタミンB///////////////////////////////////
//////////////////////////////////////////////////////////////////////
BarChartGroupData vitaminBmakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 4,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 435,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> vitaminBshowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return vitaminBmakeGroupData(0, 356, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData vitaminBBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: vitaminBshowingGroups(),
    gridData: FlGridData(show: false),
  );
}

///////////////////////////////////////////////////////////////////////
///////////////////////////////鉄分////////////////////////////////////
//////////////////////////////////////////////////////////////////////
BarChartGroupData ironmakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 4,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 435,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> ironshowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return ironmakeGroupData(0, 356, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData ironBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: ironshowingGroups(),
    gridData: FlGridData(show: false),
  );
}

///////////////////////////////////////////////////////////////////////
////////////////////////////コレステロール/////////////////////////////////
//////////////////////////////////////////////////////////////////////
BarChartGroupData cholesterolmakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 4,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 435,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> cholesterolshowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return cholesterolmakeGroupData(0, 356, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData cholesterolBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: cholesterolshowingGroups(),
    gridData: FlGridData(show: false),
  );
}

///////////////////////////////////////////////////////////////////////
/////////////////////////////ナトリウム///////////////////////////////////
/////////////////////////////////////////////////////////////////////
BarChartGroupData sodiummakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 4,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 435,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> sodiumshowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return sodiummakeGroupData(0, 356, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData sodiumBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: sodiumshowingGroups(),
    gridData: FlGridData(show: false),
  );
}

///////////////////////////////////////////////////////////////////////
/////////////////////////////カリウム///////////////////////////////////
/////////////////////////////////////////////////////////////////////
BarChartGroupData potassiummakeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  double width = 4,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        gradient: _barsGradient,
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 435,
          color: Colors.grey[300],
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> potassiumshowingGroups() => List.generate(1, (i) {
      switch (i) {
        case 0:
          return potassiummakeGroupData(0, 356, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData potassiumBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: potassiumshowingGroups(),
    gridData: FlGridData(show: false),
  );
}
