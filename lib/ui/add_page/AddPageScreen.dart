import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:food_app/ui/add_page/times_page/DinnerAdd.dart';

import 'myFood/MyFoodScreen.dart';
import 'times_page/LunchAdd.dart';
import 'times_page/MorningAdd .dart';
import 'times_page/SnackAdd.dart';

////////////////////////////////////////////////////////////////////////
////////////////////////////追加ページの大元///////////////////////////////
///////////////////////////////////////////////////////////////////////
class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text(
          '食事を追加する',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 10, left: 10),
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
                color: Colors.orange[100],
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.white,
                              onPrimary: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyFood()));
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  width: size.width * 0.35,
                                  height: size.height * 0.1,
                                ),
                                Text('MYフード')
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.white,
                              onPrimary: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Column(
                              children: [
                                SizedBox(
                                  width: size.width * 0.35,
                                  height: size.height * 0.1,
                                ),
                                Text('バーコード')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))),
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
                  '履歴',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              height: size.height * 0.5,
              // labelColor: Colors.orange[300],
              child: ContainedTabBarView(
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  const Text(
                    '朝食',
                    style: TextStyle(color: Colors.black87),
                  ),
                  const Text(
                    '昼食',
                    style: TextStyle(color: Colors.black87),
                  ),
                  const Text(
                    '夕食',
                    style: TextStyle(color: Colors.black87),
                  ),
                  const Text(
                    '間食',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
                tabBarProperties: const TabBarProperties(
                  height: 35.0,
                  indicatorColor: Color.fromRGBO(255, 183, 77, 1),
                  indicatorWeight: 6.0,
                ),
                views: const [
                  MorningAdd(),
                  LunchAdd(),
                  DinnerAdd(),
                  SnackAdd(),
                ],
                onChange: (index) => print(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
