import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), title: 'Flutter Speed Dial Examples'));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin {
  ScrollController scrollController;
  bool dialVisible = true;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  Widget buildBody() {
    return ListView.builder(
      controller: scrollController,
      itemCount: 30,
      itemBuilder: (ctx, i) => ListTile(title: Text('Item $i')),
    );
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      animatedIcon: AnimatedIcons.menu_close,
      visible: dialVisible,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.mail, color: Colors.grey),
          backgroundColor: Colors.white,
          onTap: () => print('FIRST CHILD'),
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          label: "Lorem Ipsum",
        ),
        SpeedDialChild(
          child: Icon(Icons.mail, color: Colors.grey),
          backgroundColor: Colors.white,
          onTap: () => print('SECOND CHILD'),
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          label: "Lorem Ipsum diaasda asdad"
        ),
        SpeedDialChild(
          child: Icon(Icons.mail, color: Colors.grey),
          backgroundColor: Colors.white,
          onTap: () => print('THIRD CHILD'),
          label: "Lorem Ipsum diaasda asdad"
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Speed Dial')),
      body: buildBody(),
      floatingActionButton: buildSpeedDial(),
    );
  }
}
