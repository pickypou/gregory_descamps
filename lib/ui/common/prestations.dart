import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gregory_descamps/theme.dart';

class Prestations extends StatefulWidget {
  const Prestations({super.key});

  @override
  State<Prestations> createState() => _PrestationsState();
}

class _PrestationsState extends State<Prestations> {
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Map<String, String>> prestations = [
    {
      'image': 'assets/images/chantiers/img_1.png',
      'title': 'Travaux de plâtrerie',
      'text':
          'Nous nous occupons de la pose de cloisons, de faux plafonds et d’enduits pour vos projets de construction neuve ou de rénovation. Nos travaux de plâtrerie assurent une finition parfaite et un confort thermique et acoustique optimal.',
    },
    {
      'image': 'assets/images/chantiers/img_8.png',
      'title': 'Revêtement de sol',
      'text':
          'Nous réalisons la pose de vos revêtements de sol, qu’il s’agisse de stratifié ou de PVC, en garantissant une découpe soignée et une finition impeccable. Nous nous assurons que chaque installation respecte vos attentes en termes de qualité, de durabilité et d’esthétique, pour un résultat à la hauteur de vos exigences.',
    },
    {
      'image': 'assets/images/chantiers/img_13.png',
      'title': 'Travaux de peinture',
      'text':
          'Nous réalisons tous types de travaux de peinture, qu’il s’agisse de la rénovation de vos murs intérieurs ou de l’embellissement de vos façades extérieures. Grâce à des techniques modernes et des peintures de haute qualité, nous vous garantissons un rendu impeccable, durable et respectueux de vos goûts et de l’environnement.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 800;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              isWideScreen
                  ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Des prestations de qualité, respectant vos délais et votre budget',
                                style: titleStyleSmall(context),
                              ),
                              const SizedBox(
                                height: 10,
                              ), // Espacement entre les textes
                              Text(
                                'Nous nous engageons à vous fournir un service rapide, efficace et à un prix compétitif.',
                                style: textStyleText(context),
                              ),
                              const SizedBox(
                                height: 10,
                              ), // Espacement entre les textes
                              Text(
                                'Chaque projet est traité avec soin pour garantir votre satisfaction complète.',
                                style: textStyleText(context),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(flex: 4, child: _buildCarousel()),
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Des prestations de qualité, respectant vos délais et votre budget',
                          style: titleStyleSmall(context),
                        ),
                      ),
                      const SizedBox(height: 10), // Espacement entre les textes
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Nous nous engageons à vous fournir un service rapide, efficace et à un prix compétitif.',
                          style: textStyleText(context),
                        ),
                      ),
                      const SizedBox(height: 10), // Espacement entre les textes
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Chaque projet est traité avec soin pour garantir votre satisfaction complète.',
                          style: textStyleText(context),
                        ),
                      ),

                      _buildCarousel(),
                    ],
                  ),
        );
      },
    );
  }

  Widget _buildCarousel() {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: _controller, // ✅ Correction ici
          options: CarouselOptions(
            height: 500,
            autoPlay: false,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
          ),
          items:
              prestations.map((prestation) {
                return Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          prestation['image']!,
                          fit: BoxFit.contain,
                          width: size.width * 0.3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(prestation['title']!, style: titleStyleSmall(context)),
                    const SizedBox(height: 5),
                    Text(prestation['text']!, style: textStyleText(context)),
                  ],
                );
              }).toList(),
        ),

        // Bouton précédent
        Positioned(
          left: 10,
          child: GestureDetector(
            onTap: () {
              _controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                // shape: BoxShape.circle,
                // color: Colors.black54,
              ),
              child: Icon(
                Icons.chevron_left,
                size: 40,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ),

        // Bouton suivant
        Positioned(
          right: 10,
          child: GestureDetector(
            onTap: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                // shape: BoxShape.circle,
                // color: Colors.black54,
              ),
              child: Icon(
                Icons.chevron_right,
                size: 40,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
