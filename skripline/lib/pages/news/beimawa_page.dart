import 'package:flutter/material.dart';
import 'package:skripline/model/News.dart';
import 'package:skripline/pages/news/beimawa_detail.dart';
import 'package:skripline/theme.dart';
import 'package:skripline/widgets/card_info2.dart';

class BeimawaPage extends StatefulWidget {
  const BeimawaPage({Key? key}) : super(key: key);

  @override
  State<BeimawaPage> createState() => _BeimawaPageState();
}

class _BeimawaPageState extends State<BeimawaPage> {
  var myList = Beasiswa.getItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beasiswa',
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BeimawaDetail(Beasiswa(
                                id: data.id,
                                judul: data.judul,
                                ketentuan: data.ketentuan,
                                keterangan: data.keterangan,
                                tanggal: data.tanggal,
                                urlmore: data.urlmore))));
                  },
                  child: CardBeasiswa(Beasiswa(
                      id: data.id,
                      judul: data.judul,
                      ketentuan: data.ketentuan,
                      keterangan: data.keterangan,
                      tanggal: data.tanggal,
                      urlmore: data.urlmore)),
                ))
            .toList(),
      )),
    );
  }
}
