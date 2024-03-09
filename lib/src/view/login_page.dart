import 'dart:ui';

import 'package:finances_app/src/dialogs/dialogs.dart';
import 'package:finances_app/src/firebase/firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String userL = '';
String passL = '';
List loginData = [];

getLoginInfo(List data) {
  loginData = data;
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool viewPass = false;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Material(
      child: FittedBox(
        fit: BoxFit.cover,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/money.jpg',
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: altura * 0.4,
                  width: largura * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.white),
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.withOpacity(0.1),
                        Colors.grey.withOpacity(0.3),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(),
                      Container(
                        width: largura * 1,
                        height: altura * 0.05,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: user,
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                          decoration: InputDecoration(
                            filled: false,
                            labelText: 'User',
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: largura * 1,
                        height: altura * 0.05,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: pass,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                          obscureText: !viewPass,
                          decoration: InputDecoration(
                            filled: false,
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  viewPass = !viewPass;
                                });
                              },
                              icon: Icon(
                                viewPass
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: altura * 0.05,
                        width: largura * 1,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            FirebaseConfig.login(user.text, pass.text);
                            setState(() {
                              userL = loginData[0]['user'];
                              passL = loginData[0]['pass'];
                            });
                            if (user.text == userL && pass.text == passL) {
                              Navigator.of(context).pop('/');
                            } else {
                              Dialogs.login(
                                  context, 'Usuário ou senha inválidos!');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 133, 133, 133),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Container(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
