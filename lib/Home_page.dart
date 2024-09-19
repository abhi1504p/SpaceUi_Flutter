import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_ui/onlineimage.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int selectedIndex = 1;
  int currentIndex = 0;
  void onTap(int index) {
    currentIndex = index;

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              buildRow(),
              const SizedBox(
                height: 30,
              ),
              buildSizedBox(),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildcard(size, "Mars", mars, "2900"),
                  buildcard(size, "Earth", earth, 2080)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              coverimage(size,cassiniSaturn,"Cassini \n non Staturn","2080k"),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildcard(size, "Mercury", mercury, "2190"),
                  buildcard(size, "Venus", venus, 3200)
                ],
              ), const SizedBox(
                height: 40,
              ), coverimage(size,earthSurvey,"EarthSurvey","2080k"), const SizedBox(
          height: 40,
        ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildcard(size, "Earth", earth, "2900"),
                  buildcard(size, "Mars", mars, 2080)
                ],
              ), const SizedBox(
                height: 40,
              ),Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildcard(size, "Jupiter", jupiter, "2910"),
                  buildcard(size, "Saturn", saturn, 3020)
                ],
              ), const SizedBox(
                height: 40,
              ),Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildcard(size, "Uranus", uranus, "2920"),
                  buildcard(size, "Neptune", neptune, 3090)
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
        onTap: onTap,
        currentIndex:currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.shade700,
        backgroundColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation:0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Map',
            icon: Icon(Icons.map),
          ),
        ],
      ),
      ],)
    );
  }

  Container coverimage(Size size,image,name,vie) {
    return Container(
      width: size.width,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
               Text(
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    height: 1),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.visibility,
                    color: Colors.white.withOpacity(0.3),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    ("$vie"),
                    style: TextStyle(
                        fontSize: 15, color: Colors.white.withOpacity(.3)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  SizedBox buildcard(Size size, tittle, imageurl, views) {
    return SizedBox(
      width: size.width / 2,
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 160,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white30, width: 1.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      tittle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.visibility,
                          color: Colors.white.withOpacity(0.3),
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          ("$views views"),
                          style: TextStyle(color: Colors.white.withOpacity(.3)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: -20,
              left: 30,
              child: Center(
                  child: Image.network(
                imageurl,
                height: 110,
                width: 110,
                fit: BoxFit.cover,
              )))
        ],
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: space.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          border: Border.all(color: Colors.white30),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        space[index],
                        style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(profile), fit: BoxFit.cover)),
        ),
        const Text(
          "About",
          style: TextStyle(
              fontSize: 37, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.view_column_sharp,
              color: Colors.white,
              size: 35,
            ))
      ],
    );
  }
}

List<String> space = ["All", "Planet", "Comets", "Solar System", "Asteriods"];
