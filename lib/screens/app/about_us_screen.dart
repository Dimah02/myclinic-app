import 'package:flutter/material.dart';

void main() {
  runApp(const about());
}

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "About us",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            SizedBox(
              height: 200,
              child: Image.asset(
                "Images/Edited.jpg",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Our Mission",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF63B4FF),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                width: 100.0,
                height: 140.0,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "MyClinic provides comprehensive healthcare services to our university community. Our dedicated team of experienced healthcare professionals offers a range of services, including routine check-ups, vaccinations, and treatment for minor illnesses and injuries. We are committed to providing accessible, high-quality care to our students, faculty, and staff, promoting overall well-being and supporting academic success.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 80.0),
              child: Text(
                "Contact us",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 80),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF63B4FF),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: 20,
                height: 50,
                child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Al Arab st.21-Amman-Jordan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 80),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF63B4FF),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: 20,
                height: 50,
                child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.phone_in_talk_outlined,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Tel:00962-65609999",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 80),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF63B4FF),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: 20,
                height: 50,
                child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Sun-Thursday 8AM-4PM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
