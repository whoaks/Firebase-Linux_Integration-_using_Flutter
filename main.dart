import 'package:firestore_app/store.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'url.dart';
import 'buttons.dart';
import 'topic.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:random_color/random_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}
var fs;
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  Title() {
  return Text(
    'Linux - Firebase App',
    style: TextStyle(
      fontSize: 25,
      color: Colors.black ,
      fontWeight: FontWeight.bold ,
      ) ,
    );
}

Leading_Icon() {
  return Image.network(
    'https://raw.githubusercontent.com/whoaks/Firebase_Integration_Flutter/master/firebase.JPG',
    );
}
   MyAppBar() {
    return AppBar(
      backgroundColor: Colors.cyanAccent,
      title: Title(),
      leading: Leading_Icon(),
      actions: <Widget>[
        Linkedin() ,
      ],
    );
  }
  MyHome() {
    return Scaffold(
      appBar: MyAppBar() ,
      backgroundColor: Colors.red[900],     
      body: Column(
          children: <Widget>[
          Topic("Linux Integration Flutter and Storing values in FileStore GCP Cloud" , 25.0) ,
          PushButton() ,
          PullButton() ,
          LinuxButton(),
          Firestore_url(),
          Topic("Created by Akash Pandey" , 25.0 , ) ,
        ],),
    );
  }
    fs=FirebaseFirestore.instance;
    return MaterialApp(
      home: MyHome(),
      debugShowCheckedModeBanner: false,
      );
  }
}
