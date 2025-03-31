import 'package:flutter/material.dart';

import '../../theme.dart';
import 'clickable_image.dart';

class Footer extends StatelessWidget {
  final double? fontSize;
  const Footer({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    // Obtenir la largeur de l'écran pour la responsivité
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      constraints: BoxConstraints(
        // Hauteur adaptative selon la taille d'écran
        maxHeight: isSmallScreen ? 150 : 80,
        minHeight: 56.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: theme.colorScheme.primary, thickness: 1),
          Expanded(
            child: Padding(
              // Padding adaptatif
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 16 : 45,
                vertical: 10,
              ),
              // Choisir la disposition en fonction de la taille d'écran
              child:
                  isSmallScreen
                      ? _buildSmallScreenLayout(context)
                      : _buildLargeScreenLayout(context),
            ),
          ),
        ],
      ),
    );
  }

  // Disposition pour petits écrans
  Widget _buildSmallScreenLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // L'image est déjà dimensionnée dans le composant ClickableImage
        ClickableImage(
          imagePath: 'assets/images/logos/logo-transparent.png',
          route: "/admin",
        ),
        const SizedBox(height: 8),
        Text(
          "© 2025 Grégory DESCAMPS tous droits réservés",
          style: textStyleTextAccueil(context),
          textAlign: TextAlign.center,
        ),
        /*const SizedBox(height: 4),
        Text(
          "N° de Siret : 75073281000015",
          style: textStyleTextAccueil(context),
          textAlign: TextAlign.center,
        ),*/
      ],
    );
  }

  // Disposition pour écrans moyens et grands
  Widget _buildLargeScreenLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClickableImage(
          imagePath: 'assets/images/logos/logo.png',
          route: "/admin",
        ),
        Flexible(
          flex: 2,
          child: Text(
            "© 2025 Grégory DESCAMPS tous droits réservés",
            style: textStyleTextAccueil(context),
            overflow: TextOverflow.ellipsis,
          ),
        ),
/*Flexible(
          flex: 1,
          child: Text(
            "N° de Siret : 75073281000015",
            style: textStyleTextAccueil(context),
            overflow: TextOverflow.ellipsis,
          ),
        ),*/
      ],
    );
  }
}
