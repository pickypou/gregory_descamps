import 'package:flutter/material.dart';
import 'package:gregory_descamps/theme.dart';

class CartePresentationEntreprise extends StatelessWidget {
  const CartePresentationEntreprise({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context); // Obtenir la taille complète de l'écran

    if (size.width < 749) {

      return Container();

    } else {
      // Pour les écrans plus larges, on garde la bordure à gauche et une largeur spécifique
      return Container(
        width: size.width * 0.4, // Largeur réduite pour les grands écrans
        height: size.height / 2,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 45),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5), // 🎨 Opacité du fond
          border: const Border(
            left: BorderSide(color: Colors.white, width: 4), // 🚀 Bordure à gauche
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche
          children: [
            Text(
              "Grégory DESCAMPS",
              style: titleStyleMedium(context).copyWith(color: Colors.white),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              'Auto-entrepreneur spécialisé dans la rénovation et la création de votre intérieur',
              style: textStyleText(context).copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Je vous accompagne étape par étape dans la réalisation de tous vos projets de rénovation ou de création',
              style: textStyleText(context).copyWith(color: Colors.white),
            ),
          ],
        ),
      );
    }
  }
}
