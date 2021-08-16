import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_new/model/userModel.dart';
import 'package:flutter_new/provider/api_provider.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'infromation_event.dart';
part 'infromation_state.dart';

class InformationBloc extends Bloc<InformationError, InformationState> {
  InformationBloc() : super(InformationInitial());
  User? modelUser;
  @override
  Stream<InformationState> mapEventToState(InformationError event) async* {
    if (event is LoadInfromtion) {
      try {
        yield Informationloaded();
        await Callapi();
        yield Informationloaded();
      } catch (e) {
        yield InformationError();
      }
    }
  }

  Callapi() async {
    Response res = await APIProvider().getdata();
    var rs = json.decode(res.body);
    modelUser = User.fromJson(rs);
  }
}
