import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/model/User.dart';
import 'package:food_app/services/FirebaseHelper.dart';

class MorningAdd extends ConsumerWidget {
  const MorningAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userModelProvider);
    return Container(
      child: FutureBuilder<dynamic>(
          future: FireStoreUtils.getFoodData(), // 👈 非同期なデータ
          builder: (BuildContext context, snapshot) {
            //ローディングなどの待ち時間に表示することが多いグルグルです。
            if (!snapshot.hasData) {
              return Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            //変数定義
            List nameList =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return data['name']; // 👈 field from your document
            }).toList();

            List calorieList =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return data['calories']; // 👈 field from your document
            }).toList();

            List carboList =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return data['carbo']; // 👈 field from your document
            }).toList();

            List fatList = snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return data['fat']; // 👈 field from your document
            }).toList();

            List proteinList =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return data['protein']; // 👈 field from your document
            }).toList();

            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                //ローディングなどの待ち時間に表示することが多いグルグルです。
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: nameList.length, // 👈 リストの数を指定
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        nameList[index], // 👈indexはfor in 文みたいにlistの中身を繰り返し取得
                        style: const TextStyle(
                            color: Colors.black, fontSize: 18.0),
                      ),
                      onTap: () async {
                        //長いけどただの足し算
                        currentUser.currentCalories =
                            (int.parse(currentUser.currentCalories) +
                                    int.parse(calorieList[index]))
                                .toString();

                        currentUser.currentCarbo =
                            (int.parse(currentUser.currentCarbo) +
                                    int.parse(carboList[index]))
                                .toString();

                        currentUser.currentFat =
                            (int.parse(currentUser.currentFat) +
                                    int.parse(fatList[index]))
                                .toString();

                        currentUser.currentProtein =
                            (int.parse(currentUser.currentProtein) +
                                    int.parse(proteinList[index]))
                                .toString();

                        await FireStoreUtils.updateCurrentUser(currentUser);
                      }, // タップ
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
