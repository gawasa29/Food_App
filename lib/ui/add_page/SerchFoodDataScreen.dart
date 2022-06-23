import 'package:flutter/material.dart';

import 'addFoodData/AddFoodDataScreen.dart';

////////////////////////////////////////////////////////////////////////
////////////////////////////検索後のページ////////////////////////////////
///////////////////////////////////////////////////////////////////////
///ただどうやって反応させるかわからんかったから放置
class SerchFoodData extends StatefulWidget {
  const SerchFoodData({Key? key}) : super(key: key);

  @override
  State<SerchFoodData> createState() => _SerchFoodDataState();
}

class _SerchFoodDataState extends State<SerchFoodData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text(
          '食品データ',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
            child: const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(1),
                labelText: "検索する",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    )),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xffFAFAFA),
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 570,
            // labelColor: Colors.orange[300],
            child: tabmenu(),
          ),
        ],
      )),
    );
  }

  Container tabmenu() {
    return Container(
      child: Container(
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
                                    builder: (context) =>
                                        const SerchFoodData()));
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
      ),
    );
  }
}
