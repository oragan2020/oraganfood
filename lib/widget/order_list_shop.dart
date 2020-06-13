import 'package:flutter/material.dart';
import 'package:oraganfood/model/user_model.dart';
class OrderListShop extends StatefulWidget {
  @override
  _OrderListShopState createState() => _OrderListShopState();
}

class _OrderListShopState extends State<OrderListShop> {

  UserModel userModel;

  @override
  void initState() {
    // todo: implement initState
    super.initState();
    //readDataUser();
  }

  // Future<Null> readDataUser()async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String id = preferences.getString('id');

  //   String url = '${MyConstant().domain}/oraganfood/getUserWhereId.php?isAdd=true&id=$id';
  //   await Dio().get(url).then((value) {
  //     print('value = $value');
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Text(
      'แสดงรายการอาหารที่ลูกค้าสั่ง'      
    );
  }
}