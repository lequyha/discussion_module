// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_module/core_module.dart' as _i987;
import 'package:discussion_module/src/data/repositories/remote/comment_repository.dart'
    as _i549;
import 'package:discussion_module/src/ui/comment/bloc/comment_bloc.dart'
    as _i291;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i549.CommentRepository>(() =>
        _i549.CommentRepository(commentService: gh<_i987.CommentService>()));
    gh.factory<_i291.CommentBloc>(() =>
        _i291.CommentBloc(commentRepository: gh<_i549.CommentRepository>()));
    return this;
  }
}
