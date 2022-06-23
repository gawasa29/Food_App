import 'package:flutter/material.dart';

import '../addFoodData/AddFoodDataScreen.dart';
import '../SerchFoodDataScreen.dart';

class LunchAdd extends StatelessWidget {
  const LunchAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddFoodData()));
                  },
                  child: Row(
                    children: [
                      const Expanded(
                        child: ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SerchFoodData()));
                        },
                        icon: const Icon(
                          Icons.control_point_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Expanded(
                        child: ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.control_point_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddFoodData()));
                  },
                  child: Row(
                    children: [
                      const Expanded(
                        child: ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.control_point_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    ],
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
