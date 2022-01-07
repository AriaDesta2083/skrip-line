import 'package:flutter/material.dart';
import 'package:skripline/services/auth_services.dart';
import 'package:skripline/theme.dart';
import 'package:skripline/wrapper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passController = TextEditingController(text: "");
  TextEditingController confpassController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        )),
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
                            return 'Password terlalu lemah';
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
                        height: 18,
                      ),
                      TextFormField(
                        controller: confpassController,
                        validator: (value) {
                          if (passController.text != confpassController.text) {
                            return 'Konfirmasi password gagal';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Konfirmasi password",
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
                              await AuthServices.signUp(emailController.text,
                                  confpassController.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Wrapper()));
                            }
                          },
                          child: Text('Daftar')),
                      SizedBox(
                        height: 20,
                      ),
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
