
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_trending.dart';
import '../movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc,
  }) : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
      MovieCarouselEvent event,
      ) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold(
            (l) => MovieCarouselError(),
            (movies) {
              movieBackdropBloc
                  .add(MovieBackdropChangedEvent(movies![event.defaultIndex]));
              return MovieCarouselLoaded(
                movies: movies,
                defaultIndex: event.defaultIndex,
              );
              // return MovieCarouselLoaded(
              //   movies: movies!.toList(),
              //   defaultIndex: event.defaultIndex,
              // );
        },
      );
    }
  }
}