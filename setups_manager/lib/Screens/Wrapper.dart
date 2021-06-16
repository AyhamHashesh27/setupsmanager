// // @dart=2.9

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:setups_manager/Data/Models/setups_manager_user.dart';
// import 'package:setups_manager/Presentation/Home/Home.dart';
// import 'package:setups_manager/Presentation/Login/Login.dart';

// class Wrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<SetupsManagerUser>(context);
//     print(user);

//     // return either the Home or Authenticate widget
//     if (user == null)
//       return Login();
//     else
//       return Home();
//   }
// }
