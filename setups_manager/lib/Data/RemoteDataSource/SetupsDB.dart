// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setups_manager/Data/Models/Setup.dart';
import 'package:setups_manager/Domain/Repositories/SetupsDBRepository.dart';

class SetupsDB extends SetupsDBRepository {
  final CollectionReference setupsCollection =
      Firestore.instance.collection('Setups');
  @override
  Future<List<Setup>> getSetups() async {
    List<Setup> setups = [];
    await setupsCollection
        .getDocuments()
        .timeout(Duration(seconds: 60), onTimeout: () {
          throw ("getSetups: Connection error");
        })
        .then((collection) => {
              collection.documents.forEach((doc) =>
                  {setups.add(Setup.fromJson(doc.data, doc.documentID))})
            })
        .catchError((e) {
          print(e.toString());
          throw ("getSetups: Database connection Error");
        });
    return setups;
  }
}
