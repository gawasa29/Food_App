class Food {
  String name;
  String amount;
  String calories;
  String protein;
  String fat;
  String carbo;

  Food(
      {this.name = '',
      this.amount = '',
      this.calories = '',
      this.protein = '',
      this.fat = '',
      this.carbo = ''});

  //Firebaseからデータを取得する際の変換処理
  Food.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          amount: json['amount'],
          calories: json['calories'],
          protein: json['protein'],
          fat: json['fat'],
          carbo: json['carbo'],
        );

  //DartのオブジェクトからFirebaseへ渡す際の変換処理
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      "calories": calories,
      'protein': protein,
      "fat": fat,
      'carbo': carbo,
    };
  }
}
