import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripline/model/News.dart';
import 'package:skripline/model/dosen.dart';
import 'package:skripline/model/profile.dart';
import 'package:skripline/theme.dart';
import 'package:skripline/widgets/card_home.dart';
import 'package:skripline/widgets/card_info.dart';
import 'package:skripline/widgets/card_info2.dart';
import 'package:skripline/widgets/menu_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userProfile = firestore.collection('user_profile');
    CollectionReference myNews = firestore.collection('my_news');
    CollectionReference myLowker = firestore.collection('my_lowker');
    CollectionReference mySkripsi = firestore.collection('my_skripsi');
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream:
                      userProfile.where('id', isEqualTo: user.uid).snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      var myData = snapshot.data!.docs;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: myData
                            .map((e) => TopHome(Profile(
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
                      return Center(child: Text('loading'));
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              MenuItem(),
              SizedBox(
                height: 30,
              ),
              Text(
                '  Jadwal Skripsi Aktiv',
                style: headText,
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: mySkripsi
                      .where('user_id', isEqualTo: user.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var myList = snapshot.data!.docs;
                      return Column(
                        children: myList
                            .map((e) => CardHome(Dosen(
                                id: e['id'],
                                nama: e['nama'],
                                matkul: e['matkul'],
                                jadwal: e['jadwal'],
                                htm: e['htm'])))
                            .toList(),
                      );
                    } else {
                      return Text('Belum ada data');
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Text(
                '  Informasi Tersimpan',
                style: headText,
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream:
                      myNews.where('user_id', isEqualTo: user.uid).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var myList = snapshot.data!.docs;
                      return Column(
                        children: myList
                            .map((e) => CardBeasiswa(Beasiswa(
                                id: e['id'],
                                judul: e['judul'],
                                ketentuan: e['ketentuan'],
                                keterangan: e['keterangan'],
                                tanggal: e['tanggal'],
                                urlmore: e['urlmore'])))
                            .toList(),
                      );
                    } else {
                      return Text('Belum ada data');
                    }
                  }),
              StreamBuilder<QuerySnapshot>(
                  stream: myLowker
                      .where('user_id', isEqualTo: user.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var myList = snapshot.data!.docs;
                      return Column(
                        children: myList
                            .map((e) => CardInfo(Lowker(
                                id: e['id'],
                                pekerjaan: e['pekerjaan'],
                                judul: e['judul'],
                                ketentuan: e['ketentuan'],
                                tempat: e['tempat'],
                                keterangan: e['keterangan'],
                                urlmore: e['urlmore'])))
                            .toList(),
                      );
                    } else {
                      return Text('Belum ada data');
                    }
                  }),
              SizedBox(
                height: 30,
              )
            ],
          )),
    ));
  }
}

class TopHome extends StatelessWidget {
  Profile profile;
  TopHome(this.profile);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.indigo,
      elevation: 4,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.account_balance_rounded,
              color: Colors.white,
            ),
            title: Text(
              profile.universitas,
              style: myBoldText.copyWith(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.notifications),
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            child: Container(
              color: Colors.indigoAccent,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                        child: (profile.img == null)
                            ? Image.asset(
                                'assets/images/tes.png',
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                profile.img,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.nama.toString().toUpperCase(),
                          style: myBoldText,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          profile.nim,
                          style: myTextStyle,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text(
                              profile.ipk,
                              style: myBoldText.copyWith(
                                  color: Colors.indigoAccent),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'IPK',
                          style: myText,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
