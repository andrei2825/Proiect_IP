import 'package:book_panda/controllers/bindings/authBinding.dart';
import 'package:book_panda/screens/view_rooms/view/view_rooms.dart';
import 'package:get/get.dart';

import '../screens/view_rooms/binding/view_rooms_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.VIEWROOMS,
      page: () => ViewRooms(),
      binding: ViewRoomsBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: AuthBinding(),
    )
  ];
}
