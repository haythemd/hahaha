import 'package:flutter/material.dart';

import '../constants/font_family.dart';
import '../widgets/expandeableText.dart';
import 'info/InfoCard.dart';
class Chateau extends StatefulWidget {
  const Chateau({Key? key}) : super(key: key);

  @override
  State<Chateau> createState() => _ChateauState();
}

class _ChateauState extends State<Chateau> {
  Map<String,String> content = {"En 1, La Grosse Tour.":"Construite en 1198 par Philippe II auguste, tour maitresse de celle du Louvre construite 3ans plus tard, abimée durant les guerres de religion, arasée par Philippe d’Orléans, Monsieur, frère de Louis XIV. Sa base fut pulvérisée en 1983 pour construire un bâtiment scolaire.",
    "En 2, La Grande Salle.":"Charles V édifia une nouvelle Grande Salle mesurant 58 mètres de long au-dedans et 64 mètres au dehors et de 17 mètres de large en dedans et 24 mètres au dehors. Aucun pilier central au 1er étage qui contient 6 cheminées dont les manteaux sont enrichis de peintures. Elle est voutée (vaisseau renversé) et lambrissée. Elle est peinte aux armes de France et ornée des blasons des alliances que la famille de France en France et en Europe. Elle fut transformée en atelier de filature en 1785 par Louis-Philippe Ier d’Orléans et son fils, le Régicide ou « Philippe-Egalité ». Après la vente en 1809 elle sera méticuleusement vendue par le curé d’Amilly, jureur et défroqué, devenu banquier et acquéreur du château qui fit tout disparaitre.",
    "En 3, La salle des Gardes au rez-de-chaussée et à l’étage le cabinet du roi":"",
    "En 4, La chapelle royale":"La chapelle royale deviendra en 1568 un temple protestant sous Renée de France. Totalement remaniée en 1695 elle deviendra un pavillon aménagé par Philippe Ier d’Orléans, Monsieur, frère de Louis XIV qui le meublera et le décorera richement. Seul le re-z de chaussée sera conservé en sa forme le 1er étage devenant une réserve lors de la transformation d el Grande Salle en un atelier defilature par son arrière-petit-fils Louis-Philippe Ier d’Orléans."};
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black,
      child: SingleChildScrollView(child: Column(children: [SingleChildScrollView(scrollDirection:Axis.horizontal,clipBehavior: Clip.none,child: Row(
        children: [
          Container(height: 300,clipBehavior: Clip.none,child: Image.asset('assets/images/chateau.png',fit: BoxFit.fitHeight,)),
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
