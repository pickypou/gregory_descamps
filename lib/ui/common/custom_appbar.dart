import 'package:flutter/material.dart';
import '../../../theme.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final void Function(String)? onNavigate;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onNavigate,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  Widget? _getLeading(BuildContext context) {
    if (MediaQuery.of(context).size.width > 750) {
      return null; // No menu button on large screens
    } else {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.menu, color: theme.colorScheme.onPrimary),
      );
    }
  }

  void _scrollToSection(BuildContext context, String sectionId) {
    if (onNavigate != null) {
      onNavigate!(sectionId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: theme.colorScheme.onSurface,
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      leading: _getLeading(context),
      actions: [
        if (MediaQuery.of(context).size.width > 750) // For large screens
          ...[
            _buildNavItem(context, 'Accueil', 'accueil'),
            _buildNavItem(context, 'Mes réalisation', 'realisation'),
            _buildNavItem(context, 'Avis clients', 'avisClients'),
            _buildNavItem(context, 'Contact', 'contact'),
          ],
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String label, String sectionId) {
    return GestureDetector(
      onTap: () => _scrollToSection(context, sectionId),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 16.0, color: theme.colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
class CustomDrawer extends StatelessWidget {
  final GlobalKey accueil;
  final GlobalKey realisation;
  final GlobalKey avisClients;
  final GlobalKey contact;

  const CustomDrawer({
    super.key,
    required this.accueil,
    required this.realisation,
    required this.avisClients,
    required this.contact,
  });

  void _scrollToSection(GlobalKey sectionKey) {
    if (sectionKey.currentContext != null) {
      Scrollable.ensureVisible(
        sectionKey.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: theme.colorScheme.onSurface,
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          ListTile(
            title: Text('Accueil', style: TextStyle(color: theme.colorScheme.onPrimary)),
            onTap: () {
              _scrollToSection(accueil);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Mes réalisation', style: TextStyle(color: theme.colorScheme.onPrimary)),
            onTap: () {
              _scrollToSection(realisation);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Avis clients', style: TextStyle(color: theme.colorScheme.onPrimary)),
            onTap: () {
              _scrollToSection(avisClients);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text('Contact', style: TextStyle(color: theme.colorScheme.onPrimary)),
            onTap: () {
              _scrollToSection(contact);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
