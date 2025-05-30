import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
 // Common spacing
    static const double paddingTiny = 4.0;
    static double paddingSmall = 8.0;
    static const double paddingMediumSmall = 12.0;
    static const double paddingMedium = 16.0;
    static const double paddingLarge = 24.0;
    static const double paddingHuge = 32.0;

 // App color
    static ColorScheme colorScheme = ColorScheme.fromSeed(
           seedColor: Colors.amber.shade200,     // Välj något som känns bra
    );
    
    static TextTheme textTheme = GoogleFonts.nunitoTextTheme();


    static const TextStyle largeHeading = TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
    );
    static const TextStyle mediumHeading = TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
    );

    static const TextStyle smallHeading = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
    );
    
    static const TextStyle smallText = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
    );

    static const SizedBox pad = SizedBox(height: 16);
    static const SizedBox padSmall = SizedBox(height: 8);
    static const SizedBox padBig = SizedBox(height: 32);
}