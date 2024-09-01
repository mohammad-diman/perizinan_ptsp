import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


class IzinPage extends StatefulWidget {
  const IzinPage({super.key});

  @override
  State<IzinPage> createState() => _IzinPageState();
}

class _IzinPageState extends State<IzinPage> {
  @override
Widget build(BuildContext context) {
  var size = MediaQuery.of(context).size;

    return Scaffold(
     backgroundColor: Colors.white70,
     body: SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInUp(duration: const Duration(milliseconds: 1000),
            child: Padding(padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Formulir Permohonan",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)
                  ),
                ),
              ],
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