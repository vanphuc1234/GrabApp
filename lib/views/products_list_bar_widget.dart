import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/cua_hang_gan_toi/cubit/cua_hang_gan_toi_bloc.dart';

import '../cua_hang_gan_toi/view_cua_hang_gan_toi/sort_by_widget.dart';

class ProductListBarWidget extends StatefulWidget {
  const ProductListBarWidget({Key? key}) : super(key: key);

  @override
  State<ProductListBarWidget> createState() => _ProductListBarWidgetState();
}

class _ProductListBarWidgetState extends State<ProductListBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 35,
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        //mainAxisSpacing: 6,
        scrollDirection: Axis.horizontal,
        //crossAxisCount: 1,
        //childAspectRatio: 0.31,
        addAutomaticKeepAlives: true,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ActionChip(
                onPressed: () {
                  _openDialog();
                },
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.black12, width: 1),
                label: const Text(
                  'Sort By',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ActionChip(
              label: const Text(
                'Best Match',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onPressed: () {
                BlocProvider.of<CuaHangGanToiBloc>(context).add(LoadEvent());
              },
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.black12, width: 1),

              // ignore: prefer_const_constructors
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ActionChip(
              label: const Text(
                'Review Count',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onPressed: () {
                BlocProvider.of<CuaHangGanToiBloc>(context)
                    .add(SortByReviewCountEvent());
              },
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.black12, width: 1),

              // ignore: prefer_const_constructors
            ),
          ),
          BoLoc('Rating'),
        ],
      ),
    );
  }

  void _openDialog() async {
    var selected = await Navigator.of(context).push(MaterialPageRoute<String>(
        builder: (BuildContext context) {
          return PopUpWidget();
        },
        fullscreenDialog: true));
    if (selected != null) {
      setState(() {
        selected = selected;
      });
    }
  }
}

// ignore: must_be_immutable
class BoLoc extends StatefulWidget {
  String text = '';
  // ignore: use_key_in_widget_constructors
  BoLoc(this.text);

  @override
  State<BoLoc> createState() => _BoLocState();
}

class _BoLocState extends State<BoLoc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ActionChip(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.black12, width: 1),
        onPressed: () {},
        label: Text(
          maxLines: 1,
          // ignore: unnecessary_this
          this.widget.text,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
