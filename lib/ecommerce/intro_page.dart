import 'package:flutter/material.dart';
import '/ecommerce/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EcommercePage(),
    );
  }
}

class EcommercePage extends StatelessWidget {
  const EcommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background for modern feel
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 204, 204, 206), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the column vertically
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Nike Logo
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1543508282-6319a3e2621f",
                      height: 230,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Slogan text with bigger and bolder font
                Text(
                  "Just Do It",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 37, 37, 37),
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 20),

                // Description with more readable text
                Text(
                  "The biggest shoes marketplace in Ethiopia and the world, associated with Nike.",
                  style: TextStyle(
                    color: const Color.fromARGB(179, 81, 80, 80),
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),

                // "Shop Now" Button with modern design
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        "Shop Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
