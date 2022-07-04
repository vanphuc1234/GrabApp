import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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