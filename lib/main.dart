import 'package:flutter/material.dart';

void main() {
  runApp(const TelegramDrawerApp());
}

class TelegramDrawerApp extends StatefulWidget {
  const TelegramDrawerApp({super.key});

  @override
  State<TelegramDrawerApp> createState() => _TelegramDrawerAppState();
}

class _TelegramDrawerAppState extends State<TelegramDrawerApp> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram Drawer',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(
        isDarkMode: isDarkMode,
        onToggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Telegram"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: TelegramDrawer(
        isDarkMode: isDarkMode,
        onToggleTheme: onToggleTheme,
      ),
      body: const Center(
        child: Text("Main Content Area"),
      ),
    );
  }
}

class TelegramDrawer extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const TelegramDrawer({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: isDarkMode ? const Color(0xFF2A2F32) : Colors.grey[200],
            padding: const EdgeInsets.only(
                top: 40, left: 16, right: 16, bottom: 16),
            child: Stack(
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'images/sky.jpg',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Mahlet Anteneh",
                      style: TextStyle(
                        fontSize: 18,
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "+251 9111777",
                      style: TextStyle(
                        color:
                        isDarkMode ? Colors.white70 : Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    icon: Icon(
                      isDarkMode ? Icons.dark_mode : Icons.light_mode,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    onPressed: onToggleTheme,
                  ),
                ),
              ],
            ),
          ),

          // Add Account with top and bottom divider
          const Divider(),
          _buildDrawerItem(Icons.add, "Add Account"),
          const Divider(),

          // My Profile
          _buildDrawerItem(Icons.person, "My Profile"),

          // Other menu items
          _buildDrawerItem(Icons.group, "New Group"),
          _buildDrawerItem(Icons.person, "Contacts"),
          _buildDrawerItem(Icons.call, "Calls"),
          _buildDrawerItem(Icons.location_on, "People Nearby"),
          _buildDrawerItem(Icons.bookmark, "Saved Messages"),
          _buildDrawerItem(Icons.settings, "Settings"),
          const Divider(),
          _buildDrawerItem(Icons.person_add, "Invite Friends"),
          _buildDrawerItem(Icons.help, "Telegram Features"),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Placeholder: Implement navigation or action
      },
    );
  }
}
