import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycommerce/models/user_model.dart';

class UsersData {
  final db = FirebaseFirestore.instance;

  void registerOwnerUser(UserModel user) {
    db.collection('users').add({
      'userName': user.userName,
      'userEmail': user.userName,
      'userUID': user.userUID,
      'commerceName': user.userName,
      'commerceGroupCode': user.commerceGroupCode,
      }
    );
  }

}