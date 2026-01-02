// Header.dart
import 'package:flutter/material.dart';

import 'carte_presentation_entreprise.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Pour les appareils mobiles
    if (size.width < 749) {
      return SizedBox(
        height: size.height * 0.5, // Hauteur ajustée pour mobile
        width: size.width,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/header.png'),
              fit: BoxFit.contain, // Affiche l'image complète sans la couper
              alignment: Alignment.center,
            ),
          ),
          // Pas de contenu supplémentaire pour mobile
        ),
      );
    } else {
      // Pour les appareils desktop
      double headerHeight =
          size.height * 0.8; // Hauteur du header à 80% de l'écran

      return SizedBox(
        height: headerHeight,
        width: size.width,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/header.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Carte de présentation de l'entreprise
              Positioned(
                right: 0,
                bottom: 0, // Aligné au bas du header
                child: CartePresentationEntreprise(headerHeight: headerHeight),
              ),
            ],
          ),
        ),
      );
    }
  }
}
