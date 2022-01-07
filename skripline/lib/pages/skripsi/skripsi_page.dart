import 'package:flutter/material.dart';
import 'package:skripline/model/dosen.dart';
import 'package:skripline/pages/skripsi/skripsi_detail.dart';
import 'package:skripline/theme.dart';
import 'package:skripline/widgets/card_home.dart';

class SkripsiPage extends StatefulWidget {
  const SkripsiPage({Key? key}) : super(key: key);

  @override
  _SkripsiPageState createState() => _SkripsiPageState();
}

class _SkripsiPageState extends State<SkripsiPage> {
  var myList = Dosen.getItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bimbingan Skripsi',
            style: myBoldText,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.search_rounded),
            )
          ],
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20),
            children: myList
                .map(
                  (data) => CardSkipsi(Dosen(
                      id: data.id,
                      nama: data.nama,
                      matkul: data.matkul,
                      jadwal: data.jadwal,
                      htm: data.htm)),
                )
                .toList(),
          ),
        ));
  }
}
