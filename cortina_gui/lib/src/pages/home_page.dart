import 'package:cortina_gui/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return controller.loading.value
                  ? Container()
                  : Container(
                      child: Obx(() {
                        return Material(
                          color:
                              controller.led.value ? Colors.green : Colors.red,
                          child: InkWell(
                            onTap: () async {
                              await controller.controlLed();
                            },
                            child: const SizedBox(
                              height: 50,
                              width: 50,
                            ),
                          ),
                        );
                      }),
                    );
            })
          ],
        ),
      ),
    );
  }
}
