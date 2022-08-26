import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class aboutPage extends StatelessWidget {
  const aboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(150.0),
              child: Image.asset('images/kafinoonoo.png'),
            ),
            Container(
              child: Text(
                'Kafinoonoo Dictionary',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                'Developer: Abel Abebe',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              child: Text(
                'abelabebe313@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              child: Text(
                'Telegram: abelabebe313',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
