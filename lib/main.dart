import 'package:canteen/core/theme/theme_provider.dart';
import 'package:canteen/features/admin-side/pages/dashboard/presentation/provider/product_provider.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/product_provider.dart';
import 'package:canteen/features/auth/provider/auth_provider.dart';
import 'package:canteen/features/splash-screen/presentation/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:canteen/core/helper/dependencies.dart' as dep;

import 'features/admin-side/pages/product/presentation/provider/product_list_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
         ChangeNotifierProvider(
          create: (_) => ProductListProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeProvider().themeData,
        home: const SplashPage(),
      ),
    );
  }
}
