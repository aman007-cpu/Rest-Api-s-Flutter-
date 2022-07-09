import 'dart:convert';
import 'dart:html';

import 'package:apiapp/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  var data;
  Future<void> getUserApi() async {
    final respones =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (respones.statusCode == 200) {
      data = jsonDecode(respones.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API COURSE"),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [],
                      ),
                    );
                  });
                }
              })
        ],
      ),
    );
  }
}
