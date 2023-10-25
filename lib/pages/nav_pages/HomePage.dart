import 'package:flutter/material.dart';
import 'package:travelapp/widgets/AppLarge_text.dart';
import 'package:travelapp/widgets/AppText.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

var images = {
  "balloning.png": "balloning",
  "hiking.png": "hiking",
  "snorkling.png": "snorkling",
  "kayaking.png": "kayaking",
};

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.2))),
                    child: Image.asset('img/snorkling.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: AppLargeText(text: 'Discover'),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(left: 11, right: 30),
                    indicator:
                        CircularIndicator(color: Colors.black, radius: 3),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(
                        text: 'Places',
                      ),
                      Tab(
                        text: 'Inspiration',
                      ),
                      Tab(
                        text: 'Emotions',
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150,
                          // height: 100,

                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('img/mountain.jpeg')),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      );
                    },
                  ),
                  Container(),
                  Container(),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    color: Colors.black,
                    text: 'Explore More',
                    size: 18,
                  ),
                  AppText(
                    color: Colors.black,
                    text: 'See All',
                    size: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.maxFinite,
              height: 70,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                // ignore: prefer_interpolation_to_compose_strings
                                image: AssetImage(
                                    "img/" + images.keys.elementAt(index)),
                              ),
                              // color: Colors.amber,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        AppText(
                          text: images.values.elementAt(index),
                          size: 15,
                          color: Colors.black54,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularIndicator extends Decoration {
  final Color color;
  double radius;

  CircularIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return DrawCircle(color: color, radius: radius);
  }
}

class DrawCircle extends BoxPainter {
  final Color color;
  double radius;

  DrawCircle({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;

    Offset cicleOffset = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + cicleOffset, radius, _paint);
  }
}
