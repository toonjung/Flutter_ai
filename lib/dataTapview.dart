import 'package:flutter/material.dart';

class DataTapView extends StatefulWidget {
  const DataTapView({Key? key}) : super(key: key);

  @override
  _DataTapViewState createState() => _DataTapViewState();
}

class _DataTapViewState extends State<DataTapView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("10 ตัน/ไร่",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo[800])),
                        Text("ประมาณการณ์ผลผลิตอ้อย",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Colors.grey,
                    child: VerticalDivider(),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("60 ตัน",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo[800])),
                        Text("ผลผลิตอ้อย",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: 90,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("72 ตัน",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[800])),
                      Text("สัญญาอ้อย",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                    ],
                  ),
                  Container(
                    width: 1,
                    color: Colors.grey,
                    child: VerticalDivider(),
                  ),
                  Column(
                    children: [
                      Text("50 แปลง",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[800])),
                      Text("จำนวนแปลง",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                    ],
                  ),
                  Container(
                    height: 300,
                    width: 1,
                    color: Colors.grey,
                    child: VerticalDivider(),
                  ),
                  Column(
                    children: [
                      Text("30 ไร่",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[800])),
                      Text("พื้นที่ทั้งหมด",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: 90,
            width: 350,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("15 ไร่",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[800])),
                      Text("พื้นที่เข้าร่วมโครงการ",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      Text("GETS FARMING",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 1,
                    color: Colors.grey,
                    child: VerticalDivider(),
                  ),
                  Column(
                    children: [
                      Text("10 ไร่",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[800])),
                      Text("พื้นที่เข้าร่วมโครงการ",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      Text("BONSUCRO",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 1,
                    color: Colors.grey,
                    child: VerticalDivider(),
                  ),
                  Column(
                    children: [
                      Text("10 ",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[800])),
                      Text("พื้นที่เข้าร่วมโครงการ",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
