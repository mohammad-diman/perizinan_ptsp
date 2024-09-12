import 'package:animate_do/animate_do.dart';
import 'package:b/asset/home_asset.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
          backgroundColor: Colors.blue.shade900,
          title: ValueListenableBuilder<String>(
            valueListenable: UserState().nama,
            builder: (context, nama, child) {
              return Text(
                "Halo, " "$nama",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              );
            },
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.notification,
                  color: Colors.white,
                ))
          ],
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
                      height: 855,
                      child: HomeAsset(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
}

