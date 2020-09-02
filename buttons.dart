import 'package:firestore_app/linux.dart';
import 'package:firestore_app/retrieve.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'store.dart';
import 'main.dart';

fget() async {

    var d = await fs.collection("whoaks").get();
//    print(d.docs[1].data());

    for (var i in d.docs) {
      print(i.data());
    }
    
  }

class PushButton extends StatelessWidget {
  Widget build(BuildContext context) {

      return Center(
        child: Container(
          margin: EdgeInsets.only(top:10 , bottom:20),
          child: RaisedButton(
            onPressed: () {
              print('pushed');
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Store(),));
            },
            padding: EdgeInsets.all(0),
            child: Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    
                  Colors.black ,
                  Color(0xFF0D47A1),
                    Colors.black
                  ]
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text("Click to Store Records in Filestore" ,
              style: TextStyle(fontSize: 25 , color: Colors.white , fontWeight: FontWeight.bold)),
            ),
          ) ,
        ),
      );

  }
}

class PullButton extends StatelessWidget {
  Widget build (BuildContext context) {
    
      return Center(
        child: Container(
          margin: EdgeInsets.only(top:10),
          child: RaisedButton(
            onPressed: () {
              fget();
              print('pulled');
          //    Navigator.push(context,
           //   MaterialPageRoute(builder: (context) => Retrieve(),));
            },
            padding: EdgeInsets.all(0),
            child: Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    Colors.black,
                    Color(0xFF0D47A1),
                    //Color(0xFF1976D2),
                    Colors.black
                  ]
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text("Click to Retrieve Records from Filestore" ,
              style: TextStyle(fontSize: 21 , color: Colors.white , fontWeight: FontWeight.bold)),
            ),
          ) ,
        ),
      );
  }
}

class LinuxButton extends StatelessWidget {
  Widget build (BuildContext context) {
    
      return Center(
        child: Container(
          margin: EdgeInsets.only(top:30 , left: 15 , right: 15 , bottom: 15),
          child: RaisedButton(
            onPressed: () {
              //fget();
              print('Run Linux Command');
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Linux(),));
            },
            padding: EdgeInsets.all(0),
            child: Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    Colors.black ,
                    Color(0xFF0D47A1),
                    //Color(0xFF1976D2),
                    Colors.black
                  ]
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text("Run Linux Command and store in the database" ,
              style: TextStyle(fontSize: 21 , color: Colors.white , fontWeight: FontWeight.bold)),
            ),
          ) ,
        ),
      );
  }
}
