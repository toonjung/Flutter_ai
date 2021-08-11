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
        // height: 400,
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
                    colors: [Colors.white, Colors.pink],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                )),
            ClipPath(
                clipper: ClipPathClass1(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.pink, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    //boxShadow: [BoxShadow(color: Color)]
                  ),
                )),
            Container(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,

                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            // elevation: 10, // foreground
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80)),
                          ),
                          onPressed: () {},
                          child: Text("SIGN IN"),
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
          ],
        ),
      ),
    );
  }
}

class ClipPathClass1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width / 1.3, size.height / 3);
    var endPoint = Offset(size.width / 1.5, 0);

    Path path = Path();

    path.lineTo(0, size.height / 3);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width / 2, size.height / 5);
    var endPoint = Offset(size.width, size.height / 5);

    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width / 1.5, 0);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width / 2, size.height / 2);
    var endPoint = Offset(size.width, size.height);

    Path path = Path();
    path.moveTo(size.width, size.height / 1.5);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
