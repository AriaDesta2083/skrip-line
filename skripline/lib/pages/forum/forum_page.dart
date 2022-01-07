import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripline/model/profile.dart';
import 'package:skripline/widgets/card_chat.dart';
import 'package:skripline/widgets/card_forum.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userProfile = firestore.collection('user_profile');
    return Scaffold(
      appBar: AppBar(
        title: Text('Forum'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.group_add,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            CardForum(
                'Grup 1', 'https://chat.whatsapp.com/DYZhpbOdM67AxuSv8YHNq9'),
            CardForum('Dosen 1', 'https://wa.me/6285155030300'),
          ]),
        ),
      ),
    );
  }
}
