import 'package:flutter/material.dart';
import 'package:myclinic/data/app/get_category.dart';
import 'package:myclinic/models/clinic_model.dart';
import 'package:myclinic/screens/app/doctors_screen.dart';
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
                header: const [
                  Padding(
                    padding: EdgeInsets.only(top: 24.0, left: 24, right: 24),
                    child: Text(
                      "Clinics Category",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: KColors.black,
                      ),
                    ),
                  )
                ],
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
        return Padding(
          padding: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return DoctorsScreen(docotrs: searchResults![index].doctors!);
              }));
            },
            child: Container(
              padding:
                  const EdgeInsets.only(bottom: 8, left: 12, right: 12, top: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: KColors.primary.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Image.network(
                  searchResults![index].image!,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text("Error"),
                ),
                title: Text(searchResults![index].name!),
              ),
            ),
          ),
        );
      },
    );
  }
}
