import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grab_app/mon_an_construct.dart';
import 'package:flutter_grab_app/mon_an_widget.dart';
import 'package:flutter_grab_app/products_page_widget.dart';

class MonAnObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}

class MonAnCubit extends Cubit<List<MonAnWidget>> {
  MonAnCubit() : super(buildMenuQuanAn());

  void Liked() {
    emit(state);
  }
}
