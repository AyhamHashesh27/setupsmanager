import 'package:flutter/material.dart';
import 'package:setups_manager/Services/authentication.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Setups Manager',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: FlatButton(
        child: Text('logout'),
        onPressed: () async {
          print('Logging out');
          await _auth.signOut();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
