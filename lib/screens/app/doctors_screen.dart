import 'package:flutter/material.dart';
import 'package:myclinic/models/doctor_model.dart';
import 'package:myclinic/screens/app/doctor_profile_screen.dart';
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
        return DoctorCard(
          id: searchResults![index].id!,
          name: searchResults![index].name!,
          specialty: searchResults![index].specialization!,
          reviews: searchResults![index].averageRating,
          openingTime: "9:00",
          imagePath: searchResults![index].photo!,
        );
      },
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double reviews;
  final String openingTime;
  final String imagePath;
  final String id;

  const DoctorCard({
    super.key,
    required this.id,
    required this.name,
    required this.specialty,
    required this.reviews,
    required this.openingTime,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return DoctorProfileScreen(
                id: id,
              );
            },
          ));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
            border: Border.all(
              color: KColors.bestGrey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: KColors.bestGrey.withOpacity(0.15),
                    backgroundImage: NetworkImage(imagePath),
                    onBackgroundImageError: (exception, stackTrace) =>
                        const SizedBox(),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: KColors.black),
                      ),
                      Text(
                        specialty,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: KColors.bestGrey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Divider(
                color: KColors.bestGrey.withOpacity(0.5),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFEB052),
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${reviews.toStringAsFixed(1)} Reviews",
                        style: const TextStyle(
                          color: Color(0xffFEB052),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: KColors.primary,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Open at $openingTime AM",
                        style: const TextStyle(
                            fontSize: 12, color: KColors.primary),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
