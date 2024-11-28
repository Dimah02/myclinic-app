import 'package:flutter/material.dart';
import 'package:myclinic/utils/constants/colors.dart';

class PharmacyCategoryScreen extends StatefulWidget {
  const PharmacyCategoryScreen({super.key});

  @override
  State<PharmacyCategoryScreen> createState() => _PharmacyCategoryScreenState();
}

class _PharmacyCategoryScreenState extends State<PharmacyCategoryScreen> {
  @override
  final List<Map<String, String>> products = [
    {
      "name": "Fish Oil Omega 3",
      "price": "JOD 75.000",
      "image":
          "https://s3-alpha-sig.figma.com/img/c12b/8f96/5dfe8121ea53e9cfe570a297c523fe76?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=E1FWojIviyiOuM8jo2xW7FqFsBCpvEmElVqv4j70gt-028GBG~6Dyuh6c9iWUG19BGbQxuZZVdZy82XnVtqG9LcL4qN1KP81QTQj8tUpgqqBdzFliUXp2d5ElVNFs5aE6svtqnG7FhRNO6xTk9~hOl2np3E2BsfO5azIqucPKWwLAYpR2P8xj0-2~~C9BLoKQ2yQhMU0kJ7LU0lHkN0PKesFothboHnY4gfw2EC5nzNwIfw3s6YqIASdYnmjqkztQ5UIEOdN5SDSvR1YvGwFd~OuA-f7HsZA3bcNwRZcSBpqXK9yUFSdlw-DXu-iAtnz3J3kGv0Js~7pjb1MZDSwqg__"
    },
    {
      "name": "Lansoprazole 30 mg",
      "price": "JOD 15.000",
      "image":
          "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS23RIHsTwLUjiT4AqgNTc7XjuBZyerg63zH-viJe9uNn80-5aA"
    },
    {
      "name": "Ibuprofen 250mg",
      "price": "JOD 12.000",
      "image":
          "https://static.wixstatic.com/media/nsplsh_6a7757745a726d36375649~mv2.jpg/v1/fill/w_925,h_648,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/nsplsh_6a7757745a726d36375649~mv2.jpg"
    },
    {
      "name": "Relax 30 250mg",
      "price": "JOD 6.000",
      "image":
          "https://s3-alpha-sig.figma.com/img/aef7/7426/d9283ae4b5d61d21c0c48656c40a9625?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LgTauo66SsVe5PG6k9HLJD1yPtrtTEJygEOIAGLJRzAnpj9Rk8JPj2y9qlTlnBK~zCX1Uiy5BUhMMo6y0FnkJ1~siSOqFtZVdUXXfBllP76VkvrXQX9WfsqJ1dUxlizrrNGkIZo2h0FP9Vezkk6tQloiojuBLVC7Ens9l940NnPjuJyxeKxJKdUg0GrXo6wMvIN9sj534HJLH4x-AEIjJCG8S~YxD2Ha21j-YaORP2frMmRko8Q3LQNUIeagKqmXJw9i17Kkka2pAjVM9m76C02j8i34NORGxjBLzq56ZQ~eN~3dD1PPHtg9jzxEwP7thQRFLDPVK9mp3OUvtgWtKA__"
    },
    {
      "name": "Ibuprofen 250mg",
      "price": "JOD 12.000",
      "image":
          "https://static.wixstatic.com/media/nsplsh_6a7757745a726d36375649~mv2.jpg/v1/fill/w_925,h_648,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/nsplsh_6a7757745a726d36375649~mv2.jpg"
    },
    {
      "name": "Paracetamol 500mg",
      "price": "JOD 10.000",
      "image":
          "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS23RIHsTwLUjiT4AqgNTc7XjuBZyerg63zH-viJe9uNn80-5aA"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pharmacy",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: KColors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Available Products",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF019BFE),
              ),
            ),
            const SizedBox(
              height: 20,
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
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
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
                            child: Image.network(
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
