import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
 String? text;
 double? fontSize;
 Color? color;
 Alignment? align;
 Custom({this.text='',this.fontSize=16,this.color=Colors.black,this.align=Alignment.topLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      child: Text("${text}",style: TextStyle(color: color,fontSize: fontSize),),
    );
  }
}