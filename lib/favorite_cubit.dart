import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grab_app/cua_hang_construct.dart';
import 'package:flutter_grab_app/cua_hang_widget.dart';
import 'package:flutter_grab_app/products_page_widget.dart';

import 'cua_hang_data.dart';

class CuaHangObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}

class CuaHangCubit extends Cubit<List<ChiTietCuaHang>> {
  CuaHangCubit() : super(dataMenu());

  void Liked(shopId) {
    emit(state);
  }
}
