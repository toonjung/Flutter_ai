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
  @override
  User? modelUser;
  //Datum? modelDatum;
  bool isLoading = true;
  Callapi() async {
    print("ดึงข้อมมูล api");
    try {
      Response res = await APIProvider().getdata();
      if (res.statusCode == 200) {
        var rs = json.decode(res.body);
        modelUser = User.fromJson(rs);
        setState(() {
          isLoading = false;
        });
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
      body: isLoading
          ? Text("loading")
          : Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: modelUser!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return datalistview(index);
                  }),
            ),
    );
  }

  Column datalistview(int index) {
    return Column(
      children: [
        Divider(),
        Container(
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.grey)),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_box,
                      size: 90,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("First Name : " +
                        modelUser!.data![index].firstName.toString()),
                    Text("Last Name : " +
                        modelUser!.data![index].lastName.toString()),
                    Text("Email : " + modelUser!.data![index].email.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
