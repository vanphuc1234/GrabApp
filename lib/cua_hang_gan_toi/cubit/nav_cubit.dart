import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cua_hang_listing_vm.dart';

class NavCubit extends Cubit<String?> {
  NavCubit() : super(null);

  void showCuaHangDetails(CuaHangListingVm chiTietCuaHang) {
    emit(chiTietCuaHang.id);
  }
}
