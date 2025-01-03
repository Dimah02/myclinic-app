import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pharmacy"),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 70),
                child: SizedBox(
                    height: 400,
                    child: Image.network(
                      'https://s3-alpha-sig.figma.com/img/aef7/7426/d9283ae4b5d61d21c0c48656c40a9625?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LgTauo66SsVe5PG6k9HLJD1yPtrtTEJygEOIAGLJRzAnpj9Rk8JPj2y9qlTlnBK~zCX1Uiy5BUhMMo6y0FnkJ1~siSOqFtZVdUXXfBllP76VkvrXQX9WfsqJ1dUxlizrrNGkIZo2h0FP9Vezkk6tQloiojuBLVC7Ens9l940NnPjuJyxeKxJKdUg0GrXo6wMvIN9sj534HJLH4x-AEIjJCG8S~YxD2Ha21j-YaORP2frMmRko8Q3LQNUIeagKqmXJw9i17Kkka2pAjVM9m76C02j8i34NORGxjBLzq56ZQ~eN~3dD1PPHtg9jzxEwP7thQRFLDPVK9mp3OUvtgWtKA__',
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Relax 30",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Text(
                    "Dissolvable wafers",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 70),
                      IconButton(
                        onPressed: decrementQuantity,
                        icon: const Icon(Icons.remove),
                        color: Colors.black,
                      ),
                      Text(
                        "$quantity",
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: incrementQuantity,
                        icon: const Icon(Icons.add),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "200 mg",
                style: TextStyle(fontSize: 11, color: Color(0xFF9D9D9D)),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "\$25.50",
                style: TextStyle(fontSize: 25, color: Color(0xFF019BFE)),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 100),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(),
                child: const Text(
                  "Buy",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ));
  }
}
