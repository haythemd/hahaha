import 'package:boilerplate/widgets/expandeableText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/font_family.dart';
import 'info/InfoCard.dart';


class Jardin extends StatefulWidget {
  const Jardin({Key? key}) : super(key: key);

  @override
  State<Jardin> createState() => _JardinState();
}

class _JardinState extends State<Jardin> {

 Map<String,String> content = { '1560':"Renée de France, duchesse d’Este, fille de Louis XII et d’Anne de Bretagne, ceint le château de deux jardins formant une « collerette » : - le premier, de deux hectares, est consacré au jardin d’agrément - le second, de cinq hectares, est appelé « Grands jardins » et était plus spécialement destiné à la production agricole et aux légumes mais aussi à la vigne et aux arbres fruitiers. Les plans de Jacques Androuet du Cerceau, publiés en 1576 donnent une idée de ce que pouvaient être ces jardins dans leur état de perfection. Jérôme Teste, un italien d’Este déjà en charge des jardins (Tivoli) accompagne Renée deFrance à Montargis et sera le responsable de l’entretien des jardins jusqu’à sa mort. il fut titré « Jardinier du Roi et de Madame Renée de France ». La première couronne, la plus étroite, adossée aux douves sèches du château mesure 35mètres (18 toises) de large. Ses deux hectares sont consacrés au jardin d’agrément et dominent en terrasse tout autour épaulés par deux contreforts face à la ville. La seconde couronne, plus large, encercle la première d’une largeur de 70 mètres (36 toises) pour une surface de cinq hectares, dénommée « Grands Jardins ». Ces jardins possèdent un cabinet de verre, des volières, une galerie et des déambulatoires.",
 '1574':"Jérôme Teste reçoit le titre de « jardinier du Roi et de Madame Renée de France ».",
 '1575':"Renée de France, Dame de Montargis et duchesse de Chartres décède.", 
   '1576':"Sa fille, Anne d’Este, duchesse de Guise puis duchesse de Nemours, hérite de la châtellenie de Montargis et décide de remettre en état les jardins du château mis à mal par les guerres de religion qui sévissaient dans le montargois.",
   '1587':"Les jardins du château sont le siège à nouveau de combats particuliers lors de la tentative des protestants, conduits par François de Chatillon, de s’introduire dans le château. Tout est à refaire."
 };


  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black,
      child: SingleChildScrollView(child: Column(children: [SingleChildScrollView(scrollDirection:Axis.horizontal,clipBehavior: Clip.none,child: Row(
        children: [
          Container(height: 300,clipBehavior: Clip.none,child: Image.asset('assets/images/jardin.png',fit: BoxFit.fitHeight,)),
        ],
      ),),

      ...content.keys.map((e) =>  Card(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: cardRadius),
          color: cardColor,
          child: Padding(
              padding:
              const EdgeInsets.all(20),
              child:
                  Column(
                    children: [
                      Text(e,style: DefaultFont.bold,),
                      ExpandableText(content[e]!)
                    ],
                  ),
              )))
      ],)),
    );
  }
}
