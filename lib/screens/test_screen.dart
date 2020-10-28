import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Container(
            //   height: 200,
            //   width: 200,
            //   decoration:
            //       ShapeDecoration(shape: CircleBorder(), color: Colors.blue),
            // ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 100,
                width: 100,
                decoration:
                    ShapeDecoration(shape: CircleBorder(), color: Colors.amber),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
