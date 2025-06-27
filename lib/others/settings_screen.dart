import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'English';
  bool _locationServicesEnabled = true;
  bool _analyticsEnabled = true;

  final List<String> _languages = [
    'English',
    'Bangla',
    'Hindi',
    'Arabic',
    'Spanish',
    'French'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Notification Settings
          _buildSettingsItem(
            context,
            icon: Icons.notifications,
            title: 'Notification Settings',
            onTap: () {
              _showNotificationSettings(context);
            },
          ),

          // Language Settings
          _buildSettingsItem(
            context,
            icon: Icons.language,
            title: 'Language',
            subtitle: _selectedLanguage,
            onTap: () {
              _showLanguageSelection(context);
            },
          ),

          // Privacy & Security
          _buildSettingsItem(
            context,
            icon: Icons.security,
            title: 'Privacy & Security',
            onTap: () {
              _showPrivacySettings(context);
            },
          ),

          // App Theme
          _buildSettingsItem(
            context,
            icon: Icons.color_lens,
            title: 'App Theme',
            subtitle: _darkModeEnabled ? 'Dark' : 'Light',
            onTap: () {
              setState(() {
                _darkModeEnabled = !_darkModeEnabled;
              });
            },
          ),

          // Location Services
          _buildSettingsItem(
            context,
            icon: Icons.location_on,
            title: 'Location Services',
            onTap: () {
              setState(() {
                _locationServicesEnabled = !_locationServicesEnabled;
              });
            },
            trailing: Switch(
              value: _locationServicesEnabled,
              onChanged: (value) {
                setState(() {
                  _locationServicesEnabled = value;
                });
              },
            ),
          ),

          // Help & Support
          _buildSettingsItem(
            context,
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {
              _showHelpSupport(context);
            },
          ),

          // About App
          _buildSettingsItem(
            context,
            icon: Icons.info,
            title: 'About App',
            onTap: () {
              _showAboutApp(context);
            },
          ),

          // Rate App
          _buildSettingsItem(
            context,
            icon: Icons.star,
            title: 'Rate App',
            onTap: () {
              // TODO: Add rate app logic
            },
          ),

          // Share App
          _buildSettingsItem(
            context,
            icon: Icons.share,
            title: 'Share App',
            onTap: () {
              // TODO: Add share app logic
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required IconData icon,
      required String title,
      String? subtitle,
      required VoidCallback onTap,
      Widget? trailing}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void _showNotificationSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notification Settings',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildNotificationOption(
                    'Enable Notifications',
                    _notificationsEnabled,
                    (value) => setState(() => _notificationsEnabled = value),
                  ),
                  _buildNotificationOption(
                    'Trip Reminders',
                    true,
                    (value) {},
                  ),
                  _buildNotificationOption(
                    'Special Offers',
                    true,
                    (value) {},
                  ),
                  _buildNotificationOption(
                    'App Updates',
                    true,
                    (value) {},
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Save Settings'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildNotificationOption(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  void _showLanguageSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Language',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ..._languages
                  .map((language) => ListTile(
                        title: Text(language),
                        trailing: _selectedLanguage == language
                            ? const Icon(Icons.check, color: Colors.blue)
                            : null,
                        onTap: () {
                          setState(() {
                            _selectedLanguage = language;
                          });
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            ],
          ),
        );
      },
    );
  }

  void _showPrivacySettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Privacy & Security'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Data Collection',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'We collect anonymous usage data to improve the app experience.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Enable Analytics'),
                  Switch(
                    value: _analyticsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _analyticsEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              const Divider(height: 32),
              const Text(
                'Account Privacy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildPrivacyOption(
                'Private Account',
                'Make your profile visible only to followers',
                false,
                (value) {},
              ),
              _buildPrivacyOption(
                'Activity Status',
                'Show when you were last active',
                true,
                (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacyOption(
      String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Switch(
                value: value,
                onChanged: onChanged,
              ),
            ],
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  void _showHelpSupport(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Help & Support'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildHelpOption(
                Icons.help_outline,
                'FAQs',
                'Find answers to common questions',
                () {},
              ),
              _buildHelpOption(
                Icons.email,
                'Contact Us',
                'Send us an email with your questions',
                () {},
              ),
              _buildHelpOption(
                Icons.chat,
                'Live Chat',
                'Chat with our support team in real-time',
                () {},
              ),
              _buildHelpOption(
                Icons.report_problem,
                'Report a Problem',
                'Let us know about any issues you encountered',
                () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpOption(
      IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  void _showAboutApp(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'TrekMate',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2023 TrekMate Inc.\nAll rights reserved.',
      children: [
        const SizedBox(height: 16),
        const Text(
          'Discover amazing travel destinations and plan your perfect trip with TrekMate.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.privacy_tip),
              onPressed: () {
                Navigator.pop(context);
                _showPrivacySettings(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.help),
              onPressed: () {
                Navigator.pop(context);
                _showHelpSupport(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: () {
                
              },
            ),
          ],
        ),
      ],
    );
  }
}
