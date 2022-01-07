import 'package:flutter/material.dart';
import 'package:skripline/model/News.dart';
import 'package:skripline/pages/news/lowker_detail.dart';
import 'package:skripline/theme.dart';
import 'package:skripline/widgets/card_info.dart';

class LowkerPage extends StatefulWidget {
  const LowkerPage({Key? key}) : super(key: key);

  @override
  State<LowkerPage> createState() => _LowkerPageState();
}

class _LowkerPageState extends State<LowkerPage> {
  var myList = Lowker.getItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lowongan Kerja',
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
        padding: EdgeInsets.all(10),
        children: myList
            .map((data) => InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LowkerDetail(Lowker(
                              urlmore: data.urlmore,
                              id: data.id,
                              pekerjaan: data.pekerjaan,
                              judul: data.judul,
                              ketentuan: data.ketentuan,
                              tempat: data.tempat,
                              keterangan: data.keterangan)))),
                  child: CardInfo(Lowker(
                      urlmore: data.urlmore,
                      id: data.id,
                      pekerjaan: data.pekerjaan,
                      judul: data.judul,
                      ketentuan: data.ketentuan,
                      tempat: data.tempat,
                      keterangan: data.keterangan)),
                ))
            .toList(),
      )),
    );
  }
}
