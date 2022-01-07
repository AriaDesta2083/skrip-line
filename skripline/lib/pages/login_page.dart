import 'package:flutter/material.dart';
import 'package:skripline/pages/register_page.dart';
import 'package:skripline/services/auth_services.dart';
import 'package:skripline/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('tes'),
      // ),
      body: SafeArea(
        bottom: false,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: makeGradientColor,
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 370,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email tidak boleh kosong';
                          } else if (emailValidatorRegExp.hasMatch(value) ==
                              false) {
                            return 'Masukan email dengan benar';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            Icons.mail,
                            color: kText,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                        controller: passController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password tidak boleh kosong';
                          } else if (value.length < 5) {
                            return "Password terlalu pendek";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            Icons.lock,
                            color: kText,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[400],
                              fixedSize: Size(200, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await AuthServices.signIn(
                                  emailController.text, passController.text);
                              return null;
                            }
                          },
                          child: Text('Login')),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'atau',
                        style: myText.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[400],
                              fixedSize: Size(200, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: Text('Daftar'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[A-Za-z0-9._]+@[A-Za-z0-9]+\.[a-zA-Z]+");
