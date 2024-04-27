import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final List<Widget> items = [
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/logos/dark_splash_image.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/logos/dark_splash_image.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/logos/dark_splash_image.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/logos/dark_splash_image.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/logos/dark_splash_image.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/logos/dark_splash_image.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/logos/dark_splash_image.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/logos/dark_splash_image.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/logos/dark_splash_image.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        style: TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search Product..",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        cursorColor: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  SizedBox(width: 80),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.orangeAccent,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.notification_add_outlined,
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
              SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 150,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  scrollPhysics: const BouncingScrollPhysics(),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: items,
              ),
            ],
          ),
        ),
      ),
    );
  }
}