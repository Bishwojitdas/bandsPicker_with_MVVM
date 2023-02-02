
import 'package:flutter/material.dart';

import 'dimensions.dart';
const LatoBlack=TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FontSizeDefault,
  fontWeight: FontWeight.w900,
);

const LatoBold=TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FontSizeDefault,
  fontWeight: FontWeight.w700,
);

const LatoRegular=TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FontSizeDefault,
  fontWeight: FontWeight.w400,
);

const LatoLight=TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FontSizeDefault,
  fontWeight: FontWeight.w300,
);

const LatoThin=TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FontSizeDefault,
  fontWeight: FontWeight.w100,
);


FullWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

FullHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}


isPotrate(BuildContext context){
  return MediaQuery.of(context).orientation;
}