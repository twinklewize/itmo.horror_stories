// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:horror_stories/src/core/services/data/dio/dio_client.dart'
    as _i4;
import 'package:horror_stories/src/core/services/data/hive/hive_client.dart'
    as _i6;
import 'package:horror_stories/src/core/services/logger/logger.dart' as _i3;
import 'package:horror_stories/src/features/auth/data/repositories/auth_repository.dart'
    as _i9;
import 'package:horror_stories/src/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart'
    as _i13;
import 'package:horror_stories/src/features/main/data/repositories/game_repository.dart'
    as _i5;
import 'package:horror_stories/src/features/main/data/repositories/rooms_repository.dart'
    as _i7;
import 'package:horror_stories/src/features/main/presentation/blocs/active_rooms_bloc/active_rooms_bloc.dart'
    as _i8;
import 'package:horror_stories/src/features/main/presentation/blocs/available_rooms_bloc/available_rooms_bloc.dart'
    as _i10;
import 'package:horror_stories/src/features/main/presentation/blocs/game_bloc/game_bloc.dart'
    as _i11;
import 'package:horror_stories/src/features/main/presentation/blocs/room_bloc/room_bloc.dart'
    as _i12;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AppLogger>(_i3.AppLogger());
  gh.singleton<_i4.DioBackendClient>(_i4.DioBackendClient());
  gh.singleton<_i5.GameRepository>(
      _i5.GameRepository(gh<_i4.DioBackendClient>()));
  gh.singleton<_i6.HiveMemoryClient>(_i6.HiveMemoryClient());
  gh.singleton<_i7.RoomsRepository>(
      _i7.RoomsRepository(gh<_i4.DioBackendClient>()));
  gh.singleton<_i8.ActiveRoomsBloc>(
      _i8.ActiveRoomsBloc(gh<_i7.RoomsRepository>()));
  gh.singleton<_i9.AuthRepository>(_i9.AuthRepository(
    gh<_i4.DioBackendClient>(),
    gh<_i6.HiveMemoryClient>(),
  ));
  gh.singleton<_i10.AvailableRoomsBloc>(
      _i10.AvailableRoomsBloc(gh<_i7.RoomsRepository>()));
  gh.singleton<_i11.GameBloc>(_i11.GameBloc(gh<_i5.GameRepository>()));
  gh.singleton<_i12.RoomBloc>(_i12.RoomBloc(gh<_i7.RoomsRepository>()));
  gh.singleton<_i13.AuthBloc>(_i13.AuthBloc(gh<_i9.AuthRepository>()));
  return getIt;
}
