import 'package:finances_app/src/view/add_expense.dart';
import 'package:finances_app/src/view/finance_page.dart';
import 'package:finances_app/src/view/home_page.dart';
import 'package:finances_app/src/view/login_page.dart';
import 'package:finances_app/src/view/update.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBSzc0N0Y49rU_u6gx0DsX9RZwV5wTO7Tw",
      appId: "1:375156291519:android:b5981bc2bc69c46cb2530a",
      messagingSenderId: "375156291519",
      projectId: "financesapp-7e866",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color.fromARGB(98, 75, 75, 75)),
        scaffoldBackgroundColor: Color.fromARGB(99, 197, 197, 197),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(97, 8, 160, 28)),
        useMaterial3: true,
      ),
      initialRoute: ('/login'),
      routes: {
        ('/'): (context) => const HomePage(),
        ('/finance'): (context) => const FinancePage(),
        ('/add'): (context) => const AddPage(),
        ('/update'): (context) => const UpdatePage(),
        ('/login'): (context) => const LoginPage(),
      },
    );
  }
}
