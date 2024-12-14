import 'package:flutter/material.dart';

class Category{
  String title;
  String image;
  String id;
  Color color;
  Category({required this.id,required this.color, required this.image, required this.title});

  static List<Category> categories = [
    Category(id:"sports" ,image:"assets/images/icons/sports.png" ,title:"sports" ,color:Color(0xffC91C22),),
    Category(id:"general",image:"assets/images/icons/environment.png" ,title:"general" ,color:Color(0xff4882CF),),
    Category(id:"health" ,image: "assets/images/icons/health.png",title: "health" ,color:Color(0xffED1E79),),
    Category(id:"business" ,image:"assets/images/icons/bussines.png" ,title:"business" ,color:Color(0xffCF7E48),),
    Category(id:"technology" ,image:"assets/images/icons/Politics.png" ,title: "technology",color:Color(0xff003E90),),
    Category(id:"science" ,image:"assets/images/icons/science.png" ,title:"science" ,color: Color(0xffF2D352) ,),
  ];
}