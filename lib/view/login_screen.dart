import 'package:commerce/constants.dart';
import 'package:commerce/core/view_model/auth_view_model.dart';
import 'package:commerce/view/register.dart';
import 'package:commerce/view/widgets/custom.dart';
import 'package:commerce/view/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<Controller> {
   LoginScreen({ Key? key }) : super(key: key);
final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(elevation: 0.0,backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.only(top: 45,right: 20,left: 20),
        child: ListView(children: [
          
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            
            Custom(text: 'Welcome,',fontSize: 30),
            InkWell(onTap: (){
              Get.to(Register());
            },child: Custom(text: 'Sign Up',color: Color.fromRGBO(0, 179, 105, 1),fontSize: 18))
          ],),
          SizedBox(height: 10,),
          Custom(text: 'Sign in to continue',fontSize: 14,color: Colors.grey,),
          SizedBox(height: 30),
          Form(
            key: _formkey,
            child: Column(children: [
              TextFormField(
              onSaved: (Value){
                controller.email=Value;
              },
              validator: (Value){
                if(Value==null){
                  print("error");
                }
              },
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  
                  
                  )),
                  SizedBox(height: 15),
              TextFormField(
                onSaved: (Value){
                  controller.pass=Value;
                },
                validator: (Value){
                  if(Value==null){
                    print("object");
                  }
                },
                obscureText: true,
               decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),  
                    )),
                    SizedBox(height: 20),
                    Custom(text: 'Forgot Password?',align: Alignment.center,fontSize: 15,),
                     SizedBox(height: 20),
                    MaterialButton(onPressed: (){
                   _formkey.currentState!.save();
                      if(_formkey.currentState!.validate()){
                       controller.SignInEmailandPass();
                      }
          
                    },
                    color: primarycolor,
                    padding: EdgeInsets.only(top:13,bottom: 13),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child:Custom(text: 'Sign in',align: Alignment.center,color:Colors.white) 
                    ),
                    SizedBox(height: 20),
                    Custom(text: '-OR-',align: Alignment.center,fontSize: 26,),
                    SizedBox(height: 20),
                    MaterialButton(onPressed: (){
                    },
                    color: Colors.white,
                    padding: EdgeInsets.only(top:13 ,bottom: 13),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                      Icon(Icons.facebook),
                      Custom(text: 'Sign in with Facebook'),
                    ],), 
                    
                    ),
                  SizedBox(height: 20),
                  MaterialButton(onPressed: (){
                    controller.googleSignin();
                  },
                    color: Colors.white,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
                    padding: EdgeInsets.only(top: 13,bottom: 13),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                      Icon(Icons.facebook_sharp),
                      Custom(text: 'Sign in with Google'),
                    ],), 
                    
                    ),
          
            ],),
          ),
        ],),
      )
      
    );
  }
}