import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map map = {};
  String photo;

  @override
  Widget build(BuildContext context) {
    map = map.isNotEmpty ? map : ModalRoute.of(context).settings.arguments;
    print(map['time']);
    photo = map['isDay'] ? 'assets/day.png' : 'assets/night.png';
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(photo), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: SafeArea(
            child: Column(
          children: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  map = {
                    'time': result['time'],
                    'location': result['location'],
                    'isDay': result['isDay'],
                    'flag': result['flag'],
                  };
                },
                icon: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  map['location'],
                  style: TextStyle(
                      fontSize: 30.0, letterSpacing: 2.0, color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              map['time'],
              style: TextStyle(
                  fontSize: 66.0, letterSpacing: 2.0, color: Colors.white),
            )
          ],
        )),
      ),
    ));
  }
}
