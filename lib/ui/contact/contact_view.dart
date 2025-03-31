import 'package:flutter/material.dart';

import '../../theme.dart';
import 'form_contact.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    if (size.width < 749) {
      // Affichage pour petits écrans
      return Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            Text("Nous contacter", style: titleStyleMedium(context)),

            Image.asset('assets/images/logos/logo-transparent.png'),

            SizedBox(width: size.width, child: FormContact()),

            const SizedBox(height: 10),
            Text('465 route de puy Clavel', style: textStyleText(context)),

            const SizedBox(height: 10),
            Text('46160 Grealou', style: textStyleText(context)),

            const SizedBox(height: 55),
          ],
        ),
      );
    } else {
      // Affichage pour grands écrans
      return Padding(
        padding: const EdgeInsets.all(25),

        // bottomNavigationBar: Footer(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 65),
            Align(
              alignment: Alignment.center,
              child: Text("Nous contacter", style: titleStyleMedium(context)),
            ),

            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section gauche : Images
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logos/logo-transparent.png',
                      ),
                      const SizedBox(height: 35),
                      Text(
                        '465 route de puy Clavel',
                        style: textStyleText(context),
                      ),

                      const SizedBox(height: 10),
                      Text('46160 Grealou', style: textStyleText(context)),
                      const SizedBox(height: 35),
                      Image.asset(
                        "assets/images/vue_maps.png",
                        fit: BoxFit.contain,
                        width: size.width * 0.2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 50),
                // Section droite : Formulaire
                Expanded(flex: 2, child: FormContact()),
              ],
            ),

            const SizedBox(height: 100),

            //Footer(),
          ],
        ),
      );
    }
  }
}
