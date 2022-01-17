import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AdditionController extends BaseController {

  final TextEditingController _controllerTextTask = TextEditingController();

  TextEditingController get controllerTextTask => _controllerTextTask;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  var firebaseUser = FirebaseAuth.instance.currentUser;

  var now = DateTime.now();
  var formatter = DateFormat('dd.MM.yyyy');

  void saveDate(String task) async {
    String formattedDate = formatter.format(now);
    collectionReference = firebaseFirestore.collection("taskData");
    await collectionReference.add(
        {"task": task, "dateTask": formattedDate, "userId": firebaseUser?.uid});
    Get.back();
  }

}
