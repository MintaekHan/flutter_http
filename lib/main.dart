import 'package:flutter/material.dart';
import 'package:flutter_http/users.dart';
import 'package:flutter_http/users.api.dart';

String authKey = "100100";
// first
// second

void main() {
  authKey = "100100";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('로그인'),
        ),
        body: Container(
          child: FutureBuilder(
            future: fetchUsers(authKey),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Users user = snapshot.data[index];
                      return Text(
                        '${user.empname}',
                        style: TextStyle(fontSize: 20.0),
                      );
                    });
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}
