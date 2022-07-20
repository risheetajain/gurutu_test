import 'package:assignment_test/api/shared_pref.dart';
import 'package:assignment_test/constants/color.dart';
import 'package:flutter/material.dart';

import 'constants/decoration.dart';
import 'home.dart';
import 'widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Map _loginData = {
    'email': 'risheetajain309@gmail.com',
    'password': 'Password@123',
  };
  bool isObscure = false;
  String _email = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: mainColor,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(flex: 3, child: Container(color: mainColor)),
          Expanded(
              flex: 8,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Welcome To Gurutu",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: mainColor)),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        TextFormField(
                          onChanged: (val) {
                            setState(() {
                              _email = val;
                            });
                          },
                          decoration: textFieldDecoration.copyWith(
                            hintText: "Username",
                            labelText: "Username",
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter username";
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextFormField(
                          onChanged: (val) {
                            setState(() {
                              _password = val;
                            });
                          },
                          obscureText: isObscure,
                          decoration: textFieldDecoration.copyWith(
                            hintText: "Password",
                            labelText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: isObscure
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter password";
                            }

                            return null;
                          },
                        ),
                        const Spacer(),
                        Widgets.buildButton(
                            text: "Login",
                            onTap: () {
                              if (_email.toLowerCase() ==
                                      _loginData["email"]
                                          .toString()
                                          .toLowerCase() &&
                                  _password == _loginData["password"]) {
                                SharedPref.setLoggedIn().then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Invalid Credentials"),
                                ));
                              }
                            },
                            context: context),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ]),
                ),
              )),
        ]));
  }
}
