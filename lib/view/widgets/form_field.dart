import 'package:flutter/material.dart';

import 'custom.dart';

class FormFieldd extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child:    
         Column(
           children: [
          Custom(text: 'Email',fontSize: 14,color: Colors.grey.shade900),
             Column(children: [
                TextFormField(
                
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    
                    
                    ))
              ],),
           ],
         ),
      
    );
  }
}