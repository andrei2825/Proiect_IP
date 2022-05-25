import 'package:book_panda/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Rxn<User?> _firebaseUser;

  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser = Rxn<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    ever(_firebaseUser, _initialScreen);
  }

  _initialScreen(User? user) {
    if(user == null) {
      Get.offAllNamed(Routes.HOMEOUT);
    } else {
      Get.offAllNamed(Routes.VIEWROOMS);
    }
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error creating account",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error login",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
