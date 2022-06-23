import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/services/FirebaseHelper.dart';

class MorningAdd extends StatelessWidget {
  const MorningAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<dynamic>(
          future: FireStoreUtils.getFoodData(), // 👈 非同期なデータ
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                //ローディングなどの待ち時間に表示することが多いグルグルです。
                return const CircularProgressIndicator();
              } else {
                List nameList =
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return data['name']; // 👈 field from your document
                }).toList();
                return ListView.builder(
                  itemCount: nameList.length, // 👈 リストの数を指定
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        nameList[index], // 👈indexはfor in 文みたいにlistの中身を繰り返し取得
                        style: const TextStyle(
                            color: Colors.black, fontSize: 18.0),
                      ),
                      onTap: () {
                        print("onTap called.");
                      }, // タップ
                      onLongPress: () {
                        print("onLongTap called.");
                      }, // 長押し
                    );
                  },
                );
              }
              // 通信が失敗した場合
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            //ローディングなどの待ち時間に表示することが多いグルグルです。
            return const CircularProgressIndicator();
          }),
    );
  }
}
