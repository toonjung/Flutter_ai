import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new/bloc/information/bloc/information_bloc.dart';
import 'package:flutter_new/model/blocTestModel.dart';
import 'package:flutter_new/model/userModel.dart';

class InformationStl extends StatelessWidget {
  InformationStl({Key? key}) : super(key: key);
  var reFreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshList() async {
    reFreshKey.currentState?.show(atTop: true);
    await Future.delayed(Duration(seconds: 3));
    return null;
  }

  Widget widgetBox = SizedBox();

  User? datafromstate;
  //List? datafromstate; // ตรงนนี้จะเเดง datafromstate = _informationBloc!.modelUser;
  InformationBloc? _informationBloc;
  List? _CheckStatusList = [];
  List? _Showlist = [];
  bool check = false;

  @override
  Widget build(BuildContext context) {
    _informationBloc = BlocProvider.of<InformationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
      ),
      body: RefreshIndicator(
        key: reFreshKey,
        onRefresh: refreshList,
        child: BlocBuilder<InformationBloc, InformationState>(
            bloc: _informationBloc,
            builder: (context, state) {
              if (state is InformationInitial) {
                print("start load");
                _informationBloc!.add(LoadInformation());
              } else if (state is Informationloading) {
                print("loading");
                widgetBox = Center(child: CircularProgressIndicator());
              } else if (state is InformationError) {
                widgetBox = Text("Error");
              } else if (state is Informationloaded) {
                datafromstate = _informationBloc!.modelUser; //วิธีนี้เรียกว่า
                _CheckStatusList = _informationBloc!.CheckStatusList;
                _Showlist = _informationBloc!.showList;
                print("----------------------------");
                print("_CheckStatusList vvvvvvvvv");
                print(_CheckStatusList);
                print("_Showlist  vvvvvvvvv");
                print(_Showlist);
                print("datafromstate!.data vvvvvvvvv");
                print(datafromstate!.data);
                print("----------------------------");
                widgetBox = ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // itemCount: _CheckStatusList!.length,
                    itemCount: datafromstate!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return datalistview(datafromstate!.data![index]);
                      //datafromstate ถงเป็น nullเฉยเลย??
                      //return datalistview(_CheckStatusList![index].);
                    });
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    widgetBox,
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget datalistview(datafromstate) {
    print("Widget datafromstate");
    print("");
    return Container(
      height: 150,
      width: 400,
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
                Text("First Name : " + datafromstate.firstName.toString()),
                Text("Last Name : " + datafromstate!.lastName.toString()),
                Text("Email : " + datafromstate!.email.toString()),
              ],
            ),
          ),
          // CheckTF(
          //     statuscheck: check,
          //     data: _CheckStatusList,
          //     informationBloc: _informationBloc)

          CheckTF(
            statuscheck: check,
            data: datafromstate!.firstName,
            informationBloc: _informationBloc,
          )

          // CheckTF(statuscheck: item['status'],data: item, _informationBloc: _informationBloc);
          // widgetBox,
        ],
      ),
    );
  }
}

class CheckTF extends StatefulWidget {
  CheckTF({
    Key? key,
    required this.statuscheck,
    required this.data,
    required this.informationBloc,
  }) : super(key: key);
  //const CheckTF({Key? key}) : super(key: key);

  bool statuscheck;
  var data;
  var informationBloc;
  @override
  _CheckTFState createState() =>
      _CheckTFState(statuscheck, data, informationBloc);
}

class _CheckTFState extends State<CheckTF> {
  _CheckTFState(this.statuscheck, this.data, this.informationBloc);
  // ignore: empty_constructor_bodies

  bool statuscheck;
  var data;
  var informationBloc;
  //var c = false;
  InformationBloc? _informationBloc;
  List<BlocTestModel?>? modlebloctest;
  User? datafromstate;
  //  BlocTestModel?  modlebloctest;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("stf view log");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Checkbox(
          value: statuscheck,
          onChanged: (value) {
            setState(() {
              statuscheck = value!;
              // statuscheck = value!;
              //Exception has occurred._TypeError (type 'String' is not a subtype of type 'int' of 'index')
              //informationBloc! .add(SelectCheckList(data: data['firstname'], status: value));
              //Exception has occurred._TypeError (type 'String' is not a subtype of type 'int' of 'index')
              //Exception has occurred.NoSuchMethodError (NoSuchMethodError: Class 'Datum' has no instance method '[]'.Receiver: Instance of 'Datum'Tried calling: []("firstname"))

              informationBloc!.add(SelectCheckList(data: data, status: value));
              print("setState() >>>> " + data);
              print(value);
              // informationBloc!.add(SelectCheckList(data: data,status: value ));
              //Exception has occurred. _TypeError (type 'List<dynamic>' is not a subtype of type 'String')
            });
            // _informationBloc!.add(SelectCheckList());
            // if( value == true){
            //   //add data
            // modlebloctest = _informationBloc!.modelListcheck;
            // datafromstate = _informationBloc!.modelUser;
            // modlebloctest = datafromstate
            // }
            // else(value == false){

            // }
          }),
    );
  }
}