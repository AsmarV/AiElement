import 'package:flutter/material.dart';

class FieldModel{

  int ? numberOfFields;
  String ? dataFieldType;
  List<TextEditingController> controllers=[];
  List<DateTime> dates=[];

  FieldModel({this.numberOfFields, this.dataFieldType});

  setNumberOfControllers(){
    for(int i=0;i<numberOfFields!;i++){
      controllers.add(TextEditingController());
    }
  }

  setNumberOfDateTime(){
    for(int i=0;i<numberOfFields!;i++){
      dates.add(DateTime.now());
    }
  }

}