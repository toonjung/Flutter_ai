import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: [
              Image(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://htmlcolorcodes.com/assets/images/colors/baby-blue-color-solid-background-1920x1080.png'),
              ),
              Positioned(
                  bottom: -80,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: Colors.black26,
                            spreadRadius: 5)
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                          'https://i.joylada.net/10617559/writer/5e2d9ba70087d60001e992a2/cover-4b31b39a-41b3-40ad-bcb7-6f62dbce8a3d.jpg/thumbnail'),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 110,
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  "HAPPY WORK",
                  style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "ตำแหน่ง : UX UI Designer",
                  style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.paid_rounded,
                            color: Colors.yellow[800],
                          )),
                      Expanded(
                          flex: 0,
                          child: Text(
                            "259",
                            style: TextStyle(
                                color: Colors.lightGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                      Expanded(
                        flex: 0,
                        child: Text(" เหรียญ"),
                      ),
                      Expanded(
                        child: Container(
                          height: 30,
                          child: VerticalDivider(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("อีเมล : happywork@email.com"),
                            Text("เบอร์ : 0123456789"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), //B
          Container(
            height: 300,
            color: Colors.indigo[50],
            child: GridView.count(
              //row
              crossAxisCount: 3,
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              crossAxisSpacing: 10, mainAxisSpacing: 10,
              children: _ListGirdview(9),
            ),
          ), //c
        ],
      ),
    );
  }
}

List<Container> _ListGirdview(int count) {
  List<String> _nameList = [
    "เบิกค่าใช้จ่าย",
    "รางวัล",
    "องค์กร",
    "การจ้างงาน",
    "เปลี่ยนเวลางาน",
    "ข่าวสาร",
    "ตั้งค่าล่วงเวลา",
    "เบิกของ",
    "เสนอความเห็น"
  ];

  List<IconData> _iconList = [
    Icons.payments_outlined,
    Icons.redeem,
    Icons.people_outline,

    Icons.calendar_today,
    Icons.schedule_sharp,
    Icons.receipt_long_outlined,
    // Icon(Icons.post_add),
    //Icon(Icons.description_outlined  ),

    Icons.access_alarm,
    Icons.local_atm,
    Icons.pending_outlined,
    //Icon(Icons.sms_outlined ),
  ];
  return List.generate(
      count,
      (index) => Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _iconList[index],
                  color: Colors.indigo[700],
                  size: 50,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  _nameList[index],
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ));
}
