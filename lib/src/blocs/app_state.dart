import 'package:equatable/equatable.dart';
import 'package:flutter_movie_deep_dive_test/src/models/models.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppError extends AppState {}

class AppEmpty extends AppState {}

class AppLoading extends AppState {}

class AppLoaded extends AppState {
  final MoviesResponse response;

  AppLoaded({required this.response});
}
