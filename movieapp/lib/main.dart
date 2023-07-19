import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';
import 'package:movieapp/di/get_it.dart' as getIt;
import 'package:movieapp/presentation/widgets/movie_app.dart';
void main(){
     WidgetsFlutterBinding.ensureInitialized();
     unawaited(
     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
     unawaited(getIt.init());
 runApp(MovieApp());
}


