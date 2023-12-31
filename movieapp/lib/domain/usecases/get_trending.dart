import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/repositories/movie_reponsitory.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import '../entities/app_error.dart';

class GetTrending extends UseCase<List<MovieEntity>?,NoParams>{
  final MovieRepository repository;
  GetTrending(this.repository);
  @override
  Future<Either<AppError,List<MovieEntity>?>> call(NoParams noParams) async{
    return await repository.getTrending();
  }

}