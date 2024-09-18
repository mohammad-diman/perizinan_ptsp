
import 'package:b/page/izinbaru_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../model/item_models.dart';

class IzinPage extends StatefulWidget {
  const IzinPage({super.key, required List<String> izinItems});

  @override
  State<IzinPage> createState() => _IzinPageState();
}

class _IzinPageState extends State<IzinPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final List<String> izinItems = ModalRoute.of(context)!.settings.arguments as List<String>? ?? [];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Izin Saya',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.white70,
      body: Consumer<ItemModel>(
        builder: (context, itemModel, child) {
          return itemModel.items.isNotEmpty
              ? ListView.builder(
            itemCount: itemModel.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  color: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [ 
                      ListTile(
                        contentPadding: EdgeInsets.all(16.0),
                        title: Text(
                          itemModel.items[index],
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              _editItem(context, itemModel, index);
                            },
                            child: Text('Edit', style: TextStyle(color: Colors.black),),
                          ),
                          TextButton(
                            onPressed: () {
                              itemModel.removeItem(index);
                            },
                            child: Text('Hapus', style: TextStyle(color: Colors.black),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text('Anda belum membuat surat.'),
          );
        },
      ),

      
      
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
            Navigator.of(context)
            .push(MaterialPageRoute(
            builder: (context) => const IzinbaruPage()))
            .then((value) => (value));
      },
        tooltip: 'Buat Izin Baru',
        backgroundColor: const Color.fromRGBO(3, 165, 252, 1),
        child: AnimatedBuilder(
          animation: _controller,
          child: const Icon(
            Iconsax.add,
            color: Colors.white,
          ),
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 6.3,
              child: child,
            );
          },
        ),
      ),
    );
  }

  void _editItem(BuildContext context, ItemModel itemModel, int index) {
    final TextEditingController _editController = TextEditingController(text: itemModel.items[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Surat', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          content: TextField(
            controller: _editController,
            decoration: InputDecoration(hintText: 'Kalo bken surat lia bae2 aa.',),
          ),
          actions: [
            TextButton(
              onPressed: () {
                itemModel.updateItem(index, _editController.text);
                Navigator.of(context).pop();
              },
              child: Text('Simpan', style: TextStyle(color: Colors.black),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal', style: TextStyle(color: Colors.black),),
            ),
          ],
        );
      },
    );
  }

}
