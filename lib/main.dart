import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/ui/auth/AuthScreen.dart';

import 'firebase_options.dart';

//RouteObserverのやつ
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
void main() async {
//クラウドファイアストアのやつ
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //flutterfire_cliで追加されたfirebase_options.dartのためにいる。
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //RouteObserverのやつ
      navigatorObservers: [routeObserver],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AuthScreen(),
    );
  }
}
