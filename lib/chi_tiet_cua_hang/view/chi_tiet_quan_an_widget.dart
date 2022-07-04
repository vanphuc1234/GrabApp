import 'package:flutter/material.dart';
import 'package:flutter_grab_app/model/chi_tiet_cua_hang.dart';
import 'package:provider/provider.dart';

class ChiTietQuanAnWidget extends StatefulWidget {
  const ChiTietQuanAnWidget({Key? key}) : super(key: key);

  @override
  State<ChiTietQuanAnWidget> createState() => _ChiTietQuanAnWidgetState();
}

class _ChiTietQuanAnWidgetState extends State<ChiTietQuanAnWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          const Image(image: AssetImage('assets/food1.png')),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(children: [
              SizedBox(
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          primary: Colors.black38,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios_new_rounded)),
                    Consumer<ChiTietCuaHang>(
                      builder: ((context, isLike, child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.black38,
                          ),
                          onPressed: () {},
                          child: Icon(Icons.favorite_border),
                        );
                      }),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 10, // blur radius
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: Wrap(children: [
                  ListTile(
                    onTap: () {},
                    contentPadding: const EdgeInsets.all(15),
                    title: const Text(
                      'Cơm ngon Sài Gòn - Bạch Đằng',
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right_rounded)),
                  ),
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 1,
                  ),
                  ListTile(
                    minLeadingWidth: 1,
                    leading: const Icon(Icons.motorcycle_outlined),
                    title: const Text('Giao hàng không tiếp xúc'),
                    subtitle: const Text('0.5 km, 20 phút | 16.000đ'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right_rounded)),
                  ),
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 1,
                  ),
                  const ListTile(
                    minLeadingWidth: 1,
                    leading: Icon(Icons.discount_outlined),
                    title: Text(
                      'Chỉ trên GrabFood. Khao món 0Đ. Giảm 60 đơn 150k. Giảm 90k đơn 200k',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 1,
                    leading: const Icon(Icons.discount_outlined),
                    title: const Text(
                      'Tận hưởng ưu đãi',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right_rounded)),
                  ),
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 1,
                  ),
                  ListTile(
                    minLeadingWidth: 1,
                    leading: const Icon(Icons.card_membership),
                    title: const Text(
                      'Xem ưu đãi sẵn có',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right_rounded)),
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Text(
                  'Ưu đãi hôm nay',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              Container(
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 13),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 1, //spread radius
                                  blurRadius: 3, // blur radius
                                  offset: const Offset(0, 2),
                                )
                              ]),
                          width: 350,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Nước ép táo ',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 17)),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      'Subtitle Subtitle Subtitle Subtitle Subtitle',
                                      style: TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                    Text('28.000đ',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationThickness: 1.5,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                ),
                              ),
                              const Image(
                                  image: AssetImage('assets/food4.jpg')),
                            ],
                          ),
                        );
                      })),
              Container(
                color: Colors.white,
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    for (var i = 1; i < 15; i++)
                      Image.network(
                        'https://picsum.photos/250?image=$i',
                        width: 171,
                      ),
                  ],
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
