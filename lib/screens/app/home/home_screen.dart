import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myclinic/data/app/get_appointmets.dart';
import 'package:myclinic/data/auth/user.dart';
import 'package:myclinic/navigation_menu.dart';
import 'package:myclinic/screens/app/home/history_screen.dart';
import 'package:myclinic/screens/app/home/widgets/appointment_list.dart';
import 'package:myclinic/screens/app/home/widgets/highlight_card.dart';
import 'package:myclinic/screens/app/make_appointment/all_doctors_screen.dart';
import 'package:myclinic/screens/app/make_appointment/clinics_screen.dart';
import 'package:myclinic/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<GetAppointmentService>(context, listen: false)
              .getCurrentAppointments(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AppointmentsList(
                app: snapshot.data,
                header: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24.0, left: 24, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hello,",
                              style: TextStyle(
                                  color: Color(0xff8696BB), fontSize: 16),
                            ),
                            Text(
                              User().getUser()!.name!.split(" ")[0],
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: KColors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage("assets/images/avatar.png"),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const HighlightCard(),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            final controller = Get.put(NavigationController());
                            controller.selectedIndex.value = 1;
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(24),
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFAFAFA),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: SvgPicture.asset(
                                    "assets/images/disease.svg",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Disease",
                                style: TextStyle(color: Color(0xff8696BB)),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return const AllDoctorsScreen();
                              },
                            ));
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(24),
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFAFAFA),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: SvgPicture.asset(
                                    "assets/images/doctor.svg",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Doctors",
                                style: TextStyle(color: Color(0xff8696BB)),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return const HistoryScreen();
                              },
                            ));
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(24),
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFAFAFA),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: SvgPicture.asset(
                                    "assets/images/history.svg",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "History",
                                style: TextStyle(color: Color(0xff8696BB)),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(24),
                              height: 72,
                              width: 72,
                              decoration: BoxDecoration(
                                color: const Color(0xffFAFAFA),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child: SvgPicture.asset(
                                  "assets/images/artical.svg",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Articals",
                              style: TextStyle(color: Color(0xff8696BB)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 8,
                    ),
                    child: Text(
                      Provider.of<GetAppointmentService>(context)
                              .appointmetns!
                              .isNotEmpty
                          ? "Your Current Appointments"
                          : "No Appointments yet",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: KColors.black,
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: KColors.primary,
                ),
              );
            }
          }),
    );
  }
}
