import 'package:flutter/material.dart';
import '../../theme.dart';

class Footer extends StatelessWidget {
  final double? fontSize;
  const Footer({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // ✅ On fixe une hauteur pour éviter qu'il prenne trop de place
      padding: const EdgeInsets.symmetric(vertical: 10.0), // ✅ Ajustement du padding
      child: Column(
        mainAxisSize: MainAxisSize.min, // ✅ Évite l'expansion inutile
        children: [
          Divider(
            color: theme.colorScheme.primary,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "© 2025 Grégory DESCAMPS",
                  style: textStyleText(context),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "N° de siret 59s2",
                  style: textStyleTextAccueil(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

