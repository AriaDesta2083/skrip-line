import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripline/model/profile.dart';
import 'package:skripline/widgets/card_chat.dart';

class ConectinPage extends StatelessWidget {
  const ConectinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userProfile = firestore.collection('user_profile');
    return Scaffold(
      appBar: AppBar(
        title: Text('Conection'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.group_add,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: userProfile.snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                var myData = snapshot.data!.docs;
                var myCont = [];
                for (var i = 0; i < myData.length; i++) {
                  if (myData[i]['id'] != _user.uid) {
                    myCont.add(myData[i]);
                  }
                }
                return ListView(
                  padding: EdgeInsets.all(5),
                  children: myCont
                      .map((e) => CardChat(Profile(
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
      ),
    );
  }
}
