import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skripline/services/storage_services.dart';
import 'package:skripline/theme.dart';
import 'package:skripline/wrapper.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _nim = TextEditingController();
  final TextEditingController _nohp = TextEditingController();
  final TextEditingController _college = TextEditingController();
  final TextEditingController _ipk = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  var myimages;
  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userProfile = firestore.collection('user_profile');
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: makeGradientColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Center(
                      child: SizedBox(
                        height: 115,
                        width: 115,
                        child: Stack(
                          fit: StackFit.expand,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              child: (myimages == null)
                                  ? CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/images/tes.png'))
                                  : CircleAvatar(
                                      backgroundImage: NetworkImage(myimages)),
                            ),
                            Positioned(
                              right: -16,
                              bottom: 0,
                              child: SizedBox(
                                height: 46,
                                width: 46,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        side: BorderSide(color: Colors.white),
                                      ),
                                      primary: Colors.white,
                                      backgroundColor: Color(0xFFF5F6F9),
                                    ),
                                    onPressed: () async {
                                      XFile? file = await getImage();
                                      await StorageServices.uploadImage(file!);
                                      myimages =
                                          await StorageServices.uploadImage(
                                              file);
                                      setState(() {
                                        setState(() {});
                                      });
                                    },
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.black,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      controller: _nama,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Nama",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.account_circle_sharp,
                          color: kText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: _nim,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'NIM tidak boleh kosong';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "NIM",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.badge_sharp,
                          color: kText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: _nohp,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No. Handphone tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "No. Handphone",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.call,
                          color: kText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: _ipk,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'IPK tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "IPK",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.bar_chart,
                          color: kText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: _college,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'College tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "College",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.school_rounded,
                          color: kText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            myimages != null) {
                          userProfile.add({
                            'id': _user.uid,
                            'nama': _nama.text,
                            'nim': _nim.text,
                            'no_hp': _nohp.text,
                            'ipk': _ipk.text,
                            'universitas': _college.text,
                            'img': myimages,
                          });
                          print('gagal');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Wrapper()));
                        }
                        return null;
                      },
                      child: Text(
                        'Submit',
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red[400],
                          fixedSize: Size(200, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<XFile?> getImage() async {
    // return await Ima.pickImage(source: ImageSource.gallery);
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
