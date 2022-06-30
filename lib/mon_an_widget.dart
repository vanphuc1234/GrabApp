import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chi_tiet_quan_an_page_widget.dart';
import 'products_page_widget.dart';
import 'mon_an_construct.dart';

// ignore: must_be_immutable
class MonAnWidget extends StatefulWidget {
  ChiTietMonAn chiTietMonAn;

  MonAnWidget(this.chiTietMonAn, {Key? key}) : super(key: key);

  @override
  State<MonAnWidget> createState() => _MonAnWidgetState();
}

class _MonAnWidgetState extends State<MonAnWidget> {
  double heightText = 1.4;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      //TODO: Navigator to ChiTietQuanAnWidget
      child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChiTietQuanAnWidget()));
          },
          child: Row(
            children: [
              // Image Preview
              Image(
                image: AssetImage(widget.chiTietMonAn.imageLink.toString()),
                width: 120,
                fit: BoxFit.cover,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Text Khuyen Mai
                    Text(widget.chiTietMonAn.isKhuyenMai! ? 'KHUYẾN MÃI' : '',
                        softWrap: true,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 10,
                          color: const Color.fromARGB(255, 255, 123, 7),
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible,
                          height: widget.chiTietMonAn.isKhuyenMai! ? 1 : 0,
                        )),
                    Text(
                      //SHOP NAME
                      widget.chiTietMonAn.shopName.toString(), maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                          height: heightText,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis),
                    ),
                    //Line 2
                    Row(
                      children: [
                        Text(
                          //DISTANCE
                          '${widget.chiTietMonAn.timeDistance} - ${widget.chiTietMonAn.distance} - ',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            height: heightText,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                        Text(
                          widget.chiTietMonAn.rating.toString(),
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            height: heightText,
                          ),
                        ),
                      ],
                    ),
                    //Food Type
                    Text(
                      widget.chiTietMonAn.isKhuyenMai!
                          ? '${widget.chiTietMonAn.foodType.toString()}\n'
                          : widget.chiTietMonAn.foodType.toString(),
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 13,
                        height: heightText,
                        color: Colors.black54,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                        widget.chiTietMonAn.isKhuyenMai!
                            ? KhuyenMai.maKhuyenMai[widget.chiTietMonAn.maKm!]
                                .toString()
                            : '',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          height:
                              widget.chiTietMonAn.isKhuyenMai! ? heightText : 0,
                          letterSpacing: 0.5,
                          backgroundColor:
                              const Color.fromARGB(255, 250, 239, 217),
                          fontSize: 12,
                          color: Colors.black54,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              )),
              //TODO: Favorite Button
              TextButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  context.read<FavoriteStateManager>().changeHeart();
                },
                child: context.watch<FavoriteStateManager>().favorite,
              )
            ],
          )),
    );
  }
}
