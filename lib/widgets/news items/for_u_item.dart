import 'package:flutter/material.dart';

class ForUItem extends StatelessWidget {
const ForUItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
     return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: 360,
            height: 400,
            color: Colors.blue,
            child: Column(children: [
              Container(
                width:300 ,
                height: 150,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/int.jpg")))
       

            ],),
            ),
          ) ;
  }
}