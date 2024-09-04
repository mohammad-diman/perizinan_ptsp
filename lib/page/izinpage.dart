import 'package:animate_do/animate_do.dart';
import 'package:b/form/card_form.dart';
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
        title: Text('Izin Saya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),),
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
              SizedBox(
                height: 5,
              ),
              FadeInUp(
                duration: Duration(milliseconds: 1000),
                child: Center(
                  child: SizedBox(
                    height: 999,
                    child: CardForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Iconsax.add),backgroundColor: Colors.blueAccent.shade100,),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Rotate',
        backgroundColor: Color.fromRGBO(3, 165, 252, 1),
        child: AnimatedBuilder(
          animation: _controller,
          child: Icon(Iconsax.add),
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
