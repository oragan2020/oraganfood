import 'package:flutter/material.dart';
import 'package:oraganfood/utility/my_style.dart';
import 'package:oraganfood/utility/signout_process.dart';
import 'package:oraganfood/widget/information_shop.dart';
import 'package:oraganfood/widget/list_food_menu_shop.dart';
import 'package:oraganfood/widget/order_list_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  String nameShop;

  // Feild
  Widget currentWidget = OrderListShop();

  @override
  void initState() {
    //todo: implement initState
    super.initState(); //dfdsfsd
    findShop();
  }

  Future<Null> findShop() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameShop = preferences.getString('Name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameShop == null ? 'Main Shop' : '$nameShop login'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => signOutProcess(context))
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(), // คืออะไร อยู่ไหน อ.สอนข้ามให้หัดสร้างเอง
            homeMenu(),
            foodMenu(),
            informationMenu(),
            signOutMenu(),
          ],
        ),
      );

  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.list),
        title: Text('รายการอาหาร ที่ลูกค้าสั่ง'),
        subtitle: Text('รายการอาหารที่ยังไม่ได้ทำส่งลูกค้า'),
        onTap: () {
          setState(
            () {
              currentWidget = OrderListShop();
            },
          );
          Navigator.pop(context);
        },
      );

  ListTile foodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('รายการอาหาร'),
        subtitle: Text('รายการอาหารของร้าน'),
        onTap: () {
          setState(
            () {
              currentWidget = ListFoodMenuShop();
            },
          );
          Navigator.pop(context);
        },
      );

  ListTile informationMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('ข้อมูลของร้าน'),
        subtitle: Text('ข้อมูลของร้าน พร้อม Edit'),
        onTap: () {
          setState(
            () {
              currentWidget = InformationShop();
            },
          );
          Navigator.pop(context);
        },
      );

  ListTile signOutMenu() => ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Sign Out'),
        subtitle: Text('Sign Out to Home'),
        onTap: () => signOutProcess(context),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('shop.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        'Name Shop',
        style: TextStyle(color: MyStyle().darkColor),
      ),
      accountEmail: Text(
        'Login',
        style: TextStyle(color: MyStyle().primaryColor),
      ),
    );
  }
}
