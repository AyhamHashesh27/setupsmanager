// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setups_manager/Presentation/Home/Home.dart';
import 'package:setups_manager/Presentation/Home/bloc/home_bloc.dart';
// import 'package:setups_manager/Services/authentication.dart';
import 'package:setups_manager/Utilities/constants.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final _username = TextEditingController(text: "");
  final _password = TextEditingController(text: "");

  // final AuthenticationService _auth = AuthenticationService();

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _username,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),

            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: _username.clear,
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Enter Userame',
              hintStyle: kHintTextStyle,
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value != "sm_admin") {
                // return 'Incorrect Username';
                return '';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _password,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: _password.clear,
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter Password',
              hintStyle: kHintTextStyle,
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value != "password") {
                // return 'Incorrect Password';
                return '';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          print("Login Button Pressed");
          if (_formKey.currentState.validate()) {
            // Spin
            // dynamic result = await _auth.signInAnon();
            // if (result == null) {
            //   print('ERROR: in Login');
            // } else {

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => BlocProvider(
                          create: (context) => HomeBloc(),
                          child: Home(),
                        )));

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (_) => BlocProvider(
            //               create: (context) => HomeBloc(),
            //               child: Home(),
            //             )));

            // print('Logged in: ${result.uid}');
            // }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Invalid Credentials',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        padding: EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width / 2.5,
            color: Colors.white38,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Setups Manager Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    _buildUsernameTF(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildPasswordTF(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildLoginBtn(),
                    // Center(
                    //   child: Text(
                    //     'Developed by Quality Assurance Maintenance Team to follow the setups easily',
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 16,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),

          // Row(
          //   children: [
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width / 5,
          //     ),
          //     Container(
          //       height: 400,
          //       width: 600,
          //       child: Text(
          //         'Developed for the Maintenance Team Quality Assurance Team to follow their setups',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 24,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
