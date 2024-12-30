import 'package:flutter/material.dart';
import 'package:myclinic/data/app/get_appointmets.dart';
import 'package:myclinic/models/appointment_model.dart';
import 'package:myclinic/screens/app/home/widgets/appointment_card.dart';
import 'package:myclinic/utils/constants/colors.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) {
    searchResults = Provider.of<GetAppointmentService>(context).appointmetns;
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
