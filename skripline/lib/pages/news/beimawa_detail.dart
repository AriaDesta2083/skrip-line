import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripline/model/News.dart';
import 'package:skripline/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class BeimawaDetail extends StatefulWidget {
  Beasiswa beasiswa;
  BeimawaDetail(this.beasiswa);

  @override
  State<BeimawaDetail> createState() => _BeimawaDetailState();
}

class _BeimawaDetailState extends State<BeimawaDetail> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference news = firestore.collection('my_news');
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 190,
          child: Text(
            widget.beasiswa.judul,
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
            Text(widget.beasiswa.tanggal),
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
            Text(widget.beasiswa.ketentuan),
            Text(widget.beasiswa.keterangan),
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
                      news.add({
                        'user_id': user.uid,
                        'id': widget.beasiswa.id,
                        'judul': widget.beasiswa.judul,
                        'ketentuan': widget.beasiswa.ketentuan,
                        'keterangan': widget.beasiswa.keterangan,
                        'tanggal': widget.beasiswa.tanggal,
                        'urlmore': widget.beasiswa.urlmore
                      });
                    },
                    child: Text('Add')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red[400],
                        fixedSize: Size(150, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {
                      String url = widget.beasiswa.urlmore;
                      openBrowser(url: url);
                    },
                    child: Text('Read More')),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> openBrowser({
    required String url,
    bool inApp = false,
  }) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceWebView: inApp, forceSafariVC: inApp, enableJavaScript: true);
    } else {
      print('null');
    }
  }
}
