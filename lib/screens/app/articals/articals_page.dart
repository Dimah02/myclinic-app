import 'package:flutter/material.dart';
import 'package:myclinic/screens/app/articals/artical_one_page.dart';
import 'package:myclinic/screens/app/articals/artical_three_page.dart';
import 'package:myclinic/screens/app/articals/artical_two_page.dart';
import 'package:myclinic/screens/app/articals/widgets/artical_card.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Articles'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                    ),
                    child: const Text(
                      'Doctors',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue.shade50,
                    ),
                    child: const Text(
                      'Articles',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ArticleCard(
                  category: "Global Health Insights",
                  title: "Understanding Hypertension: The Silent Killer",
                  time: "2 days ago",
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2016/08/10/20/26/blood-pressure-1584223_1280.jpg",
                  categoryColor: const Color.fromARGB(255, 0, 0, 0),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HypertensionPage()),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                ArticleCard(
                  category: "Innovative Healthcare",
                  title: "Diabetes Management: Tips for a Healthier Life",
                  time: "17 hours ago",
                  imageUrl:
                      "https://thumbs.dreamstime.com/b/red-heart-shape-medical-stethoscope-light-background-top-view-health-care-medicare-cardiology-concept-blue-104679825.jpg",
                  categoryColor: const Color.fromARGB(255, 0, 0, 0),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DiabetesPage()),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                ArticleCard(
                  category: "Clinical Perspectives",
                  title: "Breaking Down Asthma: Causes and Symptoms",
                  time: "5 hours ago",
                  imageUrl:
                      "https://thumbs.dreamstime.com/b/nutritional-food-heart-health-wellness-cholesterol-diet-healthy-nutrition-eating-clean-fruits-nutritional-food-207935188.jpg",
                  categoryColor: const Color.fromARGB(255, 0, 0, 0),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AsthmaPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
