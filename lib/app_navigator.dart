import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_grab_app/nav_cubit.dart';
import 'chi_tiet_cua_hang/view/chi_tiet_cua_hang_widget.dart';
import 'cua_hang_gan_toi/view_cua_hang_gan_toi/cua_hang_gan_toi_list_widget.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, String?>(builder: (context, cuaHangId) {
      return Navigator(
        pages: [
          const MaterialPage(
            child: CuaHangGanToiWidget(),
          ),
          if (cuaHangId != null)
            MaterialPage(
              child: ChiTietQuanAnWidget(),
            )
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToListingView();
          return route.didPop(result);
        },
      );
    });
  }
}
