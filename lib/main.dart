import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

Future<void> fetchGet() async {
  final response = await http.get(
    'https://api.giphy.com/v1/gifs/trending?api_key=BdTW4i1iwoMKZxqvte5Wjm3ISE1W16fi&limit=5&rating=G',
    headers: {HttpHeaders.authorizationHeader: "BdTW4i1iwoMKZxqvte5Wjm3ISE1W16fi"},
  );

 if (response.statusCode == 200) {
    
   final responseJson = json.decode(response.body);
   print(responseJson.data);

  } else {
    
    throw Exception('Failed to get response');
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


