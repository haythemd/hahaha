import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/ui/info/InfoCard.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/donate.png'),
                ],
              ),
            ),
            SizedBox(height: 30,),
            MaterialButton(padding: EdgeInsets.symmetric(horizontal: 80),
              onPressed: () {},
              color: Colors.black,
              child: Text('Faire un don', style: DefaultFont.bold.copyWith(fontSize: 11)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.white)),
            ),
            Card(
              margin: EdgeInsets.all(20),
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: cardRadius),
                color: cardColor,
                child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Qui sommes nous?\n',style: DefaultFont.bold.copyWith(fontSize: 15,),),
                    Text(Strings.card1,
                      style: DefaultFont.light.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: cardRadius),
                color: cardColor,
                child: Padding(
                    padding:
                        const EdgeInsets.all(20),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Langue',style: DefaultFont.bold),
                        Row(children:[Text('Application',style: DefaultFont.light,),Spacer(),Text('Français',style: DefaultFont.light,)])
                      ],
                    ))),
            Card(
                margin: EdgeInsets.all(20),
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: cardRadius),
                color: cardColor,
                child: Padding(
                    padding:
                        const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('A propos',style: DefaultFont.bold,),
                        InkWell(
                          onTap: (){},
                          child: Row(children: [
                            Text('Nous Contactez',style: DefaultFont.light,),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,size: 12,color: Colors.white)
                          ],),
                        ),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){

                          },
                          child: Row(children: [
                            Text('La billetterie en ligne',style: DefaultFont.light),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,size: 12,color: Colors.white,)
                          ],),
                        )
                      ],
                    ))),

                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Align(alignment: Alignment.centerLeft,child: Text('Suivez nous',style: DefaultFont.bold,)),
                ),

            Row(children: [

            ],)
          ],
        ),
      ),
    );
  }
}
