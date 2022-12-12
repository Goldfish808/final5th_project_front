import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:riverpod_firestore_steam1/core/util/constant/move.dart';
import 'package:riverpod_firestore_steam1/firebase_options.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/notice_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/join_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/login_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/main_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/mypage_main_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/schedule/write_schedule_page.dart';

import 'core/routes.dart';
import 'core/theme.dart';
import 'view/pages/main/login/find_password_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: Routers.loginForm,
        routes: getRouters(),
        title: "TODOFRIENDS",
      ),
    );
  }
}
