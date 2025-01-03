import 'package:flutter/material.dart';
import 'package:myclinic/utils/constants/colors.dart';

class PharmacyCategoryScreen extends StatefulWidget {
  const PharmacyCategoryScreen({super.key});

  @override
  State<PharmacyCategoryScreen> createState() => _PharmacyCategoryScreenState();
}

class _PharmacyCategoryScreenState extends State<PharmacyCategoryScreen> {
  final List<Map<String, String>> products = [
    {
      "name": "Strepsils lozenge 24pcs",
      "price": "JOD 7.000",
      "image": "assets/pharmacy/strepsils lozenge 24pcs.webp"
    },
    {
      "name": "Bepanthen Nappy Care 100gm",
      "price": "JOD 7.00",
      "image": "assets/pharmacy/Bepanthen Nappy Care 100gm.webp"
    },
    {
      "name": "Apixaban",
      "price": "JOD 50.00",
      "image": "assets/pharmacy/apixaban.webp"
    },
    {
      "name": "Rivax 20 Mg 30 Tablets",
      "price": "JOD 40.00",
      "image": "assets/pharmacy/Rivax 20 Mg 30 Tablets.webp"
    },
    {
      "name": "Domassel 90 Mg 60 Tablets",
      "price": "JOD 25.000",
      "image": "assets/pharmacy/domassel-90-mg-60-tablets.webp"
    },
    {
      "name": "Sudocrem 125g",
      "price": "JOD 8.00",
      "image": "assets/pharmacy/Sudocrem 125g.jpg"
    },
  ];

  List<Map<String, String>> searchResults = [];
  @override
  void initState() {
    super.initState();
    searchResults = products;
  }

  void onQueryChanged(String query) {
    setState(() {
      searchResults = products
          .where((item) =>
              item["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Available Products",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: KColors.primary,
              ),
            ),
            Padding(
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
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffEEEEEE)),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffEEEEEE)),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final product = searchResults[index];
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              product["image"]!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, left: 16, right: 16, bottom: 8),
                            child: Text(
                              product["name"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xFF666666),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16),
                            child: Text(
                              product["price"]!,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
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
      ),
    );
  }
}
