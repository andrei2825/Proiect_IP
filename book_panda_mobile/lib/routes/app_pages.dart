import 'package:book_panda/screens/homeOut.dart';
import 'package:book_panda/screens/login.dart';
import 'package:book_panda/screens/signup.dart';
import 'package:book_panda/screens/view_rooms/view/view_request.dart';
import 'package:book_panda/screens/view_rooms/view/view_room.dart';
import 'package:book_panda/screens/view_rooms/view/view_rooms.dart';
import 'package:get/get.dart';

import '../screens/splash/view/splash_screen.dart';
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
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUp(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
    ),
    GetPage(
      name: Routes.HOMEOUT,
      page: () => HomeOut(),
    ),
    GetPage(
      name: Routes.VIEWROOM,
      page: () => ViewRoom(),
    ),
    GetPage(
      name: Routes.VIEWREQUEST,
      page: () => ViewRequest()
    )
  ];
}
