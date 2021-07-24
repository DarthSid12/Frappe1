import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frappe/home_page/home_page_widget.dart';
import 'package:frappe/login/login_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> login(String id) async {
  if (id == "") {
    return 'Looks like this fridge ran away :p';
  }
  DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('Fridges').doc(id).get();
  if (!snapshot.exists) {
    return 'Looks like this fridge ran away :p';
  }
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('fridge', id);
  return 'Looks like I am opening up to you';
}

Future<List> getItems() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String id = prefs.getString('fridge');
  QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
      .collection('Fridges')
      .doc(id)
      .collection('itemInfo')
      .get();

  List<DocumentSnapshot> itemInfoList = querySnapshot2.docs;
  return itemInfoList;
}

Future<String> addItems(
    String name, int expiryDays, int requiredQuantity, int quantity) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String id = prefs.getString('fridge');
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection("Fridges")
      .doc(id)
      .collection('itemInfo')
      .where(FieldPath.documentId, isEqualTo: name)
      .get();
  if (querySnapshot.size != 0) {
    return 'Oops! This item already exists';
  }
  List<int> items = [];
  int i = 0;
  while (i < quantity) {
    items.add(DateTime.now().millisecondsSinceEpoch);
    i++;
  }
  FirebaseFirestore.instance
      .collection('Fridges')
      .doc(id)
      .collection('itemInfo')
      .doc(name)
      .set({
    'name': name,
    'expiryDays': expiryDays,
    'requiredQuantity': requiredQuantity,
    'items': items
  });
  return 'Item added successfully';
}

Future<StatefulWidget> checkLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('fridge') != null) {
    return HomePageWidget();
  }
  return LoginWidget();
}

Future<void> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
