import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/utils/calculated_font_size.dart';

ThemeData theme = ThemeData(
  primaryColor: const Color(0xFFFAF6F1), // Couleur primaire
  scaffoldBackgroundColor: const Color(
      0xFFFAF6F1), // Couleur de fond par défaut (utilise primaryColor ou autre)
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF13293D),
    onPrimary: Color(0xFF2A628F),
    secondary: Color(0xFF19297C),
    onSecondary: Color(0xFF16324F),
    error: Colors.transparent,
    onError: Color(0xFFFFFFFF),
    surface: Colors.transparent,
    onSurface: Color(0xFF3E92CC),
  ),
);



// Style pour les titres avec la police Amable
TextStyle titleStyle(BuildContext context) {
  return TextStyle(

    fontSize: calculateTitleFontSize(context),
    color: theme.colorScheme.primary,
    fontFamily: "Amable", // Utilise la police Amable
    decoration: TextDecoration.none,
  );
}

TextStyle titleStyleLarge(BuildContext context) {
  return TextStyle(
    fontSize: calculateTitleFontSize(context, ratio: 10),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.primary,
    fontFamily: "Amable",
    decoration: TextDecoration.none,
  );

}

TextStyle titleStyleMedium(BuildContext context) {
  return TextStyle(
    fontSize: calculateTitleFontSize(context, ratio: 30),
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.primary,
    fontFamily: "Amable", // Police Amable pour les grands titres
    decoration: TextDecoration.none,
  );
}

TextStyle titleStyleSmall(BuildContext context) {
  return TextStyle(
    fontSize: calculateTitleFontSize(context, ratio: 50),
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.primary,
    fontFamily: "Amable", // Police Amable pour les grands titres
    decoration: TextDecoration.none,
  );
}


// Style pour le texte avec la police Autography
TextStyle textStyleText(BuildContext context) {
  return
    GoogleFonts.montserrat().copyWith(
      fontSize: calculateFontSize(context, ratio: 80),
      color: Theme.of(context).colorScheme.onPrimary,
      decoration: TextDecoration.none,
    );
}


TextStyle textStyleTextAccueil(BuildContext context) {

  return  GoogleFonts.montserrat().copyWith(
    fontSize:calculateFontSize(context, ratio: 100),
    color: Theme.of(context).colorScheme.onSurface,
    decoration: TextDecoration.none,
  );
}

TextStyle textStyleTextAppBar(BuildContext context) {

  return
    GoogleFonts.montserrat().copyWith(
      fontSize:calculateFontSize(context, ratio: 80),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.primary,
      decoration: TextDecoration.none,
    );
}

TextStyle? textStyleInput(BuildContext context, String inputText) {
  int baseFontSize = 15;
  double textFontSize =
  inputText.length > 20 ? baseFontSize - 1.2 : baseFontSize.toDouble();

  return  GoogleFonts.montserrat().copyWith(
    fontSize: textFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onSurface,
    decoration: TextDecoration.none,
  );
}