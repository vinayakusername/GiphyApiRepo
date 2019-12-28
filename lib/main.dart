import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

Future<String> fetchGet() async {
  final response = await http.get(
    'https://api.giphy.com/v1/gifs/search?api_key= + "afa4ab04efd640d386593c253a02fa5f" + "&q=" + "cat" + "&limit=1"',
    headers: {HttpHeaders.authorizationHeader: "afa4ab04efd640d386593c253a02fa5f"},
  );

 if (response.statusCode == 200) {
    
   final responseJson = json.decode(response.body);
   print(responseJson.data);

  } else {
    
    throw Exception('Failed to load post');
  }
}



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 

  @override
  void initState() {
    super.initState();
    fetchGet();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
       ),
      );
  }
}


