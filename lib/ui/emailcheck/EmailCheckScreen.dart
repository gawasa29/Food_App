//メール確認画面
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../signup/SignUpScreen.dart';
import '../targetPreferenc_pege/TargetPreferencScreen.dart';

class EmailCheckScreen extends StatefulWidget {
  const EmailCheckScreen({Key? key}) : super(key: key);
  @override
  _EmailCheckScreenState createState() => _EmailCheckScreenState();
}

class _EmailCheckScreenState extends State<EmailCheckScreen> {
  String _infoText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("メールアドレスの確認"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: newUserEmail,
                    password: newUserPassword,
                  );
                  //メール確認をできているか確認して処理分ける
                  if (userCredential.user!.emailVerified) {
                    setState(() {
                      _infoText = "確認が成功";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TargetPreferenceScreen()),
                      );
                    });
                  } else {
                    setState(() {
                      _infoText = "確認が終わっていません";
                    });
                  }
                } catch (e) {
                  print('NG');
                }
              },
              child: const Text('確認しました'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              child: Text(
                _infoText,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
