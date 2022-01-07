import 'package:flutter/material.dart';
import 'package:skripline/model/News.dart';
import 'package:skripline/model/dosen.dart';
import 'package:skripline/theme.dart';

class CardInfo extends StatelessWidget {
  Lowker lowker;
  CardInfo(this.lowker);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[400],
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Center(
                child: Text('image'),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 190,
                  child: Container(
                    padding: EdgeInsets.only(right: 1),
                    child: Text(
                      lowker.judul,
                      style: headText,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 2,
                  color: Colors.black,
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                ),
                Container(
                  width: 200,
                  child: Text(
                    lowker.ketentuan,
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 4,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
