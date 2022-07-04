// ignore: unused_import
import 'package:flutter/material.dart';

class ChiTietMonAn extends ChangeNotifier {
  String? id;
  bool? isKhuyenMai;
  String? imageLink;
  String? shopName;
  String? timeDistance;
  String? distance;
  double? rating;
  String? foodType;
  int? maKm;
  bool? isLiked = false;

  void like() {
    this.isLiked = true;
    notifyListeners();
  }

  void unlike() {
    this.isLiked = false;
    notifyListeners();
  }

  ChiTietMonAn({
    this.id,
    this.isKhuyenMai,
    this.imageLink,
    this.shopName,
    this.timeDistance,
    this.distance,
    this.rating,
    this.foodType,
    this.maKm,
  });
}
