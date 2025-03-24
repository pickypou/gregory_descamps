// CartePresentationEntreprise.dart
import 'package:flutter/material.dart';
import 'package:gregory_descamps/theme.dart';

class CartePresentationEntreprise extends StatelessWidget {
  final double? headerHeight;

  const CartePresentationEntreprise({super.key, this.headerHeight});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    if (size.width < 749) {
      return Container();
    } else {
      // Calcul de la hauteur de la carte en fonction de la hauteur du header
      double cardHeight =
          headerHeight != null ? headerHeight! * 0.5 : size.height * 0.4;

      return Container(
        width: size.width * 0.4,
        height: cardHeight, // Hauteur de la carte à 50% de la hauteur du header
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 45),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          border: const Border(left: BorderSide(color: Colors.white, width: 4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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
