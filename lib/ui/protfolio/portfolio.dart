import 'package:flutter/material.dart';
import 'package:gregory_descamps/theme.dart';
import 'package:gregory_descamps/ui/protfolio/show_image_carousel.dart';

class Portfolio extends StatelessWidget {
  // Liste de toutes les images pour le carousel
  final List<String> allImages = [
    "assets/images/chantiers/img_1.png",
    "assets/images/chantiers/img_2.png",
    "assets/images/chantiers/img_3.png",
    "assets/images/chantiers/img_4.png",
    "assets/images/chantiers/img_5.png",
    "assets/images/chantiers/img_6.png",
    "assets/images/chantiers/img_7.png",
    "assets/images/chantiers/img_8.png",
    "assets/images/chantiers/img_9.png",
    "assets/images/chantiers/img_10.png",
    "assets/images/chantiers/img_11.png",
    "assets/images/chantiers/img_12.png",
    "assets/images/chantiers/img_13.png",
  ];

  // Liste des images pour l'aperçu des cartes (6 cartes)
  final List<List<String>> imageLists = [
    [
      "assets/images/chantiers/img_1.png",
      "assets/images/chantiers/img_2.png",
      "assets/images/chantiers/img_3.png",
    ],
    [
      "assets/images/chantiers/img_4.png",
      "assets/images/chantiers/img_5.png",
      "assets/images/chantiers/img_6.png",
    ],
    [
      "assets/images/chantiers/img_7.png",
      "assets/images/chantiers/img_8.png",
      "assets/images/chantiers/img_9.png",
    ],
    [
      "assets/images/chantiers/img_10.png",
      "assets/images/chantiers/img_11.png",
      "assets/images/chantiers/img_12.png",
    ],
    [
      "assets/images/chantiers/img_13.png",
      "assets/images/chantiers/img_1.png",
      "assets/images/chantiers/img_2.png",
    ],
    [
      "assets/images/chantiers/img_3.png",
      "assets/images/chantiers/img_4.png",
      "assets/images/chantiers/img_5.png",
    ],
  ];

  Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 65),
                  Text(
                    'Mes Réalisations',
                    style: titleStyleMedium(context),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 35),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children:
                        imageLists
                            .map(
                              (imageList) =>
                                  _buildImageItem(context, imageList),
                            )
                            .toList(),
                  ),
                  const SizedBox(height: 65),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageItem(BuildContext context, List<String> images) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double calculatedWidth =
            constraints.maxWidth > 900
                ? (constraints.maxWidth - 40) /
                    3 // 3 images côte à côte sur grand écran
                : constraints.maxWidth > 600
                ? (constraints.maxWidth - 20) /
                    2 // 2 images sur écran moyen
                : constraints.maxWidth; // 1 image sur petit écran

        // Limite la largeur maximale à 300px pour des images plus compactes
        double width = calculatedWidth > 300 ? 300 : calculatedWidth;

        // Trouve l'index de la première image de cette carte dans la liste complète
        int startIndex = allImages.indexOf(images[0]);

        return GestureDetector(
          onTap:
              () => showImageCarousel(
                context,
                allImages,
                startIndex >= 0 ? startIndex : 0,
              ),
          child: Hero(
            tag: "carousel_${imageLists.indexOf(images)}",
            child: Container(
              width: width,
              height: width * 9 / 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(images[0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
