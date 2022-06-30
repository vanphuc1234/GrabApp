import 'package:flutter/material.dart';

class ProductHeaderWidget extends StatelessWidget {
  const ProductHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      alignment: Alignment.bottomLeft,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                // ignore: prefer_const_constructors
                icon: Icon(Icons.arrow_back_ios),
              ),
              const Text(
                'Grab Food',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
      ),
    );
  }
}
