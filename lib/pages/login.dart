// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hacker/pages/homepage.dart';
// import 'package:shop/pages/homepage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  TextEditingController loginID = TextEditingController();
  TextEditingController password = TextEditingController();

  bool checkValue() {
    String id = loginID.text.trim();
    String pass = password.text.trim();

    if (id == "" || pass == "") {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text("Alert"),
              content: const Text("Fill all fields."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          });
      return false;
    }

    return true;
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print("Login Successfully");
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const HomePage();
          }),
        );
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          Container(
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/log.jpg"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 484,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: loginID,
                        decoration: const InputDecoration(
                            labelText: "Email ID",
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // TextField(
                      //   controller: password,
                      //   obscureText: true,
                      //   decoration: const InputDecoration(
                      //     labelText: "Password",
                      //     labelStyle: TextStyle(
                      //         color: Colors.grey,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 15),
                      //   ),
                      // ),
                      TextField(
                        controller: password,
                        obscureText:
                            _obscureText, // Use a boolean variable to toggle the visibility
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          // Add the eye icon to toggle the password visibility
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText =
                                    !_obscureText; // Toggle the visibility
                              });
                            },
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  alignment: Alignment.topRight,
                  child: RichText(
                    text: TextSpan(
                      text: "Forgot Password?",
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          print("Can't change password.");
                        }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CupertinoButton(
                  onPressed: () {
                    if (checkValue()) {
                      login(loginID.text.toString(), password.toString());
                    }
                  },
                  color: Colors.blue,
                  child: const Text(
                      '                    Log In                   '),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {},
                  color: const Color.fromARGB(255, 237, 244, 252),
                  child: const Text(
                    '              Login with Google            ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "New to Logistics?",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        TextSpan(
                          text: " Register",
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              print("Not developped Register Page");
                            }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
        ]),
      ),
    );
  }
}
