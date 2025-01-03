import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myclinic/screens/app/make_appointment/clinics_screen.dart';
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
          title: Obx(() => Text(
                controller.titles[controller.selectedIndex.value],
                style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff2A456A),
                    fontWeight: FontWeight.w500),
              ))),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.selectedIndex.value = index;
          },
          selectedItemColor: KColors.primary,
          showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: SvgPicture.asset(controller.selectedIndex.value == 0
                  ? "assets/images/home_selected.svg"
                  : "assets/images/home.svg"),
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
              icon: SvgPicture.asset(controller.selectedIndex.value == 2
                  ? "assets/images/pharmacy_selected.svg"
                  : "assets/images/pharmacy.svg"),
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: SvgPicture.asset(controller.selectedIndex.value == 3
                  ? "assets/images/profile_selected.svg"
                  : "assets/images/profile.svg"),
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
  final titles = [
    "",
    "Clinics Category",
    "Pharmacy",
    "Profile",
  ];
}
