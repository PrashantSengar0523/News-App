import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexus_news/models/user_model.dart';
import 'package:nexus_news/repos/authentication_repo.dart';
import 'package:nexus_news/utils/exceptions/firebase_exceptions.dart';

import '../utils/exceptions/firebase_auth_exceptions.dart';

class UserRepo extends GetxController{
  static UserRepo get instance=>Get.find();
  final  db = FirebaseFirestore.instance;

/// Save User Record
  Future<void> saveRecord(UserModel user)async{
    try{
      await db.collection('Users').doc(user.id).set(user.toJson());
      debugPrint('Saved sucessfully');
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }catch (e){
      throw 'Something went wrong.';
    }
  }

  /// Retrieve User Record
  Future<UserModel> retrieveUserRecord()async{
    try{
      final document= await db.collection('Users').doc(AuthenticationRepo.instance.user?.uid).get();
      if(document.exists){
        debugPrint('Retrieved sucessfully');
        return UserModel.fromSnapShot(document);
      }else{
        return UserModel(id: '', name: '', email: '');
      }
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }catch (e){
      throw 'Something went wrong.';
    }
  }

    /// Update User Record field
  Future<void> updateUserRecord(Map<String,dynamic> json) async {
    try {
      final userId = AuthenticationRepo.instance.user?.uid;
      await db.collection('Users').doc(userId).update(json);
      debugPrint('Updated sucessfully');
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong: $e';
    }
  }

  
  /// Delete User Record
  Future<void> deleteUserRecord(String userId)async{
    try{
      await db.collection('Users').doc(userId).delete();
      debugPrint('Deleted sucessfully');
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong: $e';
    }
  }

}