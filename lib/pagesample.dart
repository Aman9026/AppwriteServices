import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'bottomnav.dart';
import 'main.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                        backgroundColor: Colors.pink,
                        hoverColor: Colors.pink[100],
                        child: Icon(Icons.menu),
                        elevation: 0.1,
                        onPressed: () {
                          setState(() {
                            drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                                ? FSBStatus.FSB_CLOSE
                                : FSBStatus.FSB_OPEN;
                          });
                          //Navigator.canPop(context);
                          Navigator.pop(
                              context, drawerStatus = FSBStatus.FSB_CLOSE);
                        }),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.laptop_windows,
                              color: currentIndex == 1
                                  ? Colors.pink
                                  : Colors.white,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                            }),
                        Container(
                          width: size.width * 0.005,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.code,
                              color: currentIndex == 2
                                  ? Colors.pink
                                  : Colors.white,
                            ),
                            onPressed: () {
                              setBottomBarIndex(2);
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 200),
            child: new Form(
              child: Theme(
                data: new ThemeData(
                    brightness: Brightness.light,
                    primarySwatch: Colors.pink,
                    inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                      color: Colors.pink,
                      fontSize: 20.0,
                    ))),
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      new Padding(padding: const EdgeInsets.only(top: 40.0)),
                      new MaterialButton(
                        height: 40.0,
                        minWidth: 60.0,
                        color: Colors.pink[200],
                        textColor: Colors.white,
                        child: new Text("Login"),
                        onPressed: () => {},
                        splashColor: Colors.pink,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
