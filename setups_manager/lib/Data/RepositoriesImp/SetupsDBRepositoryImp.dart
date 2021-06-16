// @dart=2.9
import 'package:setups_manager/Data/Models/Setup.dart';
import 'package:setups_manager/Data/RemoteDataSource/SetupsDB.dart';
import 'package:setups_manager/Domain/Repositories/SetupsDBRepository.dart';

class SetupsDBRepositoryImp extends SetupsDBRepository {
  SetupsDB repo = SetupsDB();
  @override
  Future<List<Setup>> getSetups() async {
    return await repo.getSetups();
  }
}
