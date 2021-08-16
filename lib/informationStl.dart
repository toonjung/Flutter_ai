import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new/infromation.dart';
import 'package:flutter_new/model/userModel.dart';
import 'package:bloc/bloc.dart';
class InformationStl extends StatelessWidget {
  const InformationStl({ Key? key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
      ),
      body:BlocBuilder<InformationBloc,InformationState>(
            builder: (context,state) {
              return Container(
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: modelUser!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return datalistview(index);
                      }),
                );
            }
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
