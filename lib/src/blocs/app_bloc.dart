import 'package:bloc/bloc.dart';
import 'package:flutter_movie_deep_dive_test/src/blocs/blocs.dart';
import 'package:flutter_movie_deep_dive_test/src/services/services.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppService service;
  final AppState initWithState;

  AppBloc({
    required this.service,
    required this.initWithState,
  }) : super(initWithState);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield initWithState;
    //
    // FETCH
    //
    if (event is FetchEvent) {
      yield AppLoading();
      try {
        final list = await service.loadMovies();
        yield AppLoaded(response: list);
      } catch (e) {
        print(e);
        yield AppError();
      }
    }
  }
}
