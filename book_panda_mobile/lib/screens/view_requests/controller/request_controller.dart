import 'package:book_panda/data/firebase_methods.dart';
import 'package:book_panda/models/request.dart';
import 'package:get/get.dart';

class RequestController extends GetxController {
  static RequestController instance = Get.find();
  RxList<Request> requestPendingList = <Request>[].obs;

  List<Request> get requestsPending => requestPendingList;

  RxList<Request> requestAcceptedList = <Request>[].obs;

  List<Request> get requestsAccepted => requestAcceptedList;

  @override
  void onInit() {
    super.onInit();
    requestPendingList.bindStream(FirebaseMethods().requestPendingStream());
    requestAcceptedList.bindStream(FirebaseMethods().requestAcceptedStream());
  }
}