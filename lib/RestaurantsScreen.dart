import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RestaurantsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      "name": "مطعم بيونيا",
      "photos": [
        "assets/images/b1.jpg",
        "assets/images/b2.jpg",
        "assets/images/b3.jpg",
        "assets/images/b4.jpg",
        "assets/images/b5.jpg",
        "assets/images/b6.jpg",
      ],
      "location": "https://www.google.com/maps?q=30.0444,31.2357",
      "menu": "https://example.com/menu1.jpg",
    },
    {
      "name": "مطعم marvel",
      "photos": [
        "assets/images/m1.jpg",
        "assets/images/m2.jpg",
      ],
      "location": "https://www.google.com/maps?q=30.0330,31.2330",
      "menu": "https://example.com/menu2.jpg",
    },
    {
      "name": "مطعم جاردينيا",
      "photos": [
        "assets/images/g1.jpg",
        "assets/images/g2.jpg",
        "assets/images/g4.jpg",
        "assets/images/3.jpg",
        "assets/images/g5.jpg",
      ],
      "location": "https://www.google.com/maps?q=30.0330,31.2330",
      "menu": "https://example.com/menu2.jpg",
    },
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "المطاعم",
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade200, Colors.deepOrange.shade400],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(restaurants.length, (index) {
                  final restaurant = restaurants[index];
                  return Card(
                    elevation: 8,
                    margin: EdgeInsets.only(bottom: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.orange.shade50],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Restaurant Name
                            Text(
                              restaurant["name"],
                              style: GoogleFonts.cairo(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),

                            // Photo Slider
                            CarouselSlider(
                              items: restaurant["photos"].map<Widget>((photo) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    photo,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                height: 200,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 0.85,
                                aspectRatio: 16 / 9,
                                enableInfiniteScroll: true,
                                autoPlayInterval: Duration(seconds: 3),
                              ),
                            ),
                            SizedBox(height: 10),

                            // Buttons Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Location Button
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _launchURL(restaurant["location"]);
                                  },
                                  icon: Icon(Icons.location_on,
                                      color: Colors.black),
                                  label: Text(
                                    "موقع المطعم",
                                    style: GoogleFonts.cairo(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                  ),
                                ),

                                // Menu Button
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _launchURL(restaurant["menu"]);
                                  },
                                  icon: Icon(Icons.menu_book,
                                      color: Colors.black),
                                  label: Text(
                                    "قائمة الطعام",
                                    style: GoogleFonts.cairo(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
