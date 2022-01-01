import 'package:flutter/material.dart';
import 'package:horoscope_guide/classes/burc_detay.dart';
import 'package:horoscope_guide/models/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BurcDetay(
                      secilenBurc: listelenenBurc,
                    )));
          },
          leading: Image.asset(
            "images/${listelenenBurc.burcKucukResim}",
          ),
          title: Text(
            listelenenBurc.burcAdi,
            style: myTextStyle.headline5,
          ),
          subtitle: Text(
            listelenenBurc.burcTarihi,
            style: myTextStyle.subtitle1,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
