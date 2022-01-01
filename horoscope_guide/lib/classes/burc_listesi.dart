import 'package:flutter/material.dart';
import 'package:horoscope_guide/classes/burc_item.dart';
import 'package:horoscope_guide/data/strings.dart';
import 'package:horoscope_guide/models/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;

  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burç Listesi'),
      ),
      body: Container(
        child: Center(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return BurcItem(
              listelenenBurc: tumBurclar[index],
            );
          },
          itemCount: tumBurclar.length,
        )),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (var i = 0; i < Strings.BURC_ADLARI.length; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      //koc1.png değerini oluşturmak için;
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';

      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk${i + 1}.png';
      Burc eklenecekBurc =
          Burc(burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
