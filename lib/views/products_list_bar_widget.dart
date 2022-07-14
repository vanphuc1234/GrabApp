import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/cua_hang_gan_toi/cubit/cua_hang_gan_toi_bloc.dart';

import '../cua_hang_gan_toi/view_cua_hang_gan_toi/popup_sort_by_widget.dart';

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
          SortByModel(
              name: 'Review Count',
              event1: SortByReviewCountEvent(),
              event2: LoadEvent()),
          SortByModel(
            name: 'Rating',
            event1: SortByRatingEvent(),
            event2: LoadEvent(),
          ),
        ],
      ),
    );
  }

  void _openDialog() async {
    var selected = await Navigator.of(context).push(MaterialPageRoute<String>(
        builder: (BuildContext context) {
          return const PopUpFilterWidget();
        },
        fullscreenDialog: true));
    if (selected != null) {
      setState(() {
        selected = selected;
      });
    }
  }
}

class SortByModel extends StatefulWidget {
  String name = '';
  var event1;
  var event2;

  SortByModel(
      {Key? key,
      required this.name,
      required this.event1,
      required this.event2})
      : super(key: key);

  @override
  State<SortByModel> createState() => _SortByModelState();
}

class _SortByModelState extends State<SortByModel> {
  bool isSelected = IsSelectedState().isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ActionChip(
        label: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });

          isSelected
              ? BlocProvider.of<CuaHangGanToiBloc>(context).add(widget.event1)
              : BlocProvider.of<CuaHangGanToiBloc>(context).add(widget.event2);
        },
        backgroundColor: isSelected ? Colors.green[400] : Colors.white,
        side: const BorderSide(color: Colors.black12, width: 1),
      ),
    );
  }
}
