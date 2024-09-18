import 'package:b/model/item_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JenisSurat extends StatefulWidget {
  const JenisSurat({super.key});

  @override
  State<JenisSurat> createState() => _JenisSuratState();
}


class _JenisSuratState extends State<JenisSurat> {



  TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  List<String> _allItems = List.generate(176, (index) => 'Surat Penelitian Mahasiswa $index');
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();

    _filteredItems = _allItems;
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _allItems
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  void _handleCardButtonPress(String item) {
    final itemModel = Provider.of<ItemModel>(context, listen: false);
    itemModel.addItem(item); // Ba tambah item ka model

    // Kalo halaman izin so ta tampil, item langsung mo muncul
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        children: [
          // Search bar di luar elemen scrollable
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari Surat...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // ListView konten yang bisa mo scroll
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 4.0, // efek bayangan
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            _filteredItems[index],
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                        // Tombol diCard
                        ElevatedButton(
                          onPressed: () {
                            _handleCardButtonPress('${_filteredItems[index]}');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.blue,
                          ),
                          child: Text('Buat Surat'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
