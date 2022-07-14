import 'package:flutter/material.dart';

class PopUpFilterWidget extends StatefulWidget {
  const PopUpFilterWidget({Key? key}) : super(key: key);

  @override
  State<PopUpFilterWidget> createState() => _PopUpFilterWidgetState();
}

class _PopUpFilterWidgetState extends State<PopUpFilterWidget> {
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
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sort By',
                style: TextStyle(fontSize: 20),
              ),
              RadioListTile(
                contentPadding: const EdgeInsets.all(0),
                value: 1,
                groupValue: groupValue,
                onChanged: (newValue) {
                  setState(() {
                    groupValue = newValue as int;
                  });
                  Navigator.pop(context);
                },
                title: const Text('Best Match'),
                secondary: const Icon(Icons.favorite_border_outlined),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              const Divider(thickness: 2),
              RadioListTile(
                contentPadding: const EdgeInsets.all(0),
                value: 2,
                groupValue: groupValue,
                onChanged: (newValue) {
                  setState(() {
                    groupValue = newValue as int;
                  });
                  Navigator.pop(context);
                },
                title: const Text('Rating'),
                secondary: const Icon(Icons.star_border),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              const Divider(thickness: 2),
              RadioListTile(
                contentPadding: const EdgeInsets.all(0),
                value: 3,
                groupValue: groupValue,
                onChanged: (newValue) {
                  setState(() {
                    groupValue = newValue as int;
                  });
                  Navigator.pop(context);
                },
                title: const Text('Rate Count'),
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
