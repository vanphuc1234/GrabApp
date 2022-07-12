import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/chi_tiet_cua_hang_cubit.dart';

class NavCubit extends Cubit<String?> {
  //Cubit<String?>: Cubit quan li id cua page
  ChiTietCuaHangCubit chiTietCuaHangCubit;
  NavCubit({required this.chiTietCuaHangCubit}) : super(null);

  void showCuaHangDetails(String cuaHangId) {
    chiTietCuaHangCubit.getChiTietCuaHang(cuaHangId);
    emit(cuaHangId);
  }

  void popToListingView() {
    emit(null);
  }
}
