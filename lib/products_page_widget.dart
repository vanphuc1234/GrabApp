import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/favorite_cubit.dart';
import 'package:flutter_grab_app/products_list_bar_widget.dart';

import 'products_header_widget.dart';
import 'mon_an_widget.dart';
import 'mon_an_construct.dart';
import 'mon_an_data.dart';

List<MonAnWidget> buildMenuQuanAn() {
  List<MonAnWidget> ListQuanAnWidget = [];
  List<ChiTietMonAn> data = dataMenu();

  for (var i = 0; i < data.length; i++) {
    var chiTietQuanAn = data[i];

    var newQuanAnWidget = MonAnWidget(chiTietQuanAn);
    //     Consumer<ChiTietQuanAn>(builder: (context, model, child) {
    //   print("Mon an: ${model.shopName}, ${model.isLiked}");
    //   return QuanAnWidget(chiTietQuanAn);
    // });

    ListQuanAnWidget.add(newQuanAnWidget);
  }
  return ListQuanAnWidget;
}

class ProductsPageWidget extends StatefulWidget {
  const ProductsPageWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProductsPageWidget> createState() => _ProductsPageWidgetState();
}

class _ProductsPageWidgetState extends State<ProductsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MonAnCubit(),
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
                  child: ListView(
                      shrinkWrap: true,
                      children: BlocBuilder<MonAnCubit, List<MonAnWidget>>(
                        builder: (context, state) {
                          return state;
                        },
                      ))),
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
