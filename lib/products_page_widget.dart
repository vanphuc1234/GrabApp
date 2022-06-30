import 'package:flutter/material.dart';
import 'package:flutter_grab_app/products_list_bar_widget.dart';
import 'products_header_widget.dart';
import 'mon_an_widget.dart';
import 'mon_an_construct.dart';
import 'mon_an_data.dart';

class FavoriteStateManager extends ChangeNotifier {
  Widget favorite = const Icon(
    Icons.favorite_border,
    color: Colors.black38,
  );
  bool isFavorite = false;

  var saved = <Widget>{}; //NEW
  var alreadySaved;
  void addFavorite() {
    for (var i in buildMenuMonAn()) {
      alreadySaved = saved.contains(buildMenuMonAn());
    }
  }

  void changeHeart() {
    isFavorite = !isFavorite;
    isFavorite
        ? favorite = const Icon(
            Icons.favorite,
            color: Colors.red,
          )
        : favorite = const Icon(
            Icons.favorite_border,
            color: Colors.black38,
          );

    notifyListeners();
  }
}

List<MonAnWidget> buildMenuMonAn() {
  List<MonAnWidget> ListMonAnWidget = [];
  List<ChiTietMonAn> data = dataMenu();

  for (var i = 0; i < data.length; i++) {
    var chiTietMonAn = data[i];
    var newMonAnWidget = MonAnWidget(chiTietMonAn);
    ListMonAnWidget.add(newMonAnWidget);
  }
  return ListMonAnWidget;
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
    return Scaffold(
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
              children: buildMenuMonAn(),
            )),
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
