import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/cua_hang_listing_vm.dart';
import '../cubit/cua_hang_gan_toi_cubit.dart';

// ignore: must_be_immutable
class CuaHangWidget extends StatelessWidget {
  CuaHangListingVm cuaHangListing;

  CuaHangWidget(this.cuaHangListing, {Key? key}) : super(key: key);

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
                  image: NetworkImage(cuaHangListing.image_url.toString()),
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
                    Text(
                      //SHOP NAME
                      cuaHangListing.name.toString(), maxLines: 1,
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
                          cuaHangListing.rating.toString(),
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            height: heightText,
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                        Text(
                          '(${cuaHangListing.review_count})',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            height: heightText,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),

              TextButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  BlocProvider.of<CuaHangGanToiBloc>(context)
                      .add(FavoriteEvent(cuaHangListingVm: cuaHangListing));
                  debugPrint("Pressed ${cuaHangListing.id}");
                  // BlocProvider.of<CuaHangGanToiCubit>(context)
                  //     .toogleLike(cuaHangListing.id);
                },
                child: cuaHangListing.is_liked
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.black54,
                      ),
              )
            ],
          )),
    );
  }
}
