import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String? name;
  final String? email;
  final String? token;
  final String? imageUrl;

  //default Constructor
  const UserModel({
    required this.id,
    this.name,
    this.email,
    this.token,
    this.imageUrl
  });

  //factory constructor
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      id: snapshot.id,
      name: data["name"],
      email: data["email"],
      token: data["token"],
      imageUrl: data["imageUrl"]
    );
  }

  factory UserModel.empty() {
    return UserModel(
      id: ""
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "token": token,
      "imageUrl": imageUrl
    };
  }
}