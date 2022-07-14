import 'dart:ffi';

import 'package:flutter/material.dart';

class PopUpWidget extends StatefulWidget {
  const PopUpWidget({Key? key}) : super(key: key);

  @override
  State<PopUpWidget> createState() => _PopUpWidgetState();
}

class _PopUpWidgetState extends State<PopUpWidget> {
  var groupValue = 1;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sort By',
                style: TextStyle(fontSize: 20),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.all(0),
                value: 1,
                groupValue: groupValue,
                onChanged: (newValue) {
                  setState(() {
                    groupValue = newValue as int;
                  });
                },
                title: Text('Best Match'),
                secondary: Icon(Icons.favorite_border_outlined),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              Divider(thickness: 2),
              RadioListTile(
                contentPadding: EdgeInsets.all(0),
                value: 2,
                groupValue: groupValue,
                onChanged: (newValue) {
                  setState(() {
                    groupValue = newValue as int;
                  });
                },
                title: Text('Rating'),
                secondary: Icon(Icons.star_border),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              Divider(thickness: 2),
              RadioListTile(
                contentPadding: EdgeInsets.all(0),
                value: 3,
                groupValue: groupValue,
                onChanged: (newValue) {
                  setState(() {
                    groupValue = newValue as int;
                  });
                },
                title: Text('Rate Count'),
                secondary: Icon(Icons.rate_review_outlined),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              Divider(thickness: 2),
            ],
          ),
        ),
      ),
    );
  }
}
