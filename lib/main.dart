import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frappe/FunctionsFrappe.dart';
import 'package:frappe/grocery/grocery_widget.dart';
import 'package:frappe/home_page/home_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  StatefulWidget goToPage = await checkLoggedIn();
  runApp(MyApp(
    goToPage: goToPage,
  ));
}

class MyApp extends StatelessWidget {
  StatefulWidget goToPage;
  MyApp({this.goToPage});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frappe',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePageWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
