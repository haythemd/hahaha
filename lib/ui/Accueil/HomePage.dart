import 'package:boilerplate/constants/font_family.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? title = 'Clovis 1er';
  Map<int,String> pages = {1:'Clovis 1er',2:'Charles IV',0:'Charles VII'};
  String content1 = "Forteresse royale, lieu de villégiature, site industriel puis carrière à ciel ouvert, le site du château royal de Montargis possède une histoire de près de 1000 ans.";
  String content2 = "Les jardins d’agrément Renaissance du château royal de Montargis voulus par Renée de France, duchesses de Ferrare, Dame de Montargis, fille de Louis XII et d’Anne de Bretagne, belle-sœur de François Ier, réalisés par son jardinier italien Jérôme Teste vers 1560";
  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.black,child: SingleChildScrollView(
      child: Column(children: [
        Text("Les rois de France qui ont séjourné ici\n",style: DefaultFont.bold,),
        CarouselSlider(items: [Image.asset('assets/images/king1.png'),Image.asset('assets/images/king2.png'),Image.asset('assets/images/king3.png'),], options: CarouselOptions(initialPage: 1,onPageChanged: (index, reason){
        setState(() {
          title = pages[index];
        });


      })),
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Text(title!,style: TextStyle(fontFamily: 'Morganite',fontSize: 69,fontWeight: FontWeight.w700,color: Color(0xFFBF9B2E)),),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
        child: Text(content1,style: DefaultFont.light,textAlign: TextAlign.center,),

      ),
        MaterialButton(onPressed: (){},child: Text("Découvrir l'historique du chateau",style: DefaultFont.bold.copyWith(fontSize: 11),),color: Colors.black,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(8)),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
          child: Text(content2,style: DefaultFont.light,textAlign: TextAlign.center,),

        ),
        MaterialButton(onPressed: (){},child: Text("Découvrir l'historique des Jardins",style: DefaultFont.bold.copyWith(fontSize: 11),),color: Colors.black,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(8)),),


      ],),
    ),);
  }
}

