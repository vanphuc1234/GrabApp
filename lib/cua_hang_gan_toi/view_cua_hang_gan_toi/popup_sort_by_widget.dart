import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/cua_hang_gan_toi/cubit/cua_hang_gan_toi_bloc.dart';

class PopUpFilterWidget extends StatelessWidget {
  var groupValue = 0;
  PopUpFilterWidget({Key? key}) : super(key: key);
  
  Widget buildSortWidgets(context, CuaHangGanToiState state) {
    print('Check: ${state.sortBy}');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sort By',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Divider(thickness: 2),
              RadioListTile(
                title: const Text('Best Match'),
                contentPadding: const EdgeInsets.all(0),
                value: 1,
                groupValue: state.sortBy,
                onChanged: (value) {
                  BlocProvider.of<CuaHangGanToiBloc>(context).add(SortEvent(sortBy: 1));
                  Navigator.pop(context);
                },
                selected: state.sortBy == 1,
                secondary: const Icon(Icons.favorite_border_outlined),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              const Divider(thickness: 2),
              RadioListTile(
                title: const Text('Review Count'),
                contentPadding: const EdgeInsets.all(0),
                value: 2,
                groupValue: state.sortBy,
                onChanged: (value) {
                  BlocProvider.of<CuaHangGanToiBloc>(context).add(SortEvent(sortBy: 2));
                  Navigator.pop(context);
                },
                selected: state.sortBy == 2,
                secondary: const Icon(Icons.star_border),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              const Divider(thickness: 2),
              RadioListTile(
                title: const Text('Rating'),
                contentPadding: const EdgeInsets.all(0),
                value: 3,
                groupValue: state.sortBy,
                onChanged: (value) {
                  BlocProvider.of<CuaHangGanToiBloc>(context).add(SortEvent(sortBy: 3));
                  Navigator.pop(context);
                },
                selected: state.sortBy == 3,
                secondary: const Icon(Icons.rate_review_outlined),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              const Divider(thickness: 2),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CuaHangGanToiBloc, CuaHangGanToiState>(
                builder: (context, state) {
                  return buildSortWidgets(context, state);
                });
  }
}
