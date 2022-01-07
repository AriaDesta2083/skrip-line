import 'package:flutter/material.dart';
import 'package:skripline/pages/forum/forum_page.dart';
import 'package:skripline/pages/news/beimawa_page.dart';
import 'package:skripline/pages/news/lowker_page.dart';
import 'package:skripline/pages/skripsi/skripsi_page.dart';
import 'package:skripline/theme.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              //! SKRIPSI
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SkripsiPage()));
            },
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  color: Colors.indigo,
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.menu_book_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Skiripsi',
                style: myTextStyle.copyWith(color: Colors.black),
              )
            ]),
          ),
          InkWell(
            onTap: () {
              //! LOWKER
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LowkerPage()));
            },
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  color: Colors.indigo,
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.home_work_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Lowongan\nPekerjaan',
                style: myTextStyle.copyWith(color: Colors.black),
              )
            ]),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BeimawaPage()));
            },
            //! BEIMAWA
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  color: Colors.indigo,
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.monetization_on_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Beimawa',
                style: myTextStyle.copyWith(color: Colors.black),
              )
            ]),
          ),
          InkWell(
            onTap: () {
              //! FORUM
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForumPage()));
            },
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  color: Colors.indigo,
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.chat,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Forum',
                style: myTextStyle.copyWith(color: Colors.black),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
