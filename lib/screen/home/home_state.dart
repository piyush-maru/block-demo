abstract class HomeState {}

class Init extends HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  String title;
  Loaded({required this.title});
}

class Failed extends HomeState {
  String msg;

  Failed({required this.msg});
}
