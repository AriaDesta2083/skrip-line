import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripline/model/News.dart';
import 'package:skripline/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class LowkerDetail extends StatelessWidget {
  Lowker lowker;
  LowkerDetail(this.lowker);
  @override
  Widget build(BuildContext context) {
    //! Ini user yang sedang login ditangkap
    User user = Provider.of<User>(context);
    //! fungsi firebasefirestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    //! ini manggil collection
    CollectionReference myLowker = firestore.collection('my_lowker');
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: 190,
            child: Text(
              lowker.judul,
              style: myBoldText,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(
              height: 10,
            ),
            Text(lowker.pekerjaan),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Center(
                child: Text('image'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(lowker.ketentuan),
            Text(lowker.keterangan),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigoAccent,
                        fixedSize: Size(150, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      //! Nambahkan Data Lowker
                      myLowker.add({
                        'user_id': user.uid,
                        'id': lowker.id,
                        'pekerjaan': lowker.pekerjaan,
                        'judul': lowker.judul,
                        'ketentuan': lowker.ketentuan,
                        'tempat': lowker.tempat,
                        'keterangan': lowker.keterangan,
                        'urlmore': lowker.urlmore
                      });
                    },
                    child: Text('Add')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red[400],
                        fixedSize: Size(150, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      String url = lowker.urlmore;
                      openBrowser(url: url);
                    },
                    child: Text('Read More')),
              ],
            )
          ],
        )));
  }

  Future<void> openBrowser({
    required String url,
    bool inApp = true,
  }) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceWebView: inApp, forceSafariVC: inApp, enableJavaScript: true);
    } else {
      print('null');
    }
  }
}
