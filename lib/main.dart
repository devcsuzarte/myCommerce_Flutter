import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycommerce/controller/commerce_data.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/login_screen/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

bool isAuth = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemData(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('pt', 'BR'), // English
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF4A90E2)),
          useMaterial3: true,
        ),
        title: 'Flutter Demo',
        // home: const HomeScreen(),
       home: isAuth? const HomeScreen() : LoginScreen(),
      ),
    );
  }
}