import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////////////
//////////////////////////////課金画面//////////////////////////////////
//////////////////////////////////////////////////////////////////////
class Billing extends StatelessWidget {
  const Billing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      color: const Color(0xffFAFAFA),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        const Text(
          'バーコードで検索機能を追加！',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Text(
          'Fitness GOLDに登録してバーコードで楽々検索しましょう！',
          style: TextStyle(color: Colors.grey[700], fontSize: 11),
        ),
        ElevatedButton(
          child: const Text(
            'Fitness GOLDに登録',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange[400],
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
        ),
      ]),
    );
  }
}
