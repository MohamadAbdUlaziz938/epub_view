import 'package:epub_book/view/home_view/home_view.dart';
import 'package:epub_book/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';

void main() {
  final app = MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
    ],
    child: const MyApp(),
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //to launch android 12 we add
    //android:exported:'true' to each activity in application and provider receiver
    // we find the when open manifest in android editor in merge manifest section
    // this link is helper https://stackoverflow.com/questions/68554294/androidexported-needs-to-be-explicitly-specified-for-activity-apps-targeting
    // these manifest need updated :
    // r2-streamer-kotlin:1.0.4-2 manifest
    // O2BizServices:folioreader:o2biz-folio-7.0 manifest
    // or we get activity that package us it and add theme to manifest in our project

    // convert app to english to fit with folioreader not work with arabic device
    // go to vocsy_epub_viewer plugin in android folder to set config channel add this code below to fit with arabic devices
    // Resources res = context.getResources();
    // DisplayMetrics dm = res.getDisplayMetrics();
    // android.content.res.Configuration conf = res.getConfiguration();
    // conf.setLocale(new Locale("en")); // API 17+ only.
    // res.updateConfiguration(conf, dm);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('en'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      supportedLocales: [const Locale('en')],
      home: const HomeView(),
    );
  }
}
