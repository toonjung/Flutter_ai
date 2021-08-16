import 'package:flutter/material.dart';

class ClipperTest extends StatefulWidget {
  const ClipperTest({Key? key}) : super(key: key);

  @override
  _ClipperTestState createState() => _ClipperTestState();
}

class _ClipperTestState extends State<ClipperTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: double.maxFinite,
        color: Colors.white,
        child: Stack(
          children: [
            ClipPath(
                clipper: ClipPathClass3(),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.pink, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                )),
            ClipPath(
                clipper: ClipPathClass2(),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Color(0xfffe59be1), Colors.pink, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                )),
            ClipPath(
              clipper: ClipPathClass1(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffe17cd2),
                      Colors.pink,
                      Color(0xffee65b6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  //boxShadow: [BoxShadow(color: Color)]
                ),
              ),
            ),
            Container(
              height: double.infinity,
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              // Shadow position
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(hintText: 'Email'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: 'Password'),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: null,
                          child: Text(
                            "FORGAT PASSWORD?",
                            style: TextStyle(color: Colors.pink),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("กด SIGN IN");
                          },
                          child: Container(
                            width: 200,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xfffd395f1),
                                  Color(0xffffa509b),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.facebook,
                          color: Colors.indigo[800],
                          size: 50,
                        ),
                        Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.grey[400],
                      height: 5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: null,
                          child: Text("DONT HAVE AN ACCOUNT? "),
                        ),
                        TextButton(
                            onPressed: null,
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(color: Colors.pink),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(55.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Drilllle",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipPathClass1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(
        Rect.fromLTWH(-100, -130, size.width * 5 / 5, size.width * 5 / 5));
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromLTWH(
        size.width * 0.6, -70, size.width * 2 / 3, size.width * 2 / 3));
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromLTWH(size.width * 0.55, size.height * 0.75,
        size.width * 2 / 3, size.width * 2 / 3));
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



// class ClipPathClass3 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var controlPoint = Offset(size.width / 2, size.height * 3 / 4);
//     var endPoint = Offset(size.width / 2, size.height);

//     Path path = Path();
//     path.moveTo(size.width, size.height * 3 / 4);
//     path.quadraticBezierTo(
//         controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
//     path.lineTo(size.width, size.height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
