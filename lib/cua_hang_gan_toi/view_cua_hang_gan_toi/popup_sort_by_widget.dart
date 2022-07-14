import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grab_app/cua_hang_gan_toi/cubit/cua_hang_gan_toi_bloc.dart';

class PopUpFilterWidget extends StatefulWidget {
  const PopUpFilterWidget({Key? key}) : super(key: key);

  @override
  State<PopUpFilterWidget> createState() => _PopUpFilterWidgetState();
}

class _PopUpFilterWidgetState extends State<PopUpFilterWidget> {
  List<int> listValue = [0, 1, 2];
  var groupValue = 0;
  bool selectedRating = false;
  bool selectedReviewCount = false;

  @override
  Widget build(BuildContext context) {
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
                value: listValue[0],
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                  });
                  BlocProvider.of<CuaHangGanToiBloc>(context).add(LoadEvent());
                },
                secondary: const Icon(Icons.favorite_border_outlined),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              const Divider(thickness: 2),
              RadioListTile(
                title: const Text('Rating'),
                contentPadding: const EdgeInsets.all(0),
                value: listValue[1],
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                    selectedReviewCount = false;
                    selectedRating = true;
                  });
                  BlocProvider.of<CuaHangGanToiBloc>(context)
                      .add(SortByRatingEvent());
                },
                selected: selectedRating,
                secondary: const Icon(Icons.star_border),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              const Divider(thickness: 2),
              RadioListTile(
                title: const Text('Review Count'),
                contentPadding: const EdgeInsets.all(0),
                value: listValue[2],
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                    selectedReviewCount = true;
                    selectedRating = false;
                  });
                  BlocProvider.of<CuaHangGanToiBloc>(context)
                      .add(SortByReviewCountEvent());
                },
                selected: selectedReviewCount,
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
}
