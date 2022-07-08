import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/cua_hang_gan_toi/cubit/cua_hang_gan_toi_cubit.dart';
import 'package:flutter_grab_app/data/cua_hang_data.dart';

import '../../views/products_header_widget.dart';
import '../../views/products_list_bar_widget.dart';
import 'cua_hang_widget.dart';
import '../../model/chi_tiet_cua_hang.dart';

List<CuaHangWidget> buildMenuQuanAn(List<ChiTietCuaHang> cuaHangList) {
  List<CuaHangWidget> quanAnWidgetList = [];
  for (var i in cuaHangList) {
    var chiTietQuanAn = i;

    var newQuanAnWidget = CuaHangWidget(chiTietQuanAn);
    quanAnWidgetList.add(newQuanAnWidget);
  }
  return quanAnWidgetList;
}

class CuaHangGanToiWidget extends StatelessWidget {
  const CuaHangGanToiWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CuaHangGanToiBloc()..add(LoadEvent()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //header
              const ProductHeaderWidget(),
              //MenuBar
              const ProductListBarWidget(),
              //MainContent
              Expanded(
                child: BlocBuilder<CuaHangGanToiBloc, CuaHangGanToiState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is LoadedState) {
                      return RefreshIndicator(
                        onRefresh: () async =>
                            BlocProvider.of<CuaHangGanToiBloc>(context)
                                .add(PullToRefreshEvent()),
                        child: ListView(
                          children: state.cuaHangWidget as List<Widget>,
                        ),
                      );
                    } else if (state is FailedToLoadState) {
                      return Center(
                        child: Text('Error occured: ${state.error}'),
                      );
                    }
                    return Container();
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          child: IconButton(
            icon: const Icon(Icons.shopping_bag_outlined,
                size: 30, color: Colors.black),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class KhuyenMai {
  static List<String> maKhuyenMai = [
    'Giảm 30%',
    'Giảm 25%',
    'Grab25',
    'NGUOIMOI45',
    'NGUOIMOI65',
    'NGUOIMOI15'
  ];

  bool yn = false;
  KhuyenMai(this.yn);
}
