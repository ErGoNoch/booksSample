import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void showDialogFlash({String title = '', String? content}) {
  navigatorKey.currentContext!.showModalFlash(
      builder: (context, controller) =>
          FlashBar(controller: controller,
            title: Text(title, style: const TextStyle(fontSize: 16)),
            content: Text(content!, style: const TextStyle(fontSize: 14)),
            actions: [TextButton(
              onPressed: () => controller.dismiss(),
              child: const Text('CANCEL'),
            ),
              TextButton(
                  onPressed: () {
                    controller.dismiss();
                  },
                  child: const Text('OK'))
            ],));
}