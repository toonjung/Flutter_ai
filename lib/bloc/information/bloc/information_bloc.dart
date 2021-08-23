import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_new/model/blocTestModel.dart';
import 'package:flutter_new/model/userModel.dart';
import 'package:flutter_new/provider/api_provider.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  InformationBloc() : super(InformationInitial());
  User? modelUser;
  List? CheckStatusList = [];
  List? showList = [];
  @override
  Stream<InformationState> mapEventToState(
    InformationEvent event,
  ) async* {
    if (event is LoadInformation) {
      try {
        yield Informationloading();
        print("Call api statr");
        await Callapi();
        print("Call api complete");
        print(modelUser!.data);
      } catch (e) {
        yield InformationError();
      }
    } else if (event is SelectCheckList) {
      print("(event is SelectCheckList");
      // mapAddList();
      await CheckList(event);
      print("ทำ CheckList เสร็จแล้ว");
      yield Informationloaded();
      print(showList);
      print("yield เสร็จแล้วนะ");
    }
  }

  mapAddList() async* {}
  Callapi() async {
    Response res = await APIProvider().getdata();
    var rs = json.decode(res.body);
    modelUser = User.fromJson(rs);
    CheckStatusList = [];
    for (var i = 0; i < modelUser!.data!.length; i++) {
      Map<String, dynamic> mapDataWhithBool = {
        "email": modelUser!.data![i].email,
        "firstName": modelUser!.data![i].firstName,
        "lastName": modelUser!.data![i].lastName,
        "status": false,
      };
      CheckStatusList!.add(mapDataWhithBool);
    }
    // for (var i = 0; i < modelUser!.data!.length; i++) {
    //   Map<bool, dynamic> mapDataWhithBool = new Map<bool, dynamic>();
    //   mapDataWhithBool[false] = modelUser!.data![i];
    //   CheckStatusList!.add(mapDataWhithBool);
    // }
  }

  CheckList(SelectCheckList event) async {
    var data = event.data;
    bool check = event.status;
    print("start method CheckList1111");
    //for (var i = 0; i < modelUser!.data!.length; i++) {
    for (var i = 0; i < CheckStatusList!.length; i++) {
      print("start for loop 22222");
      print(data);
      print(CheckStatusList![i]['firstName']);
      if (data == CheckStatusList![i]['firstName']) {
        print("3333333");

        print(
            CheckStatusList![i]['status'].toString() + "=" + check.toString());
        CheckStatusList![i]['status'] = check;

        if (check) {
          showList!.add(CheckStatusList![i]['firstName']);
        } else {
          showList!.remove(CheckStatusList![i]['firstName']);
        }
      }
    }
  }
}
