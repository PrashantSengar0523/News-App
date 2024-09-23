import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  late final String name;
  final String email;

  // Constructor
  UserModel({required this.id, required this.name, required this.email});

  // Method to convert UserModel instance to a Map (e.g., for saving to a database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  // Factory constructor to create a UserModel from a Firestore DocumentSnapshot
  factory UserModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data(); // get the data from the document

    // If data is null, return a default instance or throw an exception
    if (data == null) {
      throw Exception('Document snapshot data is null');
    }

    return UserModel(
      id: document.id,
      name: data['name'] ?? '', // Handle potential null value with a default empty string
      email: data['email'] ?? '', // Handle potential null value with a default empty string
    );
  }

  // Override toString method for easier debugging
  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email}';
  }
}
