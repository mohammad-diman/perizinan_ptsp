import 'package:animate_do/animate_do.dart';
import 'package:b/client/apiclient.dart';
import 'package:b/model/authresponse.dart';
import 'package:b/navbar/navbar.dart';
import 'package:b/page/registerpage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Dio dio = Dio();
  late ApiClient client;

  String? usernameError;
  String? passwordError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = ApiClient(dio);
  }

  Future<void> login() async {
    final username = usernameController.text;
    final password = passwordController.text;

    try {
      final response = await client.login(username, password);

      print("Token: ${response.token}");

      setState(() {
        usernameError = null;
        passwordError = null;
      });

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NavigationMenu()))
          .then((value) => (value));
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response?.data;

        if (errorData is Map<String, dynamic> &&
            errorData.containsKey('errors')) {
          final errors = errorData['errors'];
          setState(() {
            usernameError = null;
            passwordError = null;
          });

          errors.forEach((field, messeage) {
            if (field == "username") {
              setState(() {
                usernameError = messeage.join(',');
              });
            } else if (field == "password") {
              setState(() {
                passwordError = messeage.join(',');
              });
            }
          });
        }
      } else {
        print("Login Gagal: $e");
      }
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
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: <Widget>[
                    FadeInDown(
                        duration: Duration(milliseconds: 1400),
                        child: Text(
                          "Sistem Perizinan",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        )),
                    FadeInDown(
                        duration: Duration(milliseconds: 1200),
                        child: Text(
                          "Dinas PTSP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        )),
                    FadeInDown(
                        duration: Duration(milliseconds: 1000),
                        child: Text(
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
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: Duration(milliseconds: 1600),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 35,
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(3, 165, 252, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Username",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        errorText: usernameError),
                                    controller: usernameController,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        errorText: passwordError),
                                    controller: passwordController,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1600),
                          child: MaterialButton(
                            onPressed: () {
                              login();
                            },
                            height: 50,
                            // margin: EdgeInsets.symmetric(horizontal: 50),
                            color: Colors.blue[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // decoration: BoxDecoration(
                            // ),
                            child: Center(
                              child: Text(
                                "Masuk",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1700),
                          child: Text(
                            "Belum punya akun?",
                            style: TextStyle(color: Colors.grey),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FadeInUp(
                                duration: Duration(milliseconds: 1700),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage()))
                                          .then((value) => (value));
                                    },
                                    child: Text("Daftar Sekarang",
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
