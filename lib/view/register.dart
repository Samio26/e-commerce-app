import 'package:commerce/core/view_model/auth_view_model.dart';
import 'package:commerce/view/login_screen.dart';
import 'package:commerce/view/widgets/custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class Register extends GetWidget<Controller> {
   Register({ Key? key }) : super(key: key);
  GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,leading: GestureDetector(onTap: (){Get.off(LoginScreen());},child: Icon(Icons.arrow_back,color: Colors.black,)),elevation: 0,),
    
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(margin: EdgeInsets.only(top: 30),height: 550,decoration: BoxDecoration(color: Colors.white,boxShadow:[BoxShadow(color: Colors.black12,blurRadius: 5,spreadRadius: 0.6,offset: Offset(-11,-11),)]),padding: EdgeInsets.symmetric(horizontal: 25),child: ListView(children: [
         SizedBox(height: 40,),
          Text("Sign Up",style: TextStyle(fontFamily: 'Poppins',fontWeight:FontWeight.bold,fontSize: 40),),
          SizedBox(height: 70,),
          Form(key:_formkey,child: Column(
            children: [
              TextFormField(
                onSaved: (Value){
                  controller.name=Value;
                },
                validator: (Value){
                  if(Value==null){
                    print("");
                  }
                },
               decoration: InputDecoration(
                 hintText: "Enter Your Name",
                 label: Text("Name"),
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
               ) ),
               SizedBox(height: 10,),
             TextFormField(
               onSaved:(Value){
                 controller.email=Value;
               },
               validator: (Value){
                 if(Value==null){
                   print("object");
                 }
               },
           decoration: InputDecoration(
             hintText: "Enter Your Email",
             label: Text("Email"),
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),  
            )),
            SizedBox(height: 10,),
             TextFormField(
                 onSaved:(Value){
                 controller.pass=Value;
               },
               validator: (Value){
                 if(Value==null){
                   print("object");
                 }
               },
               obscureText: true,
           decoration: InputDecoration(
             hintText: "Enter Your Passsword",
             label: Text("Password"),
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
           )),
           SizedBox(height: 30,),
                 MaterialButton(onPressed: (){
                   _formkey.currentState!.save();
                  if( _formkey.currentState!.validate()){
                    controller.createAcoount();
                  }
          
                    },
                    color: primarycolor,
                    padding: EdgeInsets.only(top:13,bottom: 13),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child:Custom(text: 'Sign Up',align: Alignment.center,color:Colors.white) 
                    ),
           ],
           
          ),
          
          
          )
          

        ],)),
      ),
    );
  }
}