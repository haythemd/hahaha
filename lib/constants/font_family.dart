import 'package:flutter/material.dart';

class FontFamily {
  FontFamily._();

  static String productSans = "ProductSans";
  static String roboto = "Roboto";

}
class DefaultFont {
  DefaultFont._();
    static TextStyle light = TextStyle(fontFamily: 'Calibri',fontWeight: FontWeight.w300,color: Colors.white,fontSize: 15);
    static TextStyle bold = TextStyle(fontFamily: 'Calibri',fontWeight: FontWeight.w700,color: Colors.white,fontSize: 15);
    static TextStyle regular = TextStyle(fontFamily: 'Calibri',color: Colors.white,fontSize: 15);

}