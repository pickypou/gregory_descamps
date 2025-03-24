import 'package:flutter/material.dart';
import 'package:gregory_descamps/core/utils/size_extensions.dart';

import '../../theme.dart';
import 'carte_presentation_entreprise.dart'; // Assurez-vous d'importer le fichier

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  if(size.width < 749) {
    return Container(
      height: size.height, // Prend toute la hauteur
      width: size.width, // Prend toute la largeur
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/chantiers/img_5.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // 📌 LOGO (Centré)
          Positioned(
            //right: size.width / 2, // Décalage depuis le bord droit
            top: size.height * 0.1, // Ajuste la hauteur selon ton besoin
            child: SizedBox(
              width: size.width * 0.9, // Ajuste la taille du logo
              child: Image.asset(
                'assets/images/logos/logo-transparent.png',
                fit: BoxFit.contain,width: size.width,
              ),
            ),
          ),
          // 📌 CARTE PRÉSENTATION ENTREPRISE (À DROITE)
         /* Positioned(
            right: size.width * 0.5, // Décalage depuis le bord droit
            top: size.height * 0.5, // Ajuste la hauteur selon ton besoin
            child: const CartePresentationEntreprise(),
          ),*/


        ],
      ),
    );
  }else {
    return Container(
      height: size.height, // Prend toute la hauteur
      width: size.width, // Prend toute la largeur
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/chantiers/img_5.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // 📌 LOGO (Centré)
      Positioned(
      right: size.width * 0.3, // Décalage depuis le bord droit
        top: size.height * 0.1, // Ajuste la hauteur selon ton besoin
            child: SizedBox(
              width: size.width * 0.4, // Ajuste la taille du logo
              child: Image.asset(
                'assets/images/logos/logo-transparent.png',
                fit: BoxFit.contain,
              ),
            ),
      ),

          // 📌 CARTE PRÉSENTATION ENTREPRISE (À DROITE)
          Positioned(
            right: size.width * 0.00, // Décalage depuis le bord droit
            top: size.height * 0.4, // Ajuste la hauteur selon ton besoin
            child: const CartePresentationEntreprise(),
          ),
        ],
      ),
    );
  }
  }
}
