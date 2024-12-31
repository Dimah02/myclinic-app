import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String category;
  final String title;
  final String time;
  final String imageUrl;
  final Color categoryColor;
  final VoidCallback onTap;

  const ArticleCard({
    super.key,
    required this.category,
    required this.title,
    required this.time,
    required this.imageUrl,
    required this.categoryColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 6.0,
                        backgroundColor: categoryColor,
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Text(
                          category,
                          style: TextStyle(
                            color: categoryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Text(
                              time,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      Image.network(
                        imageUrl,
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
