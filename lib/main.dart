import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en'),
      Locale('ar'),
    ],
    path: 'localFiles',
    child: MyApp(),
    fallbackLocale: Locale('ar'),
    startLocale: Locale('ar'),
    useOnlyLangCode: true,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Easy localization'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text((123.45).toString()),
          Text(context.locale.toString()),
          Text("lang".tr()),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if(context.locale == Locale('en')){
          context.setLocale(Locale('ar'));
        }else if(context.locale == Locale('ar')){
          context.setLocale(Locale('en'));
        }
      }),
    );
  }
}
