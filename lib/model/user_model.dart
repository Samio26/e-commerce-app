// @dart=2.9
import 'package:flutter/material.dart';
  
  class UserModel {
    String userid,email,name,pic;
    UserModel({ this.userid, this.email, this.name, this.pic});
    UserModel.fromJson(Map<dynamic,dynamic> map){
      if (map==null){
        return;
      }
      userid=map['userid'];
      email=map['email'];
      name=map['name'];
      pic=map['pic'];
    }
    toJson(){
      return{
        'userid':userid,
        'email':email,
        'name':name,
        'pic':pic,
      };
    }
  }