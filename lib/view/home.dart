import 'package:commerce/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
   HomePage({ Key? key }) : super(key: key);
FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero,children: [
       UserAccountsDrawerHeader(currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(
'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),),
                      accountName:Text('Sami'), accountEmail: Text("aissasemi2@gmail.com"),decoration:BoxDecoration(color: Colors.black87) ,),
                      ListTile(leading: const Icon(Icons.house),
                title: const Text(
                  'Houses',
                  style: TextStyle(fontSize: 24.0),
                ),),
                 ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text(
                  'Apartments',
                  style: TextStyle(fontSize: 24.0),
                ),

         ) ],),
      ),
      body: MaterialButton(onPressed: (){_auth.signOut();
      Get.offAll(LoginScreen());},child: Text("out"),),
      
    );
  }
}