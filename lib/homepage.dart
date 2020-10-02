import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'customdrawer.dart';
import 'main.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.pink[100],
          drawer: CustomDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: FirstScreen(),
          status: drawerStatus,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.pink,
            child: Icon(
              drawerStatus == FSBStatus.FSB_OPEN
                  ? Icons.navigate_before
                  : Icons.navigate_next,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            }),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.pink[100],
      title: "data",
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 140),
            child: Image.asset('assets/appwritelogo3.png', fit: BoxFit.contain),
          ),
          elevation: 0,
          backgroundColor: Colors.pink[100],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 250, top: 20),
              child: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: new Text(
                  "v0.8 is out now!",
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
                elevation: 5,
                color: Colors.green,
                splashColor: Colors.pink,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Secure Open-Source Backend Server for Web, Mobile & Flutter Developers",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.grey[200]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Appwrite provides developers with a set of easy-to-use and integrate REST APIs to manage their core backend needs.",
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[200]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100.0, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                            ? FSBStatus.FSB_CLOSE
                            : FSBStatus.FSB_OPEN;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: new Text(
                      "Services",
                      style: TextStyle(color: Colors.white),
                    ),
                    elevation: 5,
                    color: Colors.pink,
                    splashColor: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: new Text(
                      "GitHub",
                      style: TextStyle(color: Colors.pink),
                    ),
                    elevation: 5,
                    color: Colors.white,
                    splashColor: Colors.pink,
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
