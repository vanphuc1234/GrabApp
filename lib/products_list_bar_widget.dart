import 'package:flutter/material.dart';

class ProductListBarWidget extends StatelessWidget {
  const ProductListBarWidget({Key? key}) : super(key: key);

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
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(30, 30),
                // ignore: prefer_const_constructors
                shape: StadiumBorder(),
                // ignore: prefer_const_constructors
                side: BorderSide(width: 1, color: Colors.black12),
              ),
              onPressed: () {},
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.clear_all,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          BoLoc('Khuyến mãi'),
          BoLoc('Phí giao hàng'),
        ],
      ),
    );
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
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(40, 40),
          maximumSize: const Size(140, 50),
          // ignore: prefer_const_constructors
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {},
        child: Text(
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
