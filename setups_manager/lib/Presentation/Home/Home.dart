// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setups_manager/Presentation/Home/bloc/home_bloc.dart';
import 'package:setups_manager/Presentation/Login/Login.dart';
import 'package:setups_manager/Presentation/SharedWidgets/Loading.dart';
// import 'package:setups_manager/Services/authentication.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final AuthenticationService _auth = AuthenticationService();
  static int setupsCounter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Login(),
                    ));
              },
              icon: Icon(Icons.logout),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Setups Manager',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            )
          ],
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
            return Center(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('#')),
                    DataColumn(
                        label: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'Version',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'Hotfix',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'Build',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'CEPH Deployment Type',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'Health',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'Nuage',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'In Used By',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'Used For',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ],
                  rows: state.setupsList
                      .map(
                        (element) => DataRow(cells: [
                          DataCell(Text('${setupsCounter++}')),
                          DataCell(Text(element.name.toString())),
                          DataCell(
                            Text(element.version.toString()),
                          ),
                          DataCell(
                            Text(element.hotfix.toString()),
                          ),
                          DataCell(
                            Text(element.build.toString()),
                          ),
                          DataCell(
                            Text(element.cephDeploymentType.toString()),
                          ),
                          DataCell(
                            Text(element.health.toString()),
                          ),
                          DataCell(
                            Text(element.nuage.toString()),
                          ),
                          DataCell(
                            Text(element.inUseBy.toString()),
                          ),
                          DataCell(
                            Text(element.usedFor.toString()),
                          ),
                        ]),
                      )
                      .toList(),
                ),
              ),
            );
          }

          //default return -> should never reach
          return Container();
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: () async {
          print('Logging out');
          // await _auth.signOut();
          // Navigator.of(context).pop();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => Login(),
              ));
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
