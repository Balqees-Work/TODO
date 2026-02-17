// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/data_source/static/to_do_list_static.dart' as _i50;
import '../data/repo_impl/to_do_repo_impl.dart' as _i299;
import '../domain/repository/to_do_repo.dart' as _i780;
import '../domain/use_case/to_do_use_case.dart' as _i97;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i50.ToDoListStatic>(() => _i50.ToDoListStatic());
    gh.factory<_i780.ToDoRepository>(
      () => _i299.ToDoRepoImplementation(gh<_i50.ToDoListStatic>()),
    );
    gh.factory<_i97.ToDoUseCase>(
      () => _i97.ToDoUseCase(toDoRepository: gh<_i780.ToDoRepository>()),
    );
    return this;
  }
}
