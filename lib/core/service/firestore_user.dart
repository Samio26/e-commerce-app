import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/model/user_model.dart';

class FirestoreUser{
  final CollectionReference firstoreuser=FirebaseFirestore.instance.collection("Users");

  addUsertofirestore(UserModel usermodel)async{
return await firstoreuser.doc(usermodel.userid).set(usermodel.toJson());
  }
}