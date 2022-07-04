import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grab_app/mon_an_construct.dart';
import 'package:flutter_grab_app/mon_an_widget.dart';

class FavoriteObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}

class FavoriteCubit extends Cubit<List<ChiTietMonAn>> {
  FavoriteCubit(store) : super(store);

  void Liked() {}
}
