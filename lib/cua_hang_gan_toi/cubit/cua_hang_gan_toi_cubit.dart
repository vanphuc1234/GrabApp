import 'package:bloc/bloc.dart';
import 'package:flutter_grab_app/model/chi_tiet_cua_hang.dart';
import 'package:flutter_grab_app/cua_hang_gan_toi/view/cua_hang_widget.dart';
import 'package:flutter_grab_app/cua_hang_gan_toi/view/cua_hang_gan_toi_list_widget.dart';

import '../../data/cua_hang_data.dart';

class CuaHangObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
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

class FavoriteEvent extends CuaHangGanToiEvent {}

abstract class CuaHangGanToiState {}

class FavoriteState extends CuaHangGanToiState {
  ChiTietCuaHang? chiTietCuaHang;
  FavoriteState({this.chiTietCuaHang});
}

class LoadingState extends CuaHangGanToiState {}

class LoadedState extends CuaHangGanToiState {
  List<CuaHangWidget>? cuaHangWidget;
  LoadedState({this.cuaHangWidget});
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
      final data = buildMenuQuanAn(dataMenu());
      emit(LoadedState(cuaHangWidget: data));
    } catch (e) {
      emit(FailedToLoadState(error: e as Error));
    }
  }

  void _onFavoriteEvent(
      FavoriteEvent event, Emitter<CuaHangGanToiState> emit) async {
    List<ChiTietCuaHang> listData = dataMenu();

    var shop = listData.firstWhere((item) {
      return item.id == FavoriteState().chiTietCuaHang?.id;
    });
    shop.isLiked = !shop.isLiked;
    emit(FavoriteState());
  }
}
