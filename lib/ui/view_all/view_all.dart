import 'package:flutter/material.dart';
import 'package:gregory_descamps/ui/avis_clients/avis_client_page.dart';
import 'package:gregory_descamps/ui/home_page/home_page.dart';
import 'package:gregory_descamps/ui/protfolio/portfolio.dart';
import '../common/custom_appbar.dart';
import '../common/footer.dart';
import '../common/image_fond_ecran.dart';
import '../contact/contact_view.dart';

class ViewAll extends StatelessWidget {
  final GlobalKey accueil = GlobalKey();
  final GlobalKey realisation = GlobalKey();
  final GlobalKey avisClients = GlobalKey();
  final GlobalKey contact = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  ViewAll({super.key});

  void _scrollToSection(String sectionId) {
    GlobalKey? key;
    switch (sectionId) {
      case 'accueil':
        key = accueil;
        break;
      case 'realisation':
        key = realisation;
        break;
      case 'avisClients':
        key = avisClients;
        break;
      case 'contact':
        key = contact;
        break;
    }
    ;

    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        onNavigate: _scrollToSection,
        actions: [],
      ),
      drawer:
          size.width < 749
              ? CustomDrawer(
                accueil: accueil,
                realisation: realisation,
                avisClients: avisClients,
                contact: contact,
              )
              : null,
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageFondEcran.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HomePage(key: accueil),
                const SizedBox(height: 35),
                Image.asset("assets/images/divider.png"),
                Portfolio(key: realisation),
                const SizedBox(height: 35),
                Image.asset("assets/images/divider.png"),
                AvisClientsPage(key: avisClients),
                const SizedBox(height: 35),
                Image.asset("assets/images/divider.png"),
                ContactView(key: contact),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
