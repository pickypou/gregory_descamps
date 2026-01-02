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
      title: Text(title, textAlign: TextAlign.center),
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
            style: TextStyle(
              fontSize: 16.0,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final void Function(String)? onNavigate;

  const CustomDrawer({super.key, this.onNavigate});

  void _scrollToSection(BuildContext context, String sectionId) {
    if (onNavigate != null) {
      onNavigate!(sectionId);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: theme.colorScheme.onSurface,
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: theme.colorScheme.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu, color: theme.colorScheme.onPrimary, size: 40),
                const SizedBox(height: 10),
                Text(
                  'Menu',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: theme.colorScheme.onPrimary),
            title: Text(
              'Accueil',
              style: TextStyle(color: theme.colorScheme.onPrimary),
            ),
            onTap: () => _scrollToSection(context, 'accueil'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.work, color: theme.colorScheme.onPrimary),
            title: Text(
              'Mes réalisations',
              style: TextStyle(color: theme.colorScheme.onPrimary),
            ),
            onTap: () => _scrollToSection(context, 'realisation'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.star, color: theme.colorScheme.onPrimary),
            title: Text(
              'Avis clients',
              style: TextStyle(color: theme.colorScheme.onPrimary),
            ),
            onTap: () => _scrollToSection(context, 'avisClients'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(
              Icons.contact_mail,
              color: theme.colorScheme.onPrimary,
            ),
            title: Text(
              'Contact',
              style: TextStyle(color: theme.colorScheme.onPrimary),
            ),
            onTap: () => _scrollToSection(context, 'contact'),
          ),
        ],
      ),
    );
  }
}
