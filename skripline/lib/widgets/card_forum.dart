import 'package:flutter/material.dart';
import 'package:skripline/model/profile.dart';
import 'package:skripline/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CardForum extends StatelessWidget {
  final String nama;
  final String link;
  CardForum(this.nama, this.link);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigoAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(
          nama,
          style: myBoldText,
        ),
        trailing: IconButton(
          onPressed: () {
            //! TO Whatsapp
            String url = link;
            openBrowser(url: url);
          },
          icon: Icon(Icons.call),
          color: Colors.white,
        ),
      ),
    );
  }

  //! Method buka browser
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
