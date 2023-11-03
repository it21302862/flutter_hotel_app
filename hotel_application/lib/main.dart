import 'package:flutter/material.dart';
import 'package:hotel_application/hotel_ui/hotel_home_screen.dart';
import 'package:hotel_application/hotel_ui/hotel_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    title:"Flutter UI App",
    theme:HotelTheme.buildLightTheme(),
    debugShowCheckedModeBanner: false,
    home:const HotelHomeScreen(),
   );
  }
} 