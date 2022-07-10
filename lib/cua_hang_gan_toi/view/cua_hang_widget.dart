import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cua_hang_gan_toi_cubit.dart';
import 'cua_hang_gan_toi_list_widget.dart';
import '../../model/chi_tiet_cua_hang.dart';

// ignore: must_be_immutable
class CuaHangWidget extends StatelessWidget {
  ChiTietCuaHang chiTietCuaHang;

  CuaHangWidget(this.chiTietCuaHang, {Key? key}) : super(key: key);

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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const ChiTietQuanAnWidget()));
          },
          child: Row(
            children: [
              // Image Preview
              SizedBox(
                width: 120,
                height: 100,
                child: Image(
                  image: AssetImage(chiTietCuaHang.imageLink.toString()),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Text Khuyen Mai
                    Text(chiTietCuaHang.isKhuyenMai! ? 'KHUYẾN MÃI' : '',
                        softWrap: true,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 10,
                          color: const Color.fromARGB(255, 255, 123, 7),
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible,
                          height: chiTietCuaHang.isKhuyenMai! ? 1 : 0,
                        )),
                    Text(
                      //SHOP NAME
                      chiTietCuaHang.shopName.toString(), maxLines: 1,
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
                          '${chiTietCuaHang.timeDistance} - ${chiTietCuaHang.distance} - ',
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
                          chiTietCuaHang.rating.toString(),
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
                      chiTietCuaHang.isKhuyenMai!
                          ? '${chiTietCuaHang.foodType.toString()}\n'
                          : chiTietCuaHang.foodType.toString(),
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 13,
                        height: heightText,
                        color: Colors.black54,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                        chiTietCuaHang.isKhuyenMai!
                            ? KhuyenMai.maKhuyenMai[chiTietCuaHang.maKm!]
                                .toString()
                            : '',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          height: chiTietCuaHang.isKhuyenMai! ? heightText : 0,
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

              TextButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  BlocProvider.of<CuaHangGanToiBloc>(context)
                      .add(FavoriteEvent(chiTietCuaHang: chiTietCuaHang));
                  print("Pressed ${chiTietCuaHang.id}");
                  // BlocProvider.of<CuaHangGanToiCubit>(context)
                  //     .toogleLike(chiTietCuaHang.id);
                },
                child: chiTietCuaHang.isLiked
                    ? Icon(Icons.favorite)
                    : Icon(
                        Icons.favorite_border,
                        color: Colors.black54,
                      ),
              )
            ],
          )),
    );
  }
}
