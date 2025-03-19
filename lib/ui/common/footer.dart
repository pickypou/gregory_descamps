import 'package:flutter/material.dart';

import '../../theme.dart';
import 'clickable_image.dart';

class Footer extends StatelessWidget {
  final double? fontSize;
  const Footer({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 56.0), // Hauteur maximale fixée
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: theme.colorScheme.primary, thickness: 1),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClickableImage(
                    imagePath: 'assets/images/logos/logo.png',
                    route: "/admin",
                  ),

                  Flexible(
                    child: Text(
                      "© 2025 Grégory DESCAMPS tous droits réservés",
                      style: textStyleText(context),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "N° de Siret : 75073281000015",
                      style: textStyleTextAccueil(context),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
