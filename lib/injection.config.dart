// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:discussion_module/src/data/repositories/remote/comment_repository_impl.dart'
    as _i674;
import 'package:discussion_module/src/data/service/comment_service.dart'
    as _i281;
import 'package:discussion_module/src/domain/remote/comment_repository.dart'
    as _i470;
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
    gh.lazySingleton<_i281.CommentService>(
        () => _i281.CommentService.create(gh<_i361.Dio>()));
    gh.lazySingleton<_i470.CommentRepository>(() => _i674.CommentRepositoryImpl(
        commentService: gh<_i281.CommentService>()));
    gh.factory<_i291.CommentBloc>(() =>
        _i291.CommentBloc(commentRepository: gh<_i470.CommentRepository>()));
    return this;
  }
}
