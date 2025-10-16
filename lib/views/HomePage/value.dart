import 'package:flutter/material.dart';

class value extends StatelessWidget {
  const value({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Column(
        children: [
          Row(children: [Text('heloo')]),
          Text('hello'),
        ],
      ),
    );
  }
}
