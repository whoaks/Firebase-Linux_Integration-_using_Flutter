import 'package:flutter/material.dart';
import 'package:http/http.dart'as  http;
import 'home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';

class Store extends StatefulWidget {
   Storerecord createState() => Storerecord();
}

var value2;

class Storerecord extends State<Store> {
  var cmd;

  var mymap=Map();


  myweb(cmd , value2 ) async {
    var d = await fs.collection("whoaks").add(
      {
        '$cmd' : '$value2' ,
      }
    );

  }

  Widget build(BuildContext context) {

    

    card1() {
      return Card(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'key',
                                  hoverColor: Colors.blue , 
                                  icon: Icon(FontAwesomeIcons.key , size: 40,) ,
                                ),
                  onChanged: (value) {
                    cmd = value;
                  },
                ),
              );
    }

    card2() {
      return Card(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'value',
                                  hoverColor: Colors.blue , 
                                  icon: Icon(Icons.date_range , size: 40,) ,
                                ),
                  onChanged: (value) {
                    value2 = value;
                  },
                ),
              );
              
    }

    Button() {
      return FlatButton(
                  onPressed: () {
                  myweb(cmd , value2);
                
                  },
              child: Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    Colors.black,
                    //Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                    Colors.black,
                  ]
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text('Submit' ,
              style: TextStyle(fontSize: 30 , color: Colors.white)),
            ),);
    }
Button2() {
      return FlatButton(
                  onPressed: () {
               mymap["$cmd"]="$value2";
               print(mymap);
                  },
              child: Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    Colors.red,
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                    //Colors.black,
                  ]
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text('Add one more key' ,
              style: TextStyle(fontSize: 15 , color: Colors.white)),
            ),);
    }
    return DefaultTextStyle(
      
      style: Theme.of(context).textTheme.bodyText1,


      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.amber,
              padding: EdgeInsets.all(10),
              child: Text('Store Records in filestore using Flutter',
              style: TextStyle(
                fontSize: 20 ,
                color: Colors.black , 
                fontWeight: FontWeight.bold,
            ),
              ),
                  ),

                  
                  card1(),
                card2(),
                Button(),
               HomePage(),    
                 ],
              ),
            ),
          );
        },
      ),
    );
  }
}
