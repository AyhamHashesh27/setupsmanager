// @dart=2.9
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:setups_manager/Data/Models/setups_manager_user.dart';
// import 'package:setups_manager/Presentation/Home/Home.dart';
import 'package:setups_manager/Presentation/Login/Login.dart';
// import 'package:setups_manager/Screens/Wrapper.dart';
// import 'package:setups_manager/Services/authentication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SM',
      home: Login(),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('SM'),
    //   ),
    //   body: Login(),
    // );
    // return StreamProvider<SetupsManagerUser>.value(
    //   value: AuthenticationService().user,
    //   initialData: null,
    //   child: MaterialApp(
    //     title: 'SM',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: Wrapper(),
    //   ),
    // );
  }
}
