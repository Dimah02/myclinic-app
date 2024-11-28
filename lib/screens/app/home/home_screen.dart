import 'package:flutter/material.dart';
import 'package:myclinic/common/loaders/full_screen_loader.dart';
import 'package:myclinic/data/app/cancel_appointment.dart';
import 'package:myclinic/data/app/get_appointmets.dart';
import 'package:myclinic/data/auth/user.dart';
import 'package:myclinic/models/appointment_model.dart';
import 'package:myclinic/screens/app/widgets/highlight_card.dart';
import 'package:myclinic/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: GetAppointmentService().getCurrentAppointments(),
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
                        snapshot.data!.isNotEmpty
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

class AppointmentsList extends StatefulWidget {
  const AppointmentsList({
    super.key,
    required this.app,
    required this.header,
    this.searchbar = false,
  });
  final List<AppointmentModel>? app;
  final List<Widget> header;
  final bool? searchbar;

  @override
  State<AppointmentsList> createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList> {
  List<AppointmentModel>? searchResults = [];

  void onQueryChanged(String query) {
    setState(() {
      searchResults = widget.app!
          .where((item) =>
              item.docotrName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    searchResults = widget.app;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: searchResults == null ? 1 : searchResults!.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...widget.header,
              widget.searchbar == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, right: 24),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              onChanged: onQueryChanged,
                              decoration: const InputDecoration(
                                hintText: "Search for a Clinic",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: KColors.bestGrey,
                                ),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: KColors.bestGrey,
                                ),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffEEEEEE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffEEEEEE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffEEEEEE)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    )
                  : const SizedBox(
                      height: 24,
                    ),
            ],
          );
        }
        index -= 1;
        return AppointmentCard(
            app: searchResults![index],
            doctorName: searchResults![index].docotrName!,
            doctorTitle: searchResults![index].doctorSpecialization!,
            doctorImage: searchResults![index].photo!,
            appointmentDate: searchResults![index].date!,
            appointmentTime: searchResults![index].time!,
            appointmentStatus: searchResults![index].status!);
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String doctorTitle;
  final String doctorImage;
  final DateTime appointmentDate;
  final String appointmentTime;
  final String appointmentStatus;
  final AppointmentModel app;

  const AppointmentCard({
    super.key,
    required this.app,
    required this.doctorName,
    required this.doctorTitle,
    required this.doctorImage,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.appointmentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: KColors.bestGrey.withOpacity(0.1))),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          doctorImage), // Use cached_network_image if needed
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(doctorTitle),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _showAlertDialog(context,
                        doctorName: doctorName,
                        date: appointmentDate.toString().split(" ")[0],
                        time: appointmentTime,
                        appID: app.id!);
                  },
                  child: Text(
                    "Cancle",
                    style: TextStyle(color: Colors.red.shade600),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Divider(
              color: KColors.bestGrey.withOpacity(0.2),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 18,
                      color: KColors.bestGrey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${appointmentDate.day}/${appointmentDate.month}',
                      style: const TextStyle(
                          fontSize: 14, color: KColors.bestGrey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 18, color: KColors.bestGrey),
                    const SizedBox(width: 8),
                    Text(
                      appointmentTime,
                      style: const TextStyle(
                          fontSize: 14, color: KColors.bestGrey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {}, // Implement button functionality
                style: ElevatedButton.styleFrom(
                    backgroundColor: KColors.accent,
                    side: const BorderSide(color: KColors.accent)),
                child: Text(
                  appointmentStatus.toUpperCase(),
                  style: const TextStyle(
                    color: KColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAlertDialog(
    BuildContext context, {
    required String doctorName,
    required String date,
    required String time,
    required String appID,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Are you sure you want to cancel this appointment?",
            style: TextStyle(color: KColors.primary, fontSize: 16),
          ),
          content: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Doctor: $doctorName"),
                const SizedBox(
                  height: 8,
                ),
                Text("Date: $date"),
                const SizedBox(
                  height: 8,
                ),
                Text("Time: $time"),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Confirm'),
              onPressed: () async {
                // Handle the confirm action
                try {
                  CancelAppointmentService service = CancelAppointmentService();
                  KFullScreenLoader.openLoadingDialog(context,
                      text: "Cancelling Your Appointment");
                  await service.cancelAppointment(appID: appID);
                  if (context.mounted) {
                    KFullScreenLoader.stopLoading(context);
                  }
                } catch (e) {
                  if (context.mounted) {
                    KFullScreenLoader.stopLoading(context);
                  }
                }
                if (context.mounted) Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}