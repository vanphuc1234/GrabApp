import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/cua_hang_gan_toi/cubit/cua_hang_gan_toi_bloc.dart';

import '../cua_hang_gan_toi/view_cua_hang_gan_toi/popup_sort_by_widget.dart';

class ProductListBarWidget extends StatelessWidget {
  ProductListBarWidget({Key? key}) : super(key: key);

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
                  _openDialog(context);
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
          SortByModel(name: 'Best matched', sortByValue: 1),
          SortByModel(name: 'Review Count', sortByValue: 2),
          SortByModel(name: 'Rating', sortByValue: 3),
        ],
      ),
    );
  }

  void _openDialog(context) async {
    await Navigator.of(context).push(MaterialPageRoute<String>(
        builder: (BuildContext context) {
          return PopUpFilterWidget();
        },
        fullscreenDialog: true));
  }
}

class SortByModel extends StatelessWidget {
  String name = '';
  int? sortByValue;

  SortByModel({required this.name, required this.sortByValue, Key? key}) : super(key: key);

  Widget buildSortByPanel(context, CuaHangGanToiState state) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ActionChip(
        label: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        onPressed: () {
           BlocProvider.of<CuaHangGanToiBloc>(context).add(SortEvent(sortBy: sortByValue!));
        },
        backgroundColor: state.sortBy == sortByValue ? Colors.green[400] : Colors.white,
        side: const BorderSide(color: Colors.black12, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CuaHangGanToiBloc, CuaHangGanToiState>(
                builder: (context, state) {
                  print('Rebuild listing bar ${state.sortBy}');
                  return buildSortByPanel(context, state);
                });
  }
}
