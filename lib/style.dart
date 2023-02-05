

import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle myTextStyle (){
  return TextStyle(
    color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25
  );
}

ButtonStyle myButtonStyle(){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(20),shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50))
  )

  );
}

InputDecoration myInputDecoration(labelText){
  return InputDecoration(
    labelText: labelText, border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))
  );
}