import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main/profile.dart';
import 'main/profile/providers/theme_provider.dart';
import 'main/profile/providers/language_provider.dart';
import 'main/profile/edit_username_dialog.dart';
import 'main/profile/theme_dialog.dart';
import 'main/profile/language_dialog.dart';
import 'main/profile/confirm_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _incognitoMode = false;
  bool _notificationsEnabled = true;
  final TextEditingController _usernameController = TextEditingController(text: "your_username");

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _showEditUsernameDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return EditUsernameDialog(controller: _usernameController);
      },
    );
  }

  void _showThemeDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeDialog();
      },
    );
  }

  void _showLanguageDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Settings")),
      body: ListView(
        children: [
          const ListTile(title: Text("Account", style: TextStyle(fontWeight: FontWeight.bold))),
          ListTile(
            title: const Text("Username"),
            subtitle: Text(_usernameController.text),
            onTap: _showEditUsernameDialog,
          ),
          const ListTile(title: Text("Email"), subtitle: Text("user@example.com")),
          SwitchListTile(
            title: const Text("Incognito Mode"),
            value: _incognitoMode,
            onChanged: (val) => setState(() => _incognitoMode = val),
          ),
          SwitchListTile(
            title: const Text("Notification"),
            value: _notificationsEnabled,
            onChanged: (val) => setState(() => _notificationsEnabled = val),
          ),
          ListTile(
            title: const Text("Log Out"),
            onTap: () => _showConfirmDialog("Log Out", "Are you sure?", () {}),
          ),
          const ListTile(title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold))),
          ListTile(
            title: const Text("Language"),
            subtitle: Text(Provider.of<LanguageProvider>(context).language),
            onTap: _showLanguageDialog,
          ),
          ListTile(
            title: const Text("Theme"),
            subtitle: Text(Provider.of<ThemeProvider>(context).theme),
            onTap: _showThemeDialog,
          ),
        ],
      ),
    );
  }
}

