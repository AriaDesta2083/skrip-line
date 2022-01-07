import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripline/pages/complete_account.dart';
import 'package:skripline/pages/home_page.dart';
import 'package:skripline/pages/login_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return (user == null) ? LoginPage() : Wrapper2();
  }
}

class Wrapper2 extends StatelessWidget {
  const Wrapper2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myProfile;
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userProfile = firestore.collection('user_profile');
    return StreamBuilder<QuerySnapshot>(
        stream: userProfile.where('id', isEqualTo: _user.uid).snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            var myList = snapshot.data!.docs;
            for (var i = 0; i < myList.length; i++) {
              myProfile = myList[i]['id'];
            }
          }
          return (myProfile == null) ? CreateProfile() : HomePage(_user);
        });
  }
}
