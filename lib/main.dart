import 'package:flutter/material.dart';
import 'package:giaodien_demo/screens/splash.dart';
import 'package:provider/provider.dart';
import 'package:giaodien_demo/providers/app_provider.dart';

import 'util/const.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

      ),

      home:  const SplashScreen(),
    );

  // Widget build(BuildContext context) {
  //   return Consumer<AppProvider>(
  //     builder: (BuildContext context, AppProvider appProvider, Widget child) {
  //       return MaterialApp(
  //         key: appProvider.key,
  //         debugShowCheckedModeBanner: false,
  //         navigatorKey: appProvider.navigatorKey,
  //         title: Constants.appName,
  //         theme: appProvider.theme,
  //         darkTheme: Constants.darkTheme,
  //         home: SplashScreen(),
  //       );
  //     },
  //   );
  }
}