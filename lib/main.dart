// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/app_navigator.dart';
import 'package:flutter_grab_app/chi_tiet_cua_hang_cubit.dart';
import 'package:flutter_grab_app/cua_hang_gan_toi/cubit/cua_hang_gan_toi_bloc.dart';
import 'package:flutter_grab_app/nav_cubit.dart';

import 'SimpleBlocObserver.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final chiTietCuaHangCubit = ChiTietCuaHangCubit();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grab Food',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        primarySwatch: Colors.green,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CuaHangGanToiBloc()..add(LoadEvent())),
          BlocProvider(
              create: (context) =>
                  NavCubit(chiTietCuaHangCubit: chiTietCuaHangCubit)),
          BlocProvider(
            create: (context) => chiTietCuaHangCubit,
          )
        ],
        child: const AppNavigator(),
      ),
    );
  }
}
