// import 'package:setups_manager/Data/Models/setups_manager_user.dart';
// @dart=2.9
import 'package:setups_manager/Data/Models/Setup.dart';

abstract class SetupsDBRepository {
  Future<List<Setup>> getSetups();
}
