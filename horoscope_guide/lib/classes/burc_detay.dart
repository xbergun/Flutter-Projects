import 'package:flutter/material.dart';
import 'package:horoscope_guide/models/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.pink;
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();
    appbarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${widget.secilenBurc.burcAdi} Detay Sayfası'),
              background: Image.asset(
                'images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi + widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.secilenBurc.burcBuyukResim}'));

    setState(() {
      appbarRengi = _generator.dominantColor!.color;
    });
    print(appbarRengi);
  }
}
