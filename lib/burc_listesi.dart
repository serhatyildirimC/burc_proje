import 'package:burc_proje/burc_item.dart';
import 'package:flutter/material.dart';

import 'burc.dart';
import '../data/strings.dart';

class BurcListesi extends StatelessWidget {
  BurcListesi({Key? key}) : super(key: key);
  final List<Burc> burclar = veriKaynaginiHazirla();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Burçlar'),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: ((context, index) {
          return BurcItem(listelenenBurc: burclar[index]);
        }),
        itemCount: burclar.length,
      )),
    );
  }

  static List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.burcAdlari[i];
      var burcTarihi = Strings.burcTarihleri[i];
      var burcDetay = Strings.burcGenelOzellikleri[i];
      var burcKucukResim =
          '${Strings.burcAdlari[i].toLowerCase() + (i + 1).toString()}.png';

      var burcBuyukResim =
          '${Strings.burcAdlari[i].toLowerCase()}_buyuk${i + 1}.png';
      Burc ekle =
          Burc(burcAdi, burcTarihi, burcDetay, burcKucukResim, burcBuyukResim);

      gecici.add(ekle);
    }
    return gecici;
  }
}
