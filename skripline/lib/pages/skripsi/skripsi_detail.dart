import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripline/model/dosen.dart';
import 'package:skripline/theme.dart';

// class Ddown extends StatefulWidget {
//   final jadwal;
//   Ddown(this.jadwal);

//   @override
//   State<Ddown> createState() => _DdownState();
// }

// class _DdownState extends State<Ddown> {
//   @override
//   Widget build(BuildContext context) {
//     var pilihan = widget.jadwal;
//     String dropdownValue = pilihan[0];
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? newValue) {
//         setState(() {
//           dropdownValue = newValue!;
//         });
//       },
//       items: pilihan.map((value) {
//         return DropdownMenuItem(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }

class CardSkipsi extends StatelessWidget {
  Dosen dosen;
  CardSkipsi(this.dosen);
  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference skripsi = firestore.collection('my_skripsi');
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Colors.indigoAccent,
            child: Center(
                child: Text(
              dosen.matkul,
              style: myBoldText,
            )),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dosen Pemnimbing :'),
                    Text(dosen.nama),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Biaya Bimbingan :'),
                    Text(' Rp ' + dosen.htm.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jadwal Bimbingan :'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < dosen.jadwal.length; i++)
                          Text(dosen.jadwal[i])
                      ],
                    )
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigoAccent,
                        fixedSize: Size(150, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      skripsi.add({
                        'user_id': _user.uid,
                        'id': dosen.id,
                        'nama': dosen.nama,
                        'matkul': dosen.matkul,
                        'jadwal': dosen.jadwal,
                        'htm': dosen.htm
                      });
                    },
                    child: Text('Add')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
