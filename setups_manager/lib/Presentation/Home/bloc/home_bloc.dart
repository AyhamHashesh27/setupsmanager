import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:setups_manager/Data/Models/Setup.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:setups_manager/Data/RepositoriesImp/SetupsDBRepositoryImp.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:setups_manager/Domain/Repositories/SetupsDBRepository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  SetupsDBRepository repository = new SetupsDBRepositoryImp();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchAllSetups) {
      try {
        yield HomeLoading();

        List<Setup> setups = await repository.getSetups();

        yield HomeLoaded(setups);
      } catch (e) {
        yield HomeFailure("Failed to fetch servers from database");
        print(e.toString());
      }
    } else if (event is DeleteSetup) {
      // TODO: Not implemented yet
    }
  }
}
