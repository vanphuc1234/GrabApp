// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/cua_hang_gan_toi/cubit/cua_hang_gan_toi_cubit.dart';

import 'cua_hang_gan_toi/view_cua_hang_gan_toi/cua_hang_gan_toi_list_widget.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: CuaHangObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grab Food',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CuaHangGanToiBloc()..add(LoadEvent()))
        ],
        child: const CuaHangGanToiWidget(),
      ),
    );
  }
}
