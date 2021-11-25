import 'package:commerce/core/view_model/auth_view_model.dart';
import 'package:commerce/view/home.dart';
import 'package:commerce/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Control extends GetWidget<Controller> {
  const Control({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
    return (Get.find<Controller>().user !=null)
    ?HomePage():LoginScreen();
    }
      
    );
  }
}