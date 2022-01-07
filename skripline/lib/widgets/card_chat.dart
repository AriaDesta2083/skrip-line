import 'package:flutter/material.dart';
import 'package:skripline/model/profile.dart';
import 'package:skripline/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CardChat extends StatelessWidget {
  Profile profile;
  CardChat(this.profile);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigoAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(profile.img),
        ),
        title: Text(
          profile.nama,
          style: myBoldText,
        ),
        trailing: IconButton(
          onPressed: () {
            //! TO Whatsapp
            String wa = 'https://wa.me/62';
            String url = wa + profile.nohp.substring(1);
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
