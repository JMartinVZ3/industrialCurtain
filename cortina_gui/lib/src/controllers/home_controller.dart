import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool led = false.obs;
  RxBool loading = false.obs;

  Future<void> turnOnLed() async {
    loading.value = true;
    final response = await turnOnLedAPI();
    if (response) {
      loading.value = false;
      led.value = true;
    } else {
      loading.value = false;
      Get.snackbar("Error", "Ha ocurrido un error");
    }
  }

  Future<void> turnOffLed() async {
    loading.value = true;
    final response = await turnOffLedAPI();
    if (response) {
      loading.value = false;
      led.value = false;
    } else {
      loading.value = false;
      Get.snackbar("Error", "Ha ocurrido un error");
    }
  }

  List data = [];

  Future<void> controlLed() async {
    if (led.value == true) {
      await turnOffLed();
    } else {
      await turnOnLed();
    }
  }

  Future<bool> turnOnLedAPI() async {
    final endPoint = Uri.http("127.0.0.1:5000", '/on');

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> turnOffLedAPI() async {
    final endPoint = Uri.http("127.0.0.1:5000", '/off');

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
