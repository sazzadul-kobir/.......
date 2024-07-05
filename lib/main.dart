import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manikvhai/screens/seller_card_screen.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.compact,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home:SellerCard() ,
    );
  }
}



