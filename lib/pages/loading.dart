import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/service/WorldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "";

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'url': worldTime.url,
      'time': worldTime.time,
      'isDay': worldTime.isDay,
    });
    //    print(worldTime.time);
//    setState(() {
//      time = worldTime.time;
//    });
  }
//  final spinkit = SpinKitCubeGrid(
//    itemBuilder: (BuildContext context, int index) {
//      return SpinKitCubeGrid(
//          color: Colors.red,
//        size: 80.0,
//      );
//    },
//  );

  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SpinKitFadingGrid(
          color: Colors.redAccent,
          size: 80.0,
        ),
      )
      ,
    );
  }
}
