part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState{}

class HomeSucces extends HomeState{
  final List<Productmodel> prolist;

  HomeSucces({
    required this.prolist,
  });
}

class Homeerror extends HomeState{}
