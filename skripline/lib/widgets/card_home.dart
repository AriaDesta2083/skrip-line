import 'package:flutter/material.dart';
import 'package:skripline/model/dosen.dart';
import 'package:skripline/theme.dart';

class CardHome extends StatelessWidget {
  Dosen dosen;
  CardHome(this.dosen);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.indigoAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '     ${dosen.matkul}',
                      style: myText.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '     Dosen Pengampu : ${dosen.nama}',
                      style: myText.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
