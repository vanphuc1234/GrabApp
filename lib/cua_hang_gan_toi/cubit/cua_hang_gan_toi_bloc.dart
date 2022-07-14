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

class LoadMoreEvent extends CuaHangGanToiEvent {}

class SortByReviewCountEvent extends CuaHangGanToiEvent {}

class SortByRatingEvent extends CuaHangGanToiEvent {}

class PullToRefreshEvent extends CuaHangGanToiEvent {}

class FavoriteEvent extends CuaHangGanToiEvent {
  CuaHangListingVm? cuaHangListing;
  FavoriteEvent({this.cuaHangListing});
}

abstract class CuaHangGanToiState {
  int currentPage = 0;
  List<CuaHangListingVm> cuaHangList = [];
  bool isSelected = false;
}

class LoadingState extends CuaHangGanToiState {}

class LoadedState extends CuaHangGanToiState {
  List<CuaHangListingVm> cuaHangList;
  int currentPage = 0;

  LoadedState({required this.cuaHangList, required this.currentPage});
}

class IsSelectedState extends CuaHangGanToiState {
  bool isSelected = false;
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
    on<SortByReviewCountEvent>(_onSortByReviewCountEvent);
    on<SortByRatingEvent>(_onSortByRatingEvent);
  }

  void _onSortByReviewCountEvent(
      SortByReviewCountEvent event, Emitter<CuaHangGanToiState> emit) async {
    state.isSelected = !state.isSelected;
    emit(IsSelectedState());
    emit(LoadingState());
    try {
      final data = await _cuaHangRepository
          .getCuaHangGanToiListByReviewCount(state.currentPage);
      emit(LoadedState(
          cuaHangList: data.cuaHangListing, currentPage: state.currentPage));
    } catch (e) {
      emit(FailedToLoadState(message: e.toString()));
    }
  }

  void _onSortByRatingEvent(event, Emitter<CuaHangGanToiState> emit) async {
    emit(LoadingState());
    try {
      final data = await _cuaHangRepository
          .getCuaHangGanToiListByRating(state.currentPage);
      emit(LoadedState(
          cuaHangList: data.cuaHangListing, currentPage: state.currentPage));
    } catch (e) {
      emit(FailedToLoadState(message: e.toString()));
    }
  }

  void _onLoadEvent(event, emit) async {
    emit(LoadingState());
    try {
      final data =
          await _cuaHangRepository.getCuaHangGanToiListing(state.currentPage);
      emit(LoadedState(
          cuaHangList: data.cuaHangListing, currentPage: state.currentPage));
    } catch (e) {
      emit(FailedToLoadState(message: e.toString()));
    }
  }

  void _onLoadMoreEvent(event, emit) async {
    try {
      var page = state.currentPage + 1;
      final data = await _cuaHangRepository.getCuaHangGanToiListing(page);
      var newCuaHangList = [...state.cuaHangList, ...data.cuaHangListing];

      emit(LoadedState(cuaHangList: newCuaHangList, currentPage: page));
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
        cuaHangList: state.cuaHangList, currentPage: state.currentPage));
  }
}
