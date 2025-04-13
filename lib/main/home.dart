import 'package:flutter/material.dart';
import 'discover.dart';
import 'profile.dart';
import 'library.dart';
import 'widget/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final TextEditingController _controller = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _sendQuestion() {
    if (_controller.text.isNotEmpty) {
      _controller.clear();
    }
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Column(
        children: [
          AppBar(
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => const ProfilePage(),
                        transitionsBuilder: (_, animation, __, child) {
                          var tween = Tween(
                            begin: const Offset(-1.0, 0.0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeInOut));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Polsri AI',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _handleRefresh,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: const Center(
                      child: Image(
                        image: AssetImage('assets/images/background.png'),
                        height: 150,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: () => _showAttachmentOptions(context),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Ask something...',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendQuestion,
                ),
              ],
            ),
          ),
        ],
      ),
      const DiscoverPage(),
      const LibraryPage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavbarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  void _showAttachmentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.attach_file),
            title: const Text('Attach File'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Attach Image'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
