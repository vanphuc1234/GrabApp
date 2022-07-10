import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_grab_app/model/chi_tiet_cua_hang.dart';

import '../../data/cua_hang_data.dart';

class CuaHangObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }
}

class CuaHangGanToiCubit extends Cubit<List<ChiTietCuaHang>> {
  CuaHangGanToiCubit() : super(dataMenu());

  void toogleLike(shopId) {
    var shop = state.firstWhere((item) => item.id == shopId);
    shop.isLiked = !shop.isLiked;
    emit([...state]);
  }
}

//---------------------------------------------------------------------Bloc
abstract class CuaHangGanToiEvent {}

class LoadEvent extends CuaHangGanToiEvent {}

class PullToRefreshEvent extends CuaHangGanToiEvent {}

class FavoriteEvent extends CuaHangGanToiEvent {
  ChiTietCuaHang? chiTietCuaHang;
  FavoriteEvent({this.chiTietCuaHang});
}

abstract class CuaHangGanToiState {
  late final List<ChiTietCuaHang> chiTietCuaHangList;

  CuaHangGanToiState({this.chiTietCuaHangList = const []});
}

class FavoriteState extends CuaHangGanToiState {
  final ChiTietCuaHang chiTietCuaHang;

  FavoriteState({required this.chiTietCuaHang});
}

class LoadingState extends CuaHangGanToiState {}

class LoadedState extends CuaHangGanToiState {
  List<ChiTietCuaHang> chiTietCuaHangList;
  LoadedState({required this.chiTietCuaHangList});
}

class FailedToLoadState extends CuaHangGanToiState {
  Error? error;
  FailedToLoadState({this.error});
}

class CuaHangGanToiBloc extends Bloc<CuaHangGanToiEvent, CuaHangGanToiState> {
  CuaHangGanToiBloc() : super(LoadingState()) {
    on<LoadEvent>(_onLoadEvent);
    on<PullToRefreshEvent>(_onLoadEvent);
    on<FavoriteEvent>(_onFavoriteEvent);
  }

  void _onLoadEvent(event, Emitter<CuaHangGanToiState> emit) async {
    emit(LoadingState());
    try {
      final data = dataMenu();
      emit(LoadedState(chiTietCuaHangList: data));
    } catch (e) {
      emit(FailedToLoadState(error: e as Error));
    }
  }

  void _onFavoriteEvent(event, emit) async {
    var shop = state.chiTietCuaHangList.firstWhere((item) {
      return item.id == event.chiTietCuaHang.id;
    });
    debugPrint('Found shop: ${shop.shopName}');
    shop.isLiked = !shop.isLiked;
    emit(LoadedState(chiTietCuaHangList: state.chiTietCuaHangList));
  }
}
