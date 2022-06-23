import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/const.dart';

import '../targetPreferenc_pege/TargetPreferencScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 入力されたメールアドレス
  String loginUserEmail = "";
  // 入力されたパスワード
  String loginUserPassword = "";
  // 登録・ログインに関する情報を表示
  String logininfoText = "";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text(
          'ログイン',
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
                  // テキスト入力のラベルを設定
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
                      loginUserEmail = value;
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
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      loginUserPassword = value;
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
                primary: Color(COLOR_PRIMARY),
                padding: const EdgeInsets.only(top: 7, bottom: 7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Color(COLOR_PRIMARY),
                    )),
              ),
              child: const Text(
                'ログインする',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFAFAFA),
                ),
              ),
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: loginUserEmail, password: loginUserPassword);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TargetPreferenceScreen()),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
