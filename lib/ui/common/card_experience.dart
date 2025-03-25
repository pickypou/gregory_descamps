import 'package:flutter/material.dart';
import 'package:gregory_descamps/theme.dart';

class CardExperience extends StatelessWidget {
  final IconData icon;
  final String text;

  const CardExperience({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      // Ajoute une largeur fixe pour éviter l'erreur
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ✅ Empêche l'expansion infinie
        children: [
          Icon(icon, size: 40, color: theme.colorScheme.onPrimary),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: textStyleText(context),
          ),
        ],
      ),
    );
  }
}
