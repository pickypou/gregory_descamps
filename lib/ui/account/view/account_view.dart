import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/access_checker.dart';
import '../../../theme.dart';
import '../../common/custom_buttom.dart';

class AccountView extends StatefulWidget {
  final Map<String, dynamic> userData;

  const AccountView({super.key, required this.userData});

  @override
  AccountViewState createState() => AccountViewState();
}

class AccountViewState extends State<AccountView> {
  bool isAdmin = false; // Par défaut, l'utilisateur n'est pas administrateur
  bool isLoading = true; // Indique si la vérification est en cours

  @override
  void initState() {
    super.initState();
    _checkAdminAccess();
  }

  Future<void> _checkAdminAccess() async {
    final hasAdminAccess = await hasAccess(); // Appelle la fonction asynchrone
    setState(() {
      isAdmin = hasAdminAccess;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (isLoading) {
      // Affiche un indicateur de chargement pendant la vérification
      return Scaffold(
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ), // Ajout de marges latérales
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .stretch, // Étire les enfants sur toute la largeur
            children: [
              const SizedBox(height: 35),
              Text(
                "Bonjour ${widget.userData['userName']}",
                style: titleStyleMedium(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),

              const SizedBox(height: 90),
              if (isAdmin) ...[
                CustomButton(
                  label: 'Je supprime un avis_clients',
                  onPressed: () {
                    GoRouter.of(context).go('/remove_avis_clients');
                  },
                ),
                const SizedBox(height: 50),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
