// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setups_manager/Presentation/Home/bloc/home_bloc.dart';
import 'package:setups_manager/Presentation/SharedWidgets/Loading.dart';
import 'package:setups_manager/Services/authentication.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final AuthenticationService _auth = AuthenticationService();

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

      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is DeleteSetupSuccess) {
            print("Setup Deleted");
            // BlocProvider.of<SpecialitiesListBloc>(context)
            //     .add(FetchAllSpecialities());
          }
          // if (state is SpecialityDeleteFailed) {
          //   showSnackBar("لم يتم التخصص");
          // }
        },
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeInitial) {
            BlocProvider.of<HomeBloc>(context).add(FetchAllSetups());
          }
          if (state is HomeLoading) {
            return Loading();
          }
          if (state is HomeFailure) {
            //TODO make faield widget
            return Text("Failed");
          }
          if (state is HomeLoaded) {
            // return body(state);
            print(state.setupsList[0].name);
          }

          //default return -> should never reach
          return Container();
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('-'),
        onPressed: () async {
          print('Logging out');
          // await _auth.signOut();
          Navigator.of(context).pop();
        },
      ),
      // body: FlatButton(
      //   child: Text('logout'),
      //   onPressed: () async {
      //     print('Logging out');
      //     await _auth.signOut();
      //   },
      // ),
    );
  }
}
