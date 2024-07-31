import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/card_controller.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/service/product_firebases.dart';
import 'package:flutter_application_1/views/screens/firspage.dart';
import 'package:flutter_application_1/views/screens/login_page.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CardController()),
          ChangeNotifierProvider(create: (_) => ProductFirebases()),
        ],
        builder: (context, child) {
          return MaterialApp(
            home: StreamBuilder(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, user) {
                if (user.data == null) {
                  return LoginPage();
                } else {
                  return Firspage();
                }
              },
            ),
          );
        });
  }
}
