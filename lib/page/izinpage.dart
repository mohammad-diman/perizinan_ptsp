import 'package:animate_do/animate_do.dart';
import 'package:b/form/card_form.dart';
import 'package:b/form/jenis_surat.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class IzinPage extends StatefulWidget {
  const IzinPage({super.key});

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
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: const Center(
                  child: SizedBox(
                    height: 1000,
                    child: CardForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
            Navigator.of(context)
            .push(MaterialPageRoute(
            builder: (context) => const JenisSurat()))
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
}
