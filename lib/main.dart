import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ojt_app/w.screens/log_in_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  // ChangeNotifierProvider<ThemeProvider>(
  //   create: (_) => ThemeProvider(),
  //   child:

  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      // themeProvider.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: LoginScreen(),
    );
  }
}
