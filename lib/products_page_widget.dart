import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/favorite_cubit.dart';
import 'package:flutter_grab_app/products_list_bar_widget.dart';

import 'products_header_widget.dart';
import 'cua_hang_widget.dart';
import 'cua_hang_construct.dart';
import 'cua_hang_data.dart';

List<CuaHangWidget> buildMenuQuanAn(List<ChiTietCuaHang> cuaHangList) {
  List<CuaHangWidget> quanAnWidgetList = [];
  for (var i = 0; i < cuaHangList.length; i++) {
    var chiTietQuanAn = cuaHangList[i];

    var newQuanAnWidget = CuaHangWidget(chiTietQuanAn);
    //     Consumer<ChiTietQuanAn>(builder: (context, model, child) {
    //   print("Mon an: ${model.shopName}, ${model.isLiked}");
    //   return QuanAnWidget(chiTietQuanAn);
    // });

    quanAnWidgetList.add(newQuanAnWidget);
  }
  return quanAnWidgetList;
}

class ProductsPageWidget extends StatelessWidget {
  const ProductsPageWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CuaHangCubit(),
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
                child: BlocBuilder<CuaHangCubit, List<ChiTietCuaHang>>(
                  builder: (context, state) {
                    return ListView(
                      children: buildMenuQuanAn(state),
                    );
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
