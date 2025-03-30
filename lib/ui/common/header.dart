// Header.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'carte_presentation_entreprise.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Pour les appareils mobiles
    if (size.width < 749) {
      return SizedBox(
        height: size.height * 0.75, // Hauteur augmentée à 75% de l'écran
        width: size.width,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/chantiers/img_5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Logo (Centré)
              Positioned(
                left: 0,
                right: 0,
                top: size.height * 0.1,
                child: Center(
                  child: SizedBox(
                    width: size.width * 0.8,
                    child: SvgPicture.asset(
                      'assets/images/logos/logo-transparent.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              image: AssetImage('assets/images/chantiers/img_5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Logo
              Positioned(
                right: size.width * 0.3,
                top:
                    headerHeight *
                    0.1, // Positionnement relatif à la hauteur du header
                child: SizedBox(
                  width: size.width * 0.4,
                  child: SvgPicture.asset(
                    'assets/images/logos/logo-transparent.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
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
