import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';  // Import google_fonts

class RestaurantsScreen extends StatelessWidget {
  final List<Map<String, String>> restaurants = [
    {
      "name": "مطعم 1",
      "location": "https://www.google.com/maps?q=30.0444,31.2357",
      "menu": "https://khamsat.hsoubcdn.com/images/services/1839265/92e1b3ed0ce1d84903ab7fd60e00bcd3.jpg", // The image URL
    },
    {
      "name": "مطعم 2",
      "location": "https://www.google.com/maps?q=30.0330,31.2330",
      "menu": "https://khamsat.hsoubcdn.com/images/services/1839265/92e1b3ed0ce1d84903ab7fd60e00bcd3.jpg", // The image URL
    },
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url); // Launch the URL (which will open in a browser)
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // RTL direction
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "المطاعم",
            style: GoogleFonts.cairo(), // Apply Cairo font to AppBar
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(restaurants.length, (index) {
                final restaurant = restaurants[index];
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          restaurant["name"]!,
                          style: GoogleFonts.cairo(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on, color: Colors.red),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                _launchURL(restaurant["location"]!);
                              },
                              child: Text(
                                "موقع المطعم",
                                style: GoogleFonts.cairo(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.menu, color: Colors.green),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                // Open the image URL in the browser
                                _launchURL(restaurant["menu"]!);
                              },
                              child: Text(
                                "قائمة الطعام",
                                style: GoogleFonts.cairo(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
