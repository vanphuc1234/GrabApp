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
  CuaHangListingVm? cuaHangListingVm;
  FavoriteEvent({this.cuaHangListingVm});
}

abstract class CuaHangGanToiState {
  List<CuaHangListingVm> cuaHangListingVmList = [];
}

class LoadingState extends CuaHangGanToiState {}

class LoadedState extends CuaHangGanToiState {
  List<CuaHangListingVm> cuaHangListingVmList;

  LoadedState({required this.cuaHangListingVmList});
}

class FailedToLoadState extends CuaHangGanToiState {
  Error error;
  FailedToLoadState({required this.error});
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
      emit(LoadedState(cuaHangListingVmList: data.cuaHangListingVm));
    } catch (e) {
      emit(FailedToLoadState(error: e as Error));
    }
  }

  void _onFavoriteEvent(event, emit) async {
    var shop = state.cuaHangListingVmList.firstWhere((item) {
      return item.id == event.CuaHangListingVm.id;
    });
    debugPrint('Found shop: ${shop.name}');
    shop.is_liked = !shop.is_liked;
    emit(LoadedState(cuaHangListingVmList: state.cuaHangListingVmList));
  }
}
