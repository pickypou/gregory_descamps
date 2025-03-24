import 'package:flutter/material.dart';
import 'package:gregory_descamps/theme.dart';

class PresentationEntreprise extends StatelessWidget {
  const PresentationEntreprise({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      color: theme.colorScheme.onSurface,
      child: Padding(
        padding: EdgeInsets.all(25),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Présentation de l'entreprise ",
              style: titleStyleSmall(context),
            ),
            const SizedBox(height: 15),
            Text(
              "Fort de quinze années d'expérience en tant qu'auto-entrepreneur dans le domaine de la rénovation de bâtiments, je mets mon expertise à votre service pour tous vos projets de transformation. Que vous souhaitiez rénover une pièce existante ou créer une nouvelle extension, je suis à votre écoute pour réaliser vos travaux dans les meilleures conditions.             Spécialisé également dans l'isolation de votre domicile, je vous propose des solutions adaptées pour améliorer le confort thermique et acoustique de votre intérieur. En plus des travaux de rénovation générale, j'interviens pour la pose de parquet flottant, de sol PVC ainsi que pour tous vos projets de peinture, en apportant soin et précision pour un rendu esthétique et durable.             Mon engagement est de vous fournir des prestations de qualité, respectueuses des délais et de votre budget, en utilisant des matériaux durables et performants. N'hésitez pas à me contacter pour toute demande de devis ou conseil personnalisé.",
              style: textStyleText(
                context,
              ).copyWith(color: theme.colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
