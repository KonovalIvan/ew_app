import 'dart:ui';

import 'package:flutter/material.dart';

const backgroundMainColor = Color(0xFF1E1E1E);
const buttonGreyColor = Color(0xFFFFFBFB);
const buttonLoginTextColor = Color(0xFF260975);
const buttonSendEmailTextColor = buttonRegisterTextColor;
const buttonRegisterTextColor = Color(0xFF097541);
const textLinkColor = Color(0xFF3CA9CB);

const backgroundDecorationGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      Color(0xFF260D67),
      Color(0xFF572886),
    ],
  ),
);