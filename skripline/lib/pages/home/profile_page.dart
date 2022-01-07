import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripline/model/profile.dart';
import 'package:skripline/services/auth_services.dart';
import 'package:skripline/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userProfile = firestore.collection('user_profile');
    return Scaffold(
        body: SafeArea(
      child: StreamBuilder<QuerySnapshot>(
          stream: userProfile.where('id', isEqualTo: user.uid).snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              var myData = snapshot.data!.docs;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: myData
                    .map((e) => FillProfile(Profile(
                        id: e['id'],
                        nama: e['nama'],
                        nim: e['nim'],
                        nohp: e['no_hp'],
                        universitas: e['universitas'],
                        img: e['img'],
                        ipk: e['ipk'])))
                    .toList(),
              );
            } else {
              return Text('loading');
            }
          }),
    ));
  }
}

class FillProfile extends StatelessWidget {
  Profile profile;
  FillProfile(this.profile);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              color: Colors.indigoAccent,
              child: Image.network(
                profile.img,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 4,
          color: Colors.indigoAccent,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 37,
                ),
                title: Text(
                  'Name',
                  style: myText,
                ),
                subtitle: Text(
                  profile.nama.toUpperCase(),
                  style: myBoldText,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.school_rounded,
                  color: Colors.white,
                  size: 37,
                ),
                title: Text(
                  'College',
                  style: myText,
                ),
                subtitle: Text(
                  profile.universitas,
                  style: myBoldText,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.badge_sharp,
                  color: Colors.white,
                  size: 37,
                ),
                title: Text(
                  'Nim',
                  style: myText,
                ),
                subtitle: Text(
                  profile.nim,
                  style: myBoldText,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            AuthServices.signOut();
          },
          child: Text(
            'Logout',
            style: myText.copyWith(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              primary: kRed,
              fixedSize: Size(180, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
        ),
      ],
    );
  }
}
