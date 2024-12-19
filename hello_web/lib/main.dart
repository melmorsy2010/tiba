import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'دار الدفاع الجوي',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  // Header with Image and Title
  Widget buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurpleAccent, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Image at the Top
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child:  Image.asset(
              'assets/images/oo.jpg',
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),

          ),
          SizedBox(height: 10),
          // Title Text
          Text(
            "تطبيق جاردينيا سيتي 🌐",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  // Buttons
  Widget buildMainButtons() {
    return Column(
      children: [
        // Rent Button
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add_circle_outline),
          label: Text(
            "اعرض شقتك للإيجار",
            style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
        // Reserve Button
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add_circle_outline),
          label: Text(
            "احجز شقتك الان",
            style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  // List of Categories
  Widget buildCategories() {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.local_pharmacy, "label": "صيدليات"},
      {"icon": Icons.shopping_cart, "label": "سوبر ماركت وعطارة"},
      {"icon": Icons.filter_sharp, "label": "لحوم - دواجن - أسماك"},
      {"icon": Icons.apple, "label": "خضروات وفواكه"},
      {"icon": Icons.restaurant, "label": "مطاعم ودليفري"},
      {"icon": Icons.cake, "label": "مخبوزات وحلويات"},
      {"icon": Icons.home, "label": "أكل بيتي"},
      {"icon": Icons.local_laundry_service, "label": "غسيل ومكوى"},
      {"icon": Icons.bug_report, "label": "مكافحة حشرات"},
      {"icon": Icons.build, "label": "شركات تشطيب"},
      {"icon": Icons.handyman, "label": "عمال وصنايعية"},
      {"icon": Icons.car_rental, "label": "إيجارات"},
      {"icon": Icons.shopping_basket, "label": "إعادة بيع"},
      {"icon": Icons.local_shipping, "label": "نقل أثاث"},
      {"icon": Icons.warning, "label": "ونش إنقاذ"},
      {"icon": Icons.content_cut, "label": "كوافير ومصفف شعر"},
      {"icon": Icons.kitchen, "label": "مستلزمات منزل ومطبخ"},
      {"icon": Icons.sports_gymnastics, "label": "جيم ولياقة بدنية"},
      {"icon": Icons.sports_soccer, "label": "أكاديميات رياضية"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3.5,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(categories[index]["icon"], color: Colors.black54),
              SizedBox(width: 8),
              Text(
                categories[index]["label"],
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildHeader(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: buildMainButtons(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: buildCategories(),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
