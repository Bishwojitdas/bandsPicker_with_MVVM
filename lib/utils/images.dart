

import 'package:flutter/material.dart';

class Images{
  static const String ARTCELL_FEATURED="assets/images/artcell_home.jpg";
  static const String NOGOR_BAUL_FEATURED="assets/images/nogor_baul.jpg";
  static const String WARFAZE_FEATURED="assets/images/warfaze_home.jpg";
  static const String MILES_FEATURED="assets/images/miles_home.jpg";
  static const String ARTCELL_POPULARED="assets/images/the_ashes_home.jpeg";
  static const String LRB_POPULARED="assets/images/lrb_home.jpg";
  static String NEMESIS_POPULARED = "assets/images/nemesis.jpg";
  static String AURTHOHIN_POPULARED = "assets/images/aurthohin.jpg";

}

FullWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

FullHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}


isPotrate(BuildContext context){
  return MediaQuery.of(context).orientation;
}