import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frappe/aboutus/aboutus_widget.dart';
import 'package:frappe/explore/explore_widget.dart';
import 'package:frappe/home_page/home_page_widget.dart';
import 'package:frappe/login/login_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../FunctionsFrappe.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryWidget extends StatefulWidget {
  GroceryWidget({Key key}) : super(key: key);

  @override
  _GroceryWidgetState createState() => _GroceryWidgetState();
}

class _GroceryWidgetState extends State<GroceryWidget> {
  List<Widget> groceryWidgetList = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    makeGroceryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.secondaryColor,
          automaticallyImplyLeading: true,
          title: Text(
            'GROCERY LIST',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Noto Serif',
              color: Color(0xFFFAFAFA),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: InkWell(
              onTap: () {
                scaffoldKey.currentState.openDrawer();
              },
              child: Icon(Icons.menu)),
          centerTitle: true,
          actions: [],
          elevation: 4,
        ),
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      drawer: Drawer(
        elevation: 16,
        child: Container(
          color: FlutterFlowTheme.secondaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 40),
              Align(
                alignment: Alignment(-0.02, -0.76),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                  child: Image.asset(
                    'assets/images/StolenLogoWithoutBG.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.1, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Frappe',
                    style: FlutterFlowTheme.title1.override(
                      fontFamily: 'Oswald',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  height: 5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: HomePageWidget(),
                      ),
                      (r) => false,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        // color: FlutterFlowTheme.tertiaryColor,
                        // border: Border.symmetric(vertical: BorderSide(width: 1,color: Colors.black))
                        ),
                    child: ListTile(
                      leading: Icon(
                        Icons.house,
                        color: FlutterFlowTheme.primaryColor,
                      ),
                      title: Text(
                        'HOME PAGE',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.secondaryColor,
                      dense: false,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                },
                child: ListTile(
                  leading: Icon(
                    Icons.shopping_cart,
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  title: Text(
                    'GROCERY LIST',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: FlutterFlowTheme.secondaryColor,
                  dense: false,
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: FlutterFlowTheme.tertiaryColor,
              //       border: Border.symmetric(vertical: BorderSide(width: 2))
              //   ),
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.add_circle_sharp,
              //       color: FlutterFlowTheme.primaryColor,
              //     ),
              //     title: Text(
              //       'ADD ITEM',
              //       style: FlutterFlowTheme.title3.override(
              //         fontFamily: 'Poppins',
              //         color: FlutterFlowTheme.primaryColor,
              //       ),
              //     ),
              //     trailing: Icon(
              //       Icons.arrow_forward_ios,
              //       color: Color(0xFF303030),
              //       size: 20,
              //     ),
              //     tileColor: FlutterFlowTheme.secondaryColor,
              //     dense: false,
              //   ),
              // ),
              InkWell(
                onTap: () async {
                  await Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: ExploreWidget(),
                    ),
                    (r) => false,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      // color: FlutterFlowTheme.tertiaryColor,
                      // border: Border.symmetric(vertical: BorderSide(width: 2))
                      ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search_off_sharp,
                      color: FlutterFlowTheme.primaryColor,
                    ),
                    title: Text(
                      'EXPLORE PAGE',
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.secondaryColor,
                    dense: false,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: AboutusWidget(),
                    ),
                    (r) => false,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ListTile(
                    leading: Icon(
                      Icons.location_history,
                      color: FlutterFlowTheme.primaryColor,
                    ),
                    title: Text(
                      'ABOUT US',
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.secondaryColor,
                    dense: false,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await logout();
                  await Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: LoginWidget(),
                    ),
                    (r) => false,
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  title: Text(
                    'LOG OUT',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: FlutterFlowTheme.secondaryColor,
                  dense: false,
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                        Container(height: 30),
                      ] +
                      groceryWidgetList +
                      <Widget>[
                        // SizedBox(height: 40),
                        // Container(
                        //   height: 70,
                        //   width: 150,
                        //   decoration: BoxDecoration(
                        //       color: FlutterFlowTheme.secondaryColor,
                        //       borderRadius: BorderRadius.circular(15)),
                        //   child: Center(
                        //     child: Text("Update"),
                        //   ),
                        // ),

                        // SizedBox(height: 40),
                      ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text(
                'IF YOU KEEP GOOD FOOD IN YOUR FRIDGE, YOU WILL EAT GOOD FOOD',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Oswald',
                  color: Color(0xFF328FAE),
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void makeGroceryList() async {
    groceryWidgetList = [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
    ];
    setState(() {});
    groceryWidgetList = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    QuerySnapshot allItems = await FirebaseFirestore.instance
        .collection('Fridges')
        .doc(prefs.getString('fridge'))
        .collection('itemInfo')
        .get();
    List<Map> groceryList = [];
    DateTime expiryDate = DateTime.now();
    for (DocumentSnapshot snapshot in allItems.docs) {
      int missingItems = 0;
      //Not in use right now but cehcks if items are expired
      // for (int timestamp in snapshot.get('items')) {
      //   if (DateTime.fromMicrosecondsSinceEpoch(timestamp)
      //       .add(Duration(days: snapshot.get('expiryDays')))
      //       .isAfter(expiryDate)) {}
      // }
      int lackingItems =
          int.parse(snapshot.get('requiredQuantity').toString()) -
              snapshot.get('items').length;
      if (lackingItems > 0) {
        missingItems += lackingItems;
      }
      if (missingItems != 0) {
        groceryList.add({
          'name': snapshot.id,
          'items': missingItems,
        });
      }
    }

    for (Map groceryItem in groceryList) {
      bool checkboxListTileValue2 = false;
      groceryWidgetList.add(
        CheckboxItem(
          groceryitem: groceryItem,
        ),
      );
    }
    print(groceryWidgetList.toString());
    setState(() {});
  }
}

class CheckboxItem extends StatefulWidget {
  final Map groceryitem;
  const CheckboxItem({Key key, this.groceryitem}) : super(key: key);

  @override
  _CheckboxItemState createState() => _CheckboxItemState();
}

class _CheckboxItemState extends State<CheckboxItem> {
  bool checkboxListTileValue2 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: CheckboxListTile(
        value: checkboxListTileValue2 ?? false,
        onChanged: (newValue) =>
            setState(() => checkboxListTileValue2 = newValue),
        title: Text(
          widget.groceryitem['name'],
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
          ),
        ),
        subtitle: Text(
          widget.groceryitem['items'].toString(),
          style: FlutterFlowTheme.subtitle2.override(
            fontFamily: 'Noto Serif',
          ),
        ),
        tileColor: Color(0xFFF5F5F5),
        dense: false,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
