import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopcart/model/productlist.dart';
import 'package:shopcart/model/productmodel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
    });
    on<Homeintialize>(homeinitail);
  }

  FutureOr<void> homeinitail(Homeintialize event, Emitter<HomeState> emit) async{
    emit(HomeSucces(prolist:productlist ));   
  }
}
