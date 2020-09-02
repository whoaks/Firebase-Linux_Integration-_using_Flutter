import 'package:flutter/material.dart';
import 'package:http/http.dart'as  http;
import 'home.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Linux extends StatefulWidget {
   MyLinux createState() => MyLinux();
}

class MyLinux extends State<Linux> {
  var cmd;
  var webdata;

  myweb(cmd) async {
    var url = "http://192.168.43.86/cgi-bin/linux_cmd.py?x=${cmd}";
    var r = await http.get(url);
    setState(() {
      webdata = r.body;
    });
    var d= fs.collection("whoaks").add(
      {
        '$cmd' : '$webdata' ,
      }
    );
  }
  Widget build(BuildContext context) {
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
                    margin: EdgeInsets.all(20),
                    color: Colors.amber,
              padding: EdgeInsets.all(10),
              child: Text('Run Linux Command',
              style: TextStyle(
                fontSize: 20 ,
                color: Colors.black , 
                fontWeight: FontWeight.bold,
            ),
              ),
                  ),
            Card(
                              child: TextField(
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintText: 'linux command',
                                  
                                  hoverColor: Colors.blue , 
                                  icon: Icon(FontAwesomeIcons.linux , size: 40,) ,
                                ),
                  onChanged: (value) {
                    cmd = value;
                  },
                ),
              ),
              FlatButton(
                  onPressed: () {
                    myweb(cmd);
                  },
              child: Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    Colors.black,
                    Color(0xFF42A5F5),
                    Colors.black,
                  ]
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text('Click Here' ,
              style: TextStyle(fontSize: 30 , color: Colors.white)),
            ),),
              Container(
                 margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [
        //0.1,
        0.4,
        0.6,
        0.9
      ] ,
    colors: [
     // Colors.yellow,
      Colors.red[900],
      Colors.purple[600],
      Colors.deepPurple[900],
    ]),),
    child: Text(webdata ?? "output is coming .." ,
                  style: TextStyle(fontSize: 15 ,
                   color: Colors.white ,
                    fontWeight: FontWeight.bold)),
               ),
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
