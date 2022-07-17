import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_grab_app/repositories/cua_hang_repository.dart';

import '../../models/cua_hang_listing_vm.dart';



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

class LoadMoreEvent extends CuaHangGanToiEvent {}

class SortEvent extends CuaHangGanToiEvent {
  int sortBy;
  SortEvent({required this.sortBy});
}

class PullToRefreshEvent extends CuaHangGanToiEvent {}

class FavoriteEvent extends CuaHangGanToiEvent {
  CuaHangListingVm? cuaHangListing;
  FavoriteEvent({this.cuaHangListing});
}

abstract class CuaHangGanToiState {
  int currentPage = 0;
  List<CuaHangListingVm> cuaHangList = [];
  int? sortBy;

  String toString() {
    return "cuaHangList: ${cuaHangList.length} sortBy: ${sortBy} currentPage: ${currentPage}";
  }
}

class LoadingState extends CuaHangGanToiState {
  int? sortBy;
  int currentPage = 0;

  LoadingState({this.sortBy});
}

class LoadedState extends CuaHangGanToiState {
  List<CuaHangListingVm> cuaHangList;
  int currentPage = 0;
  int? sortBy;

  LoadedState({required this.cuaHangList, required this.currentPage, required this.sortBy});
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
    on<LoadMoreEvent>(_onLoadMoreEvent);
    on<SortEvent>(_onSortEvent);
  }

  void _onSortEvent(SortEvent event, Emitter<CuaHangGanToiState> emit) async {

    state.sortBy = event.sortBy;
    print('event.sortBy ${event.sortBy}');

    emit(LoadingState(sortBy: state.sortBy));
    try {
      final data = await _cuaHangRepository.getCuaHangGanToiListing(state);
      CuaHangGanToiState newState = LoadedState(
          cuaHangList: data.cuaHangListing, 
          currentPage: state.currentPage,
          sortBy: state.sortBy
        );

      print("Test before emit: ${newState.toString()}");
      
      emit(newState);
    } catch (e) {
      emit(FailedToLoadState(message: e.toString()));
    }
  }

  void _onLoadEvent(event, emit) async {
    emit(LoadingState(sortBy: state.sortBy));
    try {
      final data =
          await _cuaHangRepository.getCuaHangGanToiListing(state);
      emit(LoadedState(
          cuaHangList: data.cuaHangListing, 
          currentPage: state.currentPage,
          sortBy: state.sortBy));
    } catch (e) {
      emit(FailedToLoadState(message: e.toString()));
    }
  }

  void _onLoadMoreEvent(event, emit) async {
    try {
      var page = state.currentPage + 1;
      state.currentPage = page;
      final data = await _cuaHangRepository.getCuaHangGanToiListing(state);
      var newCuaHangList = [...state.cuaHangList, ...data.cuaHangListing];

      emit(LoadedState(cuaHangList: newCuaHangList, currentPage: page,
          sortBy: state.sortBy));
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
    debugPrint('isLiked = ${shop.is_liked}');
    emit(LoadedState(
        cuaHangList: state.cuaHangList, 
        currentPage: state.currentPage,
        sortBy: state.sortBy));
  }
}
