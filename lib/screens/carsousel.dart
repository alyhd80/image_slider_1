import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_slider/data/data.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

List<Widget> generateImagesTitles() {
  return AppData()
      .images
      .map(
        (element) => ClipRRect(
          child: Image.asset(
            element,
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      )
      .toList();
}

class _DestinationCarouselState extends State<DestinationCarousel> {

  int _current=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Stack(
          children: [
            CarouselSlider(
              items: generateImagesTitles(),
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 18 / 8,
                  onPageChanged: (index, other) {

                    setState(() {
                      _current=index;
                    });
                  }),
            ),
            AspectRatio(
              aspectRatio: 18 / 8,
              child: Center(
                child: Text(
                  AppData().places[_current],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 13,fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
