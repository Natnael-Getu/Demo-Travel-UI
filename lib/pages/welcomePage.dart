import 'package:flutter/material.dart';
import 'package:travelapp/widgets/AppLarge_text.dart';
import 'package:travelapp/widgets/AppText.dart';
import 'package:travelapp/widgets/responsiveButton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // ignore: prefer_interpolation_to_compose_strings
                  image: AssetImage("img/" + images[index]),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 100, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: 'Trips'),
                        AppText(
                          text: 'Mountain',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 190,
                          child: AppText(
                              size: 15,
                              text:
                                  'Mountain hikes give you an incredible sense of freedom along with endurace test.'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ResponsiveButton()
                      ],
                    ),
                    Column(
                        children: List.generate(3, (sliderindex) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: Container(
                          width: 5,
                          height: index == sliderindex ? 15 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == sliderindex
                                  ? Colors.blueAccent
                                  : Colors.grey[300]),
                        ),
                      );
                    }))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
