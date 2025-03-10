import 'package:flutter/material.dart';

import '../../theme.dart';
import '../common/custom_appbar.dart';
import '../common/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    if (size.width < 749) {
      return Scaffold(
        appBar: const CustomAppBar(title: ''),
        drawer:
            MediaQuery.of(context).size.width <= 750
                ? const CustomDrawer()
                : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Grégory DESCAMPS',
                    style: titleStyleMedium(context),
                  ),
                ),

                const SizedBox(height: 35),

                const SizedBox(height: 5),

                Text(
                  "Spécialiste de pose de placo-platre",
                  style: titleStyleSmall(context),
                ),

                const SizedBox(height: 35),
                Padding(
                  padding: EdgeInsets.all(35),
                  child: Text(
                    "Fort de dix années d'expérience en tant qu'auto-entrepreneur dans le domaine de la rénovation de bâtiments, je mets mon expertise à votre service pour tous vos projets de transformation. Que vous souhaitiez rénover une pièce existante ou créer une nouvelle extension, je suis à votre écoute pour réaliser vos travaux dans les meilleures conditions. Spécialisé également dans l'isolation de votre domicile, je vous propose des solutions adaptées pour améliorer le confort thermique et acoustique de votre intérieur. Mon engagement est de vous fournir des prestations de qualité, respectueuses des délais et de votre budget, en utilisant des matériaux durables et performants. N'hésitez pas à me contacter pour toute demande de devis ou conseil personnalisé. ",
                    style: textStyleText(context),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Footer(),
      );
    } else {
      return Scaffold(
        appBar: const CustomAppBar(title: ''),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Grégory DESCAMPS',
                    style: titleStyleMedium(context),
                  ),
                ),
                const SizedBox(height: 35),

                Text(
                  "Spécialiste en pose de placo-platre",
                  style: titleStyleSmall(context),
                ),
                const SizedBox(height: 45),
                Padding(
                    padding: EdgeInsets.all(45),
                  child:
                  Text("Fort de dix années d'expérience en tant qu'auto-entrepreneur dans le domaine de la rénovation de bâtiments, je mets mon savoir-faire et mon expertise à votre service pour concrétiser tous vos projets de transformation. Que ce soit pour rénover une pièce, créer une extension ou optimiser 'aménagement de votre espace, je vous accompagne à chaque étape, en vous proposant des solutions adaptées à vos besoins et à votre budget. Spécialisé également dans l'isolation thermique et acoustique, j'interviens pour améliorer le confort de votre habitation tout en réduisant votre consommation énergétique. Grâce à l'utilisation de matériaux performants et durables, chaque projet est réalisé avec soin et souci du détail. Mon objectif est de vous offrir un travail de qualité, respectueux des délais et conforme à vos attentes. N'hésitez pas à me contacter pour discuter de votre projet, obtenir des conseils ou demander un devis personnalisé. Ensemble, donnons vie à vos idées et transformons votre intérieur selon vos envies !",
                    style: textStyleText(context),
                  ),
                )

              ],
            ),
          ),
        ),
        bottomNavigationBar: Footer(),
      );
    }
  }
}
