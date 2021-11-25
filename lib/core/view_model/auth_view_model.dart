import 'package:commerce/core/service/firestore_user.dart';
import 'package:commerce/model/user_model.dart';
import 'package:commerce/view/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Controller extends GetxController{
  GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth=FirebaseAuth.instance;
String? email,pass,name;
Rxn<User> _user=Rxn<User>();
 get user=>_user.value?.email;
@override
void onInit(){
  super.onInit();
  _user.bindStream(_auth.authStateChanges());
}

  googleSignin()async{
final GoogleSignInAccount? googleuser=await _googleSignIn.signIn();
GoogleSignInAuthentication googlesignin=await googleuser!.authentication;
final AuthCredential credential=GoogleAuthProvider.credential(idToken:googlesignin.idToken ,accessToken:googlesignin.accessToken );
await _auth.signInWithCredential(credential).then((user) async{

});
  }
void SignInEmailandPass()async{
try{
await _auth.signInWithEmailAndPassword(email:email!, password:pass!);
Get.offAll(HomePage());
}on FirebaseAuthException catch(e){
  print(e.message);
Get.snackbar('Error login Account', '$e.code',snackPosition: SnackPosition.BOTTOM);
}
}
void createAcoount () async{
  try{
await _auth.createUserWithEmailAndPassword(email: email!, password: pass!).then((user)async {
 await FirestoreUser().addUsertofirestore(UserModel(
  userid: user.user.uid,
  email: user.user.email,
  name: name,
  pic:'')
);

});

Get.offAll(HomePage());
  }on FirebaseAuthException catch(e){
Get.snackbar("Register Error", "Please Verify your information!",snackPosition: SnackPosition.BOTTOM);
  }
}
}