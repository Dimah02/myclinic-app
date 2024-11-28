import 'package:flutter/material.dart';

void main() {
  runApp(pharmacy_categories());
}

class pharmacy_categories extends StatefulWidget {
  const pharmacy_categories({super.key});

  @override
  State<pharmacy_categories> createState() => _pharmacy_categoriesState();
}

class _pharmacy_categoriesState extends State<pharmacy_categories> {
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
          "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgICgcICAsICAgICgoHCgkJBxsUFQsKIB0WIiAdHx8kKCgsJCYxJx8TITEtMSkrLi4uGB8zODMsNygtLisBCgoKDgoNDg4QDysZFRkrLS0rLSsrNysrKysrKysrLSsrKysrKysrKy0rKysrKysrKysrKysrKysrKysrKysrK//AABEIAJYAlgMBIgACEQEDEQH/xAAaAAADAAMBAAAAAAAAAAAAAAAAAQIDBAUG/8QAMxAAAQQBAgQEBQMEAwEAAAAAAQACAxEEITEFEkFhEyJRcQYygaGxIzORwdHh8EJSchT/xAAWAQEBAQAAAAAAAAAAAAAAAAAAAQL/xAAcEQEBAQEBAQADAAAAAAAAAAAAARECIRIxMkH/2gAMAwEAAhEDEQA/APfi+6oX3UhWAqihfdWLUgKggoWmLSCoBAxfdMX3QAmgYtGvqgBNAa907PdKkwFQao17oTRC17pG+6aCEE6oJKZCRCCTfdCaEGiArAUhWFFUAqASCoIGAqASCoIGAmAgJhABNACAgE0IQCE0IEkVSRVElIqikiEUIQg0grAUBWFFUFQSCoIGFQUhUEFBMJBMIKQkhBSRIFk0AOpWvPlxxWPmd/1HT3WpFKMlzvFdo06R3QS0bwyYdg4HuAa/lZGuB1BBHqFMOLjS21row6tCCR+d1oF7mOcBbS0mz69EnpXTSWGCYuBJGxolv9llBB1FEdlQFBQUFESQhBQg0wqCgKwoqgqCkKgUFBUFIVBBQTChz2sBc4gAdStGfOeeYQNcWgfuchP2Qb0s0cQt5A9B1K1XHIyh+mRDGdiTq7+FyZZXPNlxJcTqVgl+IW8PAgmlEEjGinSAgOFdDss3rJqybcdTLwpsdviOAdHfzNvT0sFcbiGRJG0yYxjEt29klgPHYjYrucI4oOL488LX+KA3xOejTfTUrRkxo3OcCLHMQD+E/aJ+tc34a4nly5LRI2HHjB8z/FLvJ1rQUvSZj43yExghm3c62T2XPx8WOO3gV3G+v4WaUF7ajLWuJD7J6XqnM+YdX6rfgxZHBriTqToNaPdXPHPAWFxADtndHe68vP8AFUOI90EkvgljvDcyRhF+1br0mJnN4lhtlDrjjNB5BHMa6X9EnW3C85NZY8lp0d5T69P5Wa1zC8MBe6gG2bcaHotzFcXsDiC0OJLQRRrotpGYoRaEGiCrBWMKwVFWFQUArDPmRQ6ONu/6jdBtFwGpoAbkrTn4lGy/DqQ0dRt/lY4Hf/bbpXERA0I2Gr9yto8FxpmO8CQska0kASWD11TRyjlukkY6S3ND6IOw0XWh4vBEWtNH3v8AovOOdJGXjkEgdbC07H+y4MmJxDxy6HJy2QuNiN0gIaK2BIJH8rHVsa5yvd8ejhmMc8DQA+PzubsXg/5Xnsnhvj+VziW2dCdl2MedwxYsWidGF73vJJPc9FlxMaKYEyP05q8pAGnqrks9Z2740uGQOxYjEwkMfRdR0OmvuthkzI5G8wscpcXEd6XVl4XE+J8mPIS5jS4tJBDgvO5xkdDJCWlweN2PotO4IPur/PE/vr0ONxfFc+Np5bH6Zu9R6+i1OLY7DLK+HyRu5C2uljf7FeGwMLigyWE5OWYeYDwyQTqfWr+691JOXtgjIIEbaYwal1aa+pU52z1rrJ+HnsvghyXtfI5xI2c4rs4URjYyCK5izSuemx+5/wBK248RztZCWNqvDadSO56fT+VtxsYxoawBrWig1ooBayRPa14sJgLXzfqyN+Wxoz2H9d1tIQUCSTSQaIKJZmRC3kD0HU+y5+bn+D5GUXncnZq50OS4ysleeflf5iTsKQdeU58/7MbmR93gEj6nRcfJEkTiyZro318ruui6zeMthLeXW+tA/lZeLEcRghyGBv6LSySqsbHb6/dZll8WyxwMjPdiRh8AdO02ZGMkAcw9gdwq+GOPz5eYyAQ5MUdeebJkaABeoABJOnssb8RknzCxYtZ8HEhhIc0Bp3NjXf0U+bu6v15jq5/hGZ4g1ZsCOp7dlUXDZ3atZQsnl01091piZzHMczVjXEvJ3oa2VuRceDC3w9Wu2LaIP1VvUjM5t/DFOJISI5WGMtrybXXoeq5XFeJnh8YfC188VEvbE8BzX3dUSL/lesy3N4hDDOBYjbIyQiiAavVcOfhcM5twJB3H0Sz6nhL81h+EPiB/EHAOjyoYnD9Q5QDaHpQJ/hdedkfM8t/baPmcasAVZXOwcfGx3GPGjMs45OZg0Efudh9z6BdeLEvldORIRqGAU1v06+5+yvMyYW7dakMMkpHggMj6zPBo+w6++3uulBAyLa3OPzSPNl3++myyaIVMUklaEBaLSJStA0JEoQeU4xhZJcZ8UNlv9yB5ou03B6H89lxsbItz2RExTNH6mLOyj3sdR3FjuvZDVaPFOD4nEGgTN5ZGaxysNOjPqCNQVmxXjcnhUssjTGZ4Gc1ujhynhpPsDS9ThSyQ4bMJpDY2059CuYn1PX/C0GN4nwgvE4dxDBIoyxsAkjF9R/yHtR/9LJFlsnaJ4y2SA6Dw+hHQjoex1Ukktq9W2Y7PDooHNMkmutUdhXXRddmDgZbSxnlkDSWvFil4rN4k7GZz4oZIG2ZIS/kcO4vQqvhTj8+bkwgRPih5jzvlmFhgOtAXan1nWLOZeddGeKeKywm9ttx6EdQvM5Xw4cqQOMQDHEvcGPIDjfYr32W2OSS4/wBthG53sklaZbJLyjEpoBPNO8eXfoOv479Fq8ysc9WMuE4YmLFjO5Yow2mxsslx/JPt6LOIZZ/m5oIiSeVppzh3I2+mvcKsTEjg85JllI80smpPt0A7DRbS0YmCGOFoZG1rGjo0UsilNAyUwUrSJQUkkkSgolSglIlAyUKbQg0QVQUAqgVFUQHaGiFysvgUL3uyMUnFyT8z4x5ZOzhsR9/QhdUFUCpmjzMuBKSI8nHcNbM0Dedpr0A1F9bB91vcOw8eCjBFO6TlALnY5aO/zUuyCqBVRhjxy6jNTtv027fX1/3RbQrZQmChiwU1Fpgqi7Rai07QVaLU2hBVoJU2kSgolIlSSkSgpJSShBpgqwVjBVArKsgKYKxgqgUFgqgVjBTBQZAUwVjtMFUWmCoBRaDIChRaLVRdotRadoKtFqCUiUFEoJUkqS5BRKFjLkINcFUCkhZVQKYQhBQQEIQMJhNCoAnZSQgdlFlCEBZTQhArKCUkKoRSKEIJQhCD/9k="
    },
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pharmacy"),
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Available Products",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF019BFE),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
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
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              product["name"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xFF666666),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              product["price"]!,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
