import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Explore trending topics and recommended content.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            // Menambahkan tombol kategori di atas GridView
            Wrap(
              spacing: 8,
              children: [
                _categoryButton('Category 1'),
                _categoryButton('Category 2'),
                _categoryButton('Category 3'),
                _categoryButton('Category 4'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dua kolom
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemCount: 6, // Misalnya ada 6 konten
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(
                        'Content ${index + 1}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Menambahkan FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tindakan yang dilakukan saat tombol FAB diklik
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.category),
      ),
    );
  }

  // Widget kategori button
  Widget _categoryButton(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}
