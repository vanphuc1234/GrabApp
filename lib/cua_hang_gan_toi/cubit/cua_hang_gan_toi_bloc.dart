import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_grab_app/repositories/cua_hang_repository.dart';

import '../../models/cua_hang_listing_vm.dart';

class CuaHangObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }
}

// class CuaHangGanToiCubit extends Cubit<List<CuaHangListingVm>> {
//   CuaHangGanToiCubit() : super(dataMenu());

//   void toogleLike(shopId) {
//     var shop = state.firstWhere((item) => item.id == shopId);
//     shop.isLiked = !shop.isLiked;
//     emit([...state]);
//   }
// }

//---------------------------------------------------------------------Bloc
abstract class CuaHangGanToiEvent {}

class LoadEvent extends CuaHangGanToiEvent {}

class PullToRefreshEvent extends CuaHangGanToiEvent {}

class FavoriteEvent extends CuaHangGanToiEvent {
  CuaHangListingVm? cuaHangListing;
  FavoriteEvent({this.cuaHangListing});
}

abstract class CuaHangGanToiState {
  List<CuaHangListingVm> cuaHangList = [];
}

class LoadingState extends CuaHangGanToiState {}

class LoadedState extends CuaHangGanToiState {
  List<CuaHangListingVm> cuaHangList;

  LoadedState({required this.cuaHangList});
}

class FailedToLoadState extends CuaHangGanToiState {
  String message;
  FailedToLoadState({required this.message});
}

class CuaHangGanToiBloc extends Bloc<CuaHangGanToiEvent, CuaHangGanToiState> {
  final _cuaHangRepository = CuaHangRepository();
  CuaHangGanToiBloc() : super(LoadingState()) {
    on<LoadEvent>(_onLoadEvent);
    on<PullToRefreshEvent>(_onLoadEvent);
    on<FavoriteEvent>(_onFavoriteEvent);
  }

  void _onLoadEvent(event, emit) async {
    emit(LoadingState());
    try {
      final data = await _cuaHangRepository.getCuaHangGanToiListing();
      emit(LoadedState(cuaHangList: data.cuaHangListingVm));
    } catch (e) {
      emit(FailedToLoadState(message: e.toString()));
    }
  }

  void _onFavoriteEvent(event, emit) async {
    var shop = state.cuaHangList.firstWhere((item) {
      return item.id == event.cuaHangListing.id;
    });
    debugPrint('Found shop: ${shop.name}');
    shop.is_liked = !shop.is_liked;
    emit(LoadedState(cuaHangList: state.cuaHangList));
  }
}