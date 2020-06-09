import 'package:flutter/material.dart';
import 'package:oraganfood/utility/my_style.dart';
import 'package:oraganfood/utility/signout_process.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainRider extends StatefulWidget {
  @override
  _MainRiderState createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  String nameRider;

  @override
  void initState() {
    //todo: implement initState
    super.initState(); //dfdsfsd
    findRider();
  }

  Future<Null> findRider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameRider = preferences.getString('Name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameRider == null ? 'Main Rider' : '$nameRider login'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => signOutProcess(context))
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(), // คืออะไร อยู่ไหน อ.สอนข้ามให้หัดสร้างเอง            
          ],
        ),
      );

  ListTile homeMenu() => ListTile();

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('rider.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        'Name Rider',
        style: TextStyle(color: MyStyle().darkColor),
      ),
      accountEmail: Text(
        'Login',
        style: TextStyle(color: MyStyle().primaryColor),
      ),
    );
  }
}
