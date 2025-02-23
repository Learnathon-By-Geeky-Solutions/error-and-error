import 'package:flutter/material.dart';
import 'package:stitch_hub/screen/loginScreen.dart';
import 'package:stitch_hub/screen/registrationScreen.dart';
import 'package:stitch_hub/screen/splash.dart';
import 'package:stitch_hub/screen/successScreen.dart'; // Import success screen
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV2c21ieGphdmFzbHFjcnNubGt2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAzMjQ1NjcsImV4cCI6MjA1NTkwMDU2N30.yi00-W6uREmN4HDqYK0AnPE4Ms3Rk_B-C7xPaFaO9r0",
    url: "https://uvsmbxjavaslqcrsnlkv.supabase.co",
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      initialRoute: "/",
      routes: {
        "/": (context) => splashScreen(),
        "/login": (context) => LoginScreen(),
        "/registration": (context) => RegistrationScreen(),
        "/success": (context) => SuccessScreen(), // Register success screen
      },
    );
  }
}
