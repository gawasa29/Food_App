import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/const.dart';

import '../targetPreferenc_pege/TargetPreferencScreen.dart';

// 入力されたメールアドレス
String newUserEmail = "";
// 入力されたパスワード
String newUserPassword = "";
// 登録・ログインに関する情報を表示
String infoText = "";

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text(
          'アカウントを作成',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 15,
                left: 15,
              ),
              child: const Text(
                'メールアドレス',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 20,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "メールアドレス",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(COLOR_PRIMARY),
                      ),
                    ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      newUserEmail = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 15,
                left: 15,
              ),
              child: const Text(
                'パスワード',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 20,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "パスワード（６文字以上）",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(COLOR_PRIMARY),
                      ),
                    ),
                  ),
                  // パスワードが見えないようにする
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      newUserPassword = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: 300,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(COLOR_PRIMARY),
                padding: const EdgeInsets.only(top: 7, bottom: 7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Color(COLOR_PRIMARY),
                    )),
              ),
              child: const Text(
                'アカウントを作成する',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFAFAFA),
                ),
              ),
              onPressed: () async {
                try {
                  // メール/パスワードでユーザー登録
                  final UserCredential result = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: newUserEmail,
                    password: newUserPassword,
                  );
                  //メール確認コード
                  await FirebaseAuth.instance.currentUser!
                      .sendEmailVerification();
                  // 登録したユーザー情報
                  final User user = result.user!;
                  print(user);
                  setState(() {
                    infoText = "登録OK：${user.email}";
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TargetPreferenceScreen()),
                  );
                } catch (e) {
                  // 登録に失敗した場合
                  print(e);
                  setState(() {
                    infoText = "失敗しました";
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
