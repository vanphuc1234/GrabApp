import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/repositories/cua_hang_repository.dart';

import 'models/chi_tiet_cua_hang_vm.dart';

class ChiTietCuaHangCubit extends Cubit<ChiTietCuaHangVm?> {
  final _cuaHangRepository = CuaHangRepository();
  ChiTietCuaHangCubit() : super(null);

  void getChiTietCuaHang(String cuaHangId) async {
    final response =
        await Future.wait([_cuaHangRepository.getChiTietCuaHang(cuaHangId)]);
    final chiTietCuaHang = response[0];

    emit(ChiTietCuaHangVm(
        id: chiTietCuaHang.id,
        image_url: chiTietCuaHang.image_url,
        name: chiTietCuaHang.name,
        rating: chiTietCuaHang.rating));
  }

  void clearChiTietCuaHang() => emit(null);
}
