import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////
//////////////////////////////カレンダー画面///////////////////////////////
///////////////////////////////////////////////////////////////////////
///まだ未定なので放置
class calendar extends StatelessWidget {
  const calendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFAFAFA),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black87,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    '2022年 3月 21日',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Icon(
                    Icons.expand_more_outlined,
                    color: Colors.black87,
                  )
                ],
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
