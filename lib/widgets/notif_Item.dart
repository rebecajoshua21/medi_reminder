import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotifItem extends StatelessWidget {
  const NotifItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: double.infinity,
        height: 130,
       // color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(radius: 30,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(color:Colors.white54,
                               
                  ),
                ),
              )
            ],
                
          ),
        ),
      ),
    );
  }
}