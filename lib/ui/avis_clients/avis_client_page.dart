import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gregory_descamps/theme.dart';
import 'package:gregory_descamps/ui/avis_clients/view/avis_client_view.dart';

import '../../domaine/entity/avis_clients.dart';
import '../common/custom_buttom.dart';
import '../common/image_fond_ecran.dart';

class AvisClientsPage extends StatelessWidget {
  const AvisClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance
                  .collection('avis_clients')
                  .orderBy('publishDate', descending: true)
                  .limit(15)
                  .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Erreur : ${snapshot.error}'));
            }

            List<AvisClients> avis =
                snapshot.hasData
                    ? snapshot.data!.docs
                        .map(
                          (doc) => AvisClients.fromMap(
                            doc.data() as Map<String, dynamic>,
                            doc.id,
                          ),
                        )
                        .toList()
                    : [];

            return
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 65,),

                    Text(
                      'Les clients nous donnent leurs avis',
                      style: titleStyleMedium(context),
                    ),
                    avis.isNotEmpty
                        ? AvisClientsView(avis: avis)
                        : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Aucun avis disponible',
                            style: textStyleText(context),
                          ),
                        ),
                    const SizedBox(height: 35),
                    CustomButton(
                      label: 'Je donne mon avis',
                      onPressed:
                          () => GoRouter.of(context).go('/addAvisClients'),
                    ),
                    const SizedBox(height: 55),
                  ],


            );
          },
        ),
      ],
    );
  }
}
