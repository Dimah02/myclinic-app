import 'package:flutter/material.dart';
import 'package:myclinic/data/app/get_category.dart';
import 'package:myclinic/models/clinic_model.dart';
import 'package:myclinic/screens/app/make_appointment/doctors_screen.dart';
import 'package:myclinic/utils/constants/colors.dart';

class ClinicsScreen extends StatelessWidget {
  const ClinicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: CategoryService().getClinics(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CategoryList(
                clinics: snapshot.data,
                header: const [],
                searchbar: true,
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

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
    required this.clinics,
    required this.header,
    this.searchbar = false,
  });
  final List<ClinicModel>? clinics;
  final List<Widget> header;
  final bool? searchbar;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<ClinicModel>? searchResults = [];

  void onQueryChanged(String query) {
    setState(() {
      searchResults = widget.clinics!
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    searchResults = widget.clinics;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...widget.header,
          widget.searchbar == true
              ? Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 24),
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
                            borderSide: BorderSide(color: Color(0xffEEEEEE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffEEEEEE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffEEEEEE)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 24,
                ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                //mainAxisSpacing: 32.0, // spacing between rows
                crossAxisSpacing: 8, // spacing between columns
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: searchResults == null ? 0 : searchResults!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return DoctorsScreen(
                          docotrs: searchResults![index].doctors!);
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 32),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: const Color(0xffCCEBFF).withOpacity(0.22)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          height: 70,
                          width: 70,
                          searchResults![index].image!,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox(),
                        ),
                        Text(
                          searchResults![index].name!,
                          style: const TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
