import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist_app/src/app.dart';
import 'package:todolist_app/src/injector/injector.dart';

void main() async {
  await runZonedGuarded(() async {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    WidgetsFlutterBinding.ensureInitialized();
    Injector.init();

    await Injector.instance.allReady();

    runApp(const MyApp());
  }, (error, stack) {
    print('YOYO: $error');
  });
}
