import 'package:bonyeza_kazi/app.dart';
import 'package:bonyeza_kazi/common/config/bloc_observer.dart';
import 'package:bonyeza_kazi/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureInjection();
  Bloc.observer = SimpleBlocObserver();
  await service.SystemChrome.setEnabledSystemUIOverlays(
      service.SystemUiOverlay.values);
  await service.SystemChrome.setPreferredOrientations(
      [service.DeviceOrientation.portraitUp]);

  runApp(App());
}
