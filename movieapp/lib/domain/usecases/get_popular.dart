import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../entities/no_params.dart';
import '../repositories/movie_reponsitory.dart';

class GetPopular extends UseCase<List<MovieEntity>?,NoParams>{
  final MovieRepository repository;
  GetPopular(this.repository);
  @override
  Future<Either<AppError,List<MovieEntity>?>> call(NoParams noParams) async{
    return await repository.getPopular();
  }

}