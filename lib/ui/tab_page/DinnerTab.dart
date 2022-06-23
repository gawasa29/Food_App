import 'package:flutter/material.dart';

import '../foodData/FoodDataScreen.dart';

class DinnerTab extends StatelessWidget {
  const DinnerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const ListTile(
                  leading: Text(
                    '合計',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  trailing: Text(
                    '1036kcal',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FoodData()));
                  },
                  child: const ListTile(
                    title: Text(
                      '白米',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Text('100g', style: TextStyle(fontSize: 13)),
                    trailing: Text('336kcal'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FoodData()));
                  },
                  child: const ListTile(
                    title: Text(
                      '白米',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Text('100g', style: TextStyle(fontSize: 13)),
                    trailing: Text('336kcal'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FoodData()));
                  },
                  child: const ListTile(
                    title: Text(
                      '白米',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Text('100g', style: TextStyle(fontSize: 13)),
                    trailing: Text('336kcal'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
