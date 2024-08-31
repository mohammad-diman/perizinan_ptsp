import 'package:animate_do/animate_do.dart';
import 'package:b/page/homepage.dart';
import 'package:b/page/izinpage.dart';
import 'package:b/page/profilpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      
      bottomNavigationBar: Obx(
        
        () => NavigationBar(
          indicatorColor: Color.fromRGBO(3, 165, 252, .3),
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          
          destinations: [
            FadeInLeft(duration: Duration(milliseconds: 1000), child: NavigationDestination(icon: Icon(Iconsax.home), label: 'Beranda'),),
            FadeInUp(duration: Duration(milliseconds: 1000), child: NavigationDestination(icon: Icon(Iconsax.document), label: 'Izin'),),
            FadeInRight(duration: Duration(milliseconds: 1000), child: NavigationDestination(icon: Icon(Iconsax.profile_2user), label: 'Profil'),),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomePage(), const IzinPage(),  ProfilPage()];
}