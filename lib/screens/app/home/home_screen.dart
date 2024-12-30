import 'package:flutter/material.dart';
import 'package:myclinic/data/app/get_appointmets.dart';
import 'package:myclinic/data/auth/user.dart';
import 'package:myclinic/screens/app/home/widgets/appointment_list.dart';
import 'package:myclinic/screens/app/home/widgets/highlight_card.dart';
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
                    child: Text(
                      "Hello, ${User().getUser()!.name!.split(" ")[0]}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: KColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: KColors.bestGrey.withOpacity(0.3),
                    thickness: 2,
                    endIndent: 24,
                    indent: 24,
                  ),
                  const HighlightCard(),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 24.0, left: 24, right: 24),
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
                      ))
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
