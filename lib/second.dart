import 'package:flutter/material.dart';
import 'package:space_ui/Home_page.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final PageController _pageController = PageController();
  double progress = 0.33;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: SizedBox(
              height: 400,
              width: 400,
              child: PageView(
                controller: _pageController,
                children: [
                  plannetimage("assets/spaceimages/image1.png"),
                  plannetimage("assets/spaceimages/image2.png"),
                  plannetimage("assets/spaceimages/image3.png"),
                ],
              ),
            )),
            const Text(
              "Explore the universe!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "Learn more about the \n universe where we live.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, height: 1, color: Colors.white54),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Colors.red,
                        value: progress == 0.99 ? 1 : progress,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white54 ),
                      child: const Icon(
                        Icons.arrow_circle_right,
                        color: Colors.redAccent,
                        size: 50,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        progress+=0.33;
                      });
                        if(_pageController.hasClients){
                          _pageController.animateToPage(
                            _pageController.page!.toInt()+1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeOut,
                          );
                        }
                        if(_pageController.page!.toInt()==2){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(_)=>homepage()), (route) => false);
                        }

                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox plannetimage(image) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Image.asset(
        image,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
