import 'package:aregon/home.dart';
import 'package:aregon/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String message = '';
  int status = 3;

  Future<void> signIn() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    final Uri uri = Uri.parse('http://www.motosikletci.com/api/oturum-test')
        .replace(queryParameters: {
      'email': email,
      'sifre': password,
    });

    final response = await http.post(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      message = data['mesaj'];
      status = data['durum'];

      if (status == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } else {
      final Map<String, dynamic> data = json.decode(response.body);
      message = data['mesaj'];
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Column(children: [
      Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('logo.png')),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 250.0),
        ),
      ),
      SizedBox(
        height: 150,
      ),
      inputStyle("Email", "Lütfen mail adresinizi giriniz.", emailController),
      SizedBox(
        height: 20,
      ),
      inputStyle("Şifre", "Lütfen şifrenizi giriniz.", passwordController),
      SizedBox(
        height: 60,
      ),
      Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: () {
            signIn();
          },
          child: Text(
            "ÜYE GİRİŞİ",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      SizedBox(height: 5),
      Text(
        message,
        style: TextStyle(color: Colors.grey),
      ),
      SizedBox(
        height: 20,
      ),
    ]);
  }
}

Widget inputStyle(
    String title, String hinTxt, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 5, 20, 10),
    child: Row(
      children: [
        Text(
          "$title :",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: hinTxt),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget inputStyleSave(
    String title, String hinTxt, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
    child: Row(
      children: [
        Text(
          "$title :",
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            height: 35,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: hinTxt),
            ),
          ),
        ),
      ],
    ),
  );
}
