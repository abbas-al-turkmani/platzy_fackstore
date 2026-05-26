import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/constants/locales.dart';
import 'core/dependency_injection/service_locator.dart';
import 'my_app.dart';

Future<void> main() async {
  // FlutterNativeSplash.preserve(
  //   widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  // );

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: 'assets/env/api_links.env');
  initDependencyInjection();

  // FlutterNativeSplash.remove();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: locales,
      useFallbackTranslations: true,
      useFallbackTranslationsForEmptyResources: true,
      startLocale: locales[0],
      fallbackLocale: locales[0],
      child: const MyApp(),
    ),
  );
}
