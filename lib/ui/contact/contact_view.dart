import 'package:flutter/material.dart';
import '../../theme.dart';
import '../common/custom_appbar.dart';
import '../common/footer.dart';
import 'form_contact.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    if (size.width < 749) {
      // Affichage pour petits écrans
      return Scaffold(
        appBar: const CustomAppBar(title: ''),
        drawer: size.width <= 745 ? CustomDrawer() : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Text("Nous contacter", style: titleStyleMedium(context)),

                Image.asset('assets/images/logo.png'),

                SizedBox(width: size.width, child: FormContact()),


                const SizedBox(height: 10),
                Text(
                  'mettre ton adresse',
                  style: textStyleText(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  '',
                  style: textStyleText(context),
                  textAlign: TextAlign.center,
                ),


                const SizedBox(height: 55),
                Footer(),
              ],
            ),
          ),
        ),
      );
    } else {
      // Affichage pour grands écrans
      return Scaffold(
        appBar: const CustomAppBar(title: ''),
        drawer: size.width <= 745 ? CustomDrawer() : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child:  Text("Nous contacter", style: titleStyleMedium(context)),
                ),

                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section gauche : Images
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Image.asset('assets/images/logo.png'),
                          const SizedBox(height: 10),
                          Text(
                            'Mettre ton adresse ',
                            style: textStyleText(context),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '',
                            style: textStyleText(context),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 50),
                    // Section droite : Formulaire
                    Expanded(
                      flex: 2,

                      child:
                      FormContact(),
                    ),
                  ],
                ),

                const SizedBox(height: 70),
                Footer(),
              ],
            ),
          ),
        ),
      );
    }
  }
}