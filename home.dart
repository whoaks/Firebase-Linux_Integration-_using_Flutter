import 'package:flutter/material.dart';
import 'main.dart';

dec() {
  return  Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ]
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text('Back to Home Page' ,
              style: TextStyle(fontSize: 20 , color: Colors.white)),
            );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyApp()) );
      },
      padding: EdgeInsets.all(0),
      child: dec(),
      );
  }
}
