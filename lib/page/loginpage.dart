// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:b/exception/login_exception.dart';
import 'package:b/navbar/navbar.dart';
import 'package:b/page/registerpage.dart';
import 'package:flutter/material.dart';


import '../client/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService = AuthService.getInstance();

  String? usernameError;
  String? passwordError;

  String? errorMeesage;

  Future<void> _login() async {
    try {
       bool isAuthenticate = await _authService.login(
          usernameController.text,
          passwordController.text,
       );
       if (isAuthenticate) {
         Navigator.of(context)
             .push(MaterialPageRoute(builder: (context) => const NavigationMenu()))
             .then((value) => (value));
       }
    } on LoginException catch (e) {
      setState(() {
        errorMeesage = null;
        usernameError = null;
        passwordError = null;
      });

      e.errorsMessage.forEach((field, message) {
        if (field == "username") {
          setState(() {
            usernameError = message.join(',');
          });
        } else if (field == "password") {
          setState(() {
            passwordError = message.join(',');
          });
        } else if (field == 'error') {
          setState(() {
            errorMeesage = message;
          });
        }
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue.shade900,
          Colors.blue.shade800,
          Colors.blue.shade400
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: <Widget>[
                    FadeInDown(
                        duration: const Duration(milliseconds: 1400),
                        child: const Text(
                          "Sistem Perizinan",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        )),
                    FadeInDown(
                        duration: const Duration(milliseconds: 1200),
                        child: const Text(
                          "Dinas PTSP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        )),
                    FadeInDown(
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          "Bone Bolango",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 35,
                                fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  const BoxShadow(
                                      color: Color.fromRGBO(3, 165, 252, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 20,),
                                FadeInUp(
                                    duration: const Duration(milliseconds: 1600),
                                    child: Text(
                                      errorMeesage??"",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Username",
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                            border: InputBorder.none,
                                        errorText: usernameError),
                                    controller: usernameController,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                            border: InputBorder.none,
                                        errorText: passwordError),
                                    controller: passwordController,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: MaterialButton(
                            onPressed: () {
                              _login();
                            },
                            height: 50,
                            // margin: EdgeInsets.symmetric(horizontal: 50),
                            color: Colors.blue[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // decoration: BoxDecoration(
                            // ),
                            child: const Center(
                              child: Text(
                                "Masuk",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1700),
                          child: const Text(
                            "Belum punya akun?",
                            style: TextStyle(color: Colors.grey),
                          )),
                      const SizedBox(
                        height: 1,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FadeInUp(
                                duration: const Duration(milliseconds: 1700),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegisterPage()))
                                          .then((value) => (value));
                                    },
                                    child: const Text("Daftar Sekarang",
                                        style: TextStyle(
                                            color: Colors.lightBlue)))),
                          )
                        ],
                      )
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
