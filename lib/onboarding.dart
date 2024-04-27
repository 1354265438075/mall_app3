import 'package:flutter/material.dart';
import 'package:unnamed_app2/models/onboarding_model.dart';
import 'package:unnamed_app2/pages/login.dart';

class onboarding extends StatefulWidget {
  @override
  _onboardingState createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: currentIndex > 0
            ? IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary
          ),

          onPressed: () {
            controller.previousPage(
              duration: Duration(milliseconds: 100),
              curve: Curves.bounceIn,
            );
            setState(() {
              currentIndex--;
            });
          },
        )
            : null,
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: contents.length,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                child: Image.asset(
                  contents[i].image,
                  width: 180,
                  height: 180,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Text(
                  contents[i].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
                child: Text(
                  contents[i].description,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                      (index) => Container(
                    height: 10,
                    width: currentIndex == index ? 20 : 10,
                    margin: EdgeInsets.only(right: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: index == currentIndex
                          ? Colors.orange[800]
                          : Colors.orange[800],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Next"),
                  onPressed: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>Login(),
                        ),
                      );
                    } else {
                      controller.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.bounceIn,
                      );
                      setState(() {
                        currentIndex++;
                      });
                    }
                  },
                  color: Colors.orange[700],
                  textColor: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}