import 'package:flutter/material.dart';
import 'package:gregory_descamps/ui/common/card_experience.dart';
import 'package:gregory_descamps/ui/common/header.dart';
import 'package:gregory_descamps/ui/common/presentation_entreprise.dart';
import 'package:gregory_descamps/ui/common/prestations.dart';

import '../common/custom_appbar.dart';
import '../common/footer.dart';
import '../common/image_fond_ecran.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'N° de Siret : 75073281000015'),
      drawer: size.width <= 750 ? const CustomDrawer() : null,
      body:Stack(
        children: [
          Positioned.fill(
            // Assure que l'image prend tout l'écran
            child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageFondEcran.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

      Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(),
                  const SizedBox(height: 25),

                  /// ✅ Ajout du `Wrap` pour organiser les cartes horizontalement
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      alignment: WrapAlignment.center, // Centrer les éléments
                      spacing: 35, // Espace horizontal entre les cartes
                      runSpacing: 20, // Espace vertical entre les lignes
                      children: const [
                        CardExperience(
                          icon: Icons.euro,
                          text: 'Tarifs compétitifs',
                        ),
                        CardExperience(
                          icon: Icons.workspace_premium,
                          text: 'Prestations de qualité',
                        ),
                        CardExperience(
                          icon: Icons.emoji_events,
                          text: " quinze ans d'experience",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  Prestations(),
                  const SizedBox(height: 35),
                  PresentationEntreprise(),
                ],
              ),
            ),
          ),
          Footer(), // ✅ Footer fixe en bas
        ],
      ),
        ],
      ),
    );
  }
}
