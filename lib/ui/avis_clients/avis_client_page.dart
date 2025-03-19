import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gregory_descamps/theme.dart';
import 'package:gregory_descamps/ui/avis_clients/view/avis_client_view.dart';
import 'package:gregory_descamps/ui/common/footer.dart';

import '../../domaine/entity/avis_clients.dart';
import '../common/custom_appbar.dart';
import '../common/custom_buttom.dart';

class AvisClientsPage extends StatelessWidget {
  const AvisClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          debugPrint('⚠ Aucun avis trouvé');
          return const Center(child: Text('Aucun avis disponible'));
        }

        // Transformation des données
        List<AvisClients> avis =
            snapshot.data!.docs
                .map(
                  (doc) => AvisClients.fromMap(
                    doc.data() as Map<String, dynamic>,
                    doc.id,
                  ),
                )
                .toList();

        return Scaffold(
          appBar: const CustomAppBar(title: ''),
          drawer:
              MediaQuery.of(context).size.width <= 750
                  ? const CustomDrawer()
                  : null,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Les clients nous donnent leurs avis',
                style: titleStyleMedium(context),
              ),
              AvisClientsView(avis: avis),
              const SizedBox(height: 35),
              CustomButton(
                label: 'Je donne mon avis',
                onPressed: () => GoRouter.of(context).go('/addAvisClients'),
              ),
              const SizedBox(height: 55),
              Footer(),
            ],
          ),
        );
      },
    );
  }
}
