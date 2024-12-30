import 'package:flutter/material.dart';
import 'package:myclinic/models/doctor_model.dart';
import 'package:myclinic/screens/app/make_appointment/doctor_profile_screen.dart';
import 'package:myclinic/screens/app/make_appointment/widgets/doctor_card.dart';
import 'package:myclinic/utils/constants/colors.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key, required this.docotrs});
  final List<DoctorModel> docotrs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DoctorsList(
        doctors: docotrs,
        searchbar: true,
        header: const [
          Padding(
            padding: EdgeInsets.only(top: 24.0, left: 24, right: 24),
            child: Text(
              "Relevant doctors",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: KColors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DoctorsList extends StatefulWidget {
  const DoctorsList({
    super.key,
    required this.doctors,
    required this.header,
    this.searchbar = false,
  });
  final List<DoctorModel>? doctors;
  final List<Widget> header;
  final bool? searchbar;

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  List<DoctorModel>? searchResults = [];

  void onQueryChanged(String query) {
    setState(() {
      searchResults = widget.doctors!
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    searchResults = widget.doctors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
                            padding:
                                const EdgeInsets.only(left: 24.0, right: 24),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                onChanged: onQueryChanged,
                                decoration: const InputDecoration(
                                  hintText: "Search doctor",
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffEEEEEE)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffEEEEEE)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
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
          return DoctorCard(
            id: searchResults![index].id!,
            name: searchResults![index].name!,
            specialty: searchResults![index].specialization!,
            reviews: searchResults![index].averageRating,
            openingTime: "9:00",
            imagePath: searchResults![index].photo!,
          );
        },
      ),
    );
  }
}
