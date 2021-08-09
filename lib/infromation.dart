import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_new/model/userModel.dart';
import 'package:flutter_new/provider/api_provider.dart';
import 'package:http/http.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  //List<String> userList = <String>[modelUser!.data!.toString()];
  @override
  User? modelUser;
  Datum? dataUser;
  Callapi() async {
    print("ดึงข้อมมูล api");
    try {
      Response res = await APIProvider().getdata();
      if (res.statusCode == 200) {
        var rs = json.decode(res.body);
        modelUser = User.fromJson(rs);
        var rs2 = json.decode(res.body);
        dataUser = Datum.fromJson(rs2);
      } else {
        print("error else");
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    print("เริ่ม initState");
    Callapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
      ),
      body: Container(
        color: Colors.amber[60],
        child: ListView.builder(
            itemCount: modelUser!.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                    border: Border.all(color: Colors.blueAccent)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.account_box,
                          size: 90,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text("data"),
                        Text(dataUser!.firstName!.toString()),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
