import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/constants/list_constants.dart';

class CarousalComponent extends StatefulWidget {
  const CarousalComponent({super.key});

  @override
  State<CarousalComponent> createState() => _CarousalComponentState();
}

class _CarousalComponentState extends State<CarousalComponent> {

  List<Widget> imageList = ListConstants.carousal_list;

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            print(currentIndex);
          },
          child: CarouselSlider(
            carouselController: carouselController,
            items: imageList.map((e) => e).toList(),
            options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index,reason){
                  setState(() {
                    currentIndex = index;
                  });
                }
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((e){
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(e.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                            .withOpacity(currentIndex == e.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            )
        ),
      ],
    );
  }
}
