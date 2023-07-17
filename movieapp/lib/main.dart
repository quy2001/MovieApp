import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';
import 'package:movieapp/di/get_it.dart' as getIt;

Future<void>main() async {
  unawaited(getIt.init());
  // ApiClient apiClient = ApiClient(Client());
  // MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  // MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  //movieRepository.getTrending();
  //GetTrending getTrending = GetTrending(movieRepository);
  GetTrending getTrending = getIt.getItInstance<GetTrending>();
  final Either<AppError,List<MovieEntity>?> eitherRespone =await getTrending(NoParams());

  eitherRespone.fold(
      (l){
        print('error');
        print(l);
      },
      (r) {
        print('list of video');
        print(r);
      },
  );

  //getTrending();
  //final movies = await getTrending();
  // if(movies !=null){
  //
  // }else{
  //
  // }
  // dataSource.getTrending();
  // dataSource.getPopular();
  // dataSource.getPlayingNow();
  // dataSource.getComingSoon();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(

      ),
    );
  }
}
