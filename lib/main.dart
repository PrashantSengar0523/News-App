import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nexus_news/firebase_options.dart';
import 'package:nexus_news/screens/edit_profile.dart';
import 'package:provider/provider.dart'; 
import 'package:get/get.dart';
import 'package:nexus_news/controllers/drawer_controller.dart';

import 'repos/authentication_repo.dart'; 

Future<void> main()async {
  final WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();

  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value)=>Get.put(AuthenticationRepo()));


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TDrawerController()),
        // Add other providers here if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nexus News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const EditProfile(),
    );
  }
}
