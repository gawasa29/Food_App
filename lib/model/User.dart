import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//StateProviderは外部から変更可能な値を公開できるProvider
final userModelProvider = StateProvider((ref) {
  return User();
});

class User with ChangeNotifier {
  String email;
  String weight;
  String targetWeight;
  String height;
  String userID;

  String targetCalories;
  String targetProtein;
  String targetFat;
  String targetCarbo;
  String currentCalories;
  String currentProtein;
  String currentFat;
  String currentCarbo;

  User({
    this.email = "",
    this.weight = "",
    this.targetWeight = "",
    this.height = "",
    this.userID = "",
    this.targetCalories = "",
    this.targetProtein = "",
    this.targetFat = "",
    this.targetCarbo = "",
    this.currentCalories = "0",
    this.currentProtein = "0",
    this.currentFat = "0",
    this.currentCarbo = "0",
  });

  //Firebaseからデータを取得する際の変換処理
  User.fromJson(Map<String, dynamic> json)
      : this(
          email: json['email'],
          weight: json['weight'],
          targetWeight: json['targetWeight'],
          height: json['height'],
          userID: json['userID'],
          targetCalories: json['targetCalories'],
          targetProtein: json['targetProtein'],
          targetFat: json['targetFat'],
          targetCarbo: json['targetCarbo'],
          currentCalories: json['currentCalories'],
          currentProtein: json['currentProtein'],
          currentFat: json['currentFat'],
          currentCarbo: json['currentCarbo'],
        );

  //DartのオブジェクトからFirebaseへ渡す際の変換処理
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'weight': weight,
      'targetWeight': targetWeight,
      "height": height,
      'userID': userID,
      "targetCalories": targetCalories,
      'targetProtein': targetProtein,
      'targetFat': targetFat,
      "targetCarbo": targetCarbo,
      "currentCalories": currentCalories,
      'currentProtein': currentProtein,
      'currentFat': currentFat,
      "currentCarbo": currentCarbo,
    };
  }
}
