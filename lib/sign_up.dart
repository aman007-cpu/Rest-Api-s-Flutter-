import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passcontroler = TextEditingController();
  void login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("Account Created");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up Api"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: emailcontroler,
                decoration: InputDecoration(
                  hintText: 'Email',
                )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passcontroler,
                decoration: InputDecoration(
                  hintText: 'Password',
                )),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                login(emailcontroler.text.toString(),
                    passcontroler.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Sing Up")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
