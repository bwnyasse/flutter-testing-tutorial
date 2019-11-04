abstract class AppEvent {}

class FetchEvent extends AppEvent {
  final region;

  FetchEvent({this.region});
}
