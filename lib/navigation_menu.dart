import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myclinic/screens/app/make_appointment/clinics_screen.dart';
import 'package:myclinic/screens/app/home/history_screen.dart';
import 'package:myclinic/screens/app/home/home_screen.dart';
import 'package:myclinic/screens/app/pharmacy/pharmacy_category.dart';
import 'package:myclinic/screens/app/profile/profile_screen.dart';
import 'package:myclinic/utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              "assets/images/logo4.png",
              height: 50,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const HistoryScreen();
                  },
                ));
              },
              icon: const Icon(
                Icons.history_rounded,
                color: KColors.bestGrey,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.selectedIndex.value = index;
          },
          selectedItemColor: KColors.primary,
          unselectedItemColor: const Color(0xff484C52),
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
                color: controller.selectedIndex.value == 0
                    ? KColors.primary
                    : KColors.bestGrey,
                size: 24,
              ),
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              label: "Appointment",
              icon: Icon(
                Icons.add,
                color: controller.selectedIndex.value == 1
                    ? KColors.primary
                    : KColors.bestGrey,
                size: 24,
              ),
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              label: "Pharmacy",
              icon: Icon(
                Icons.medication_sharp,
                color: controller.selectedIndex.value == 2
                    ? KColors.primary
                    : KColors.bestGrey,
                size: 24,
              ),
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person,
                color: controller.selectedIndex.value == 3
                    ? KColors.primary
                    : KColors.bestGrey,
                size: 24,
              ),
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ClinicsScreen(),
    const PharmacyCategoryScreen(),
    const ProfileScreen(),
  ];
}
