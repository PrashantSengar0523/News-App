import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nexus_news/firebase_options.dart';
import 'package:nexus_news/screens/discover.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:provider/provider.dart'; 
import 'package:get/get.dart';
import 'package:nexus_news/controllers/drawer_controller.dart';
import 'repos/authentication_repo.dart'; 
import 'screens/auth.dart'; // Import the Auth screen
import 'screens/onboarding.dart'; // Import the Onboarding screen

Future<void> main() async {
  // Widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Get Storage
  await GetStorage.init();

  // Await Splash Screen 
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepo()));

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
      initialRoute: '/', // Define the initial route
      getPages: [
        GetPage(name: '/', page: () => const Scaffold(
          backgroundColor: TColors.white,
          body: Center(child: CircularProgressIndicator()), // Loading screen until redirection
        )),
        GetPage(name: '/Auth', page: () => Auth()), // Auth page route
        GetPage(name: '/Onboarding', page: () => const Onboarding()), // Onboarding page route
      ],
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nexus News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/', // Define the initial route
      home: const Discover(),
    );
  }
}
