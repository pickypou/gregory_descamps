import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void showImageCarousel(
  BuildContext context,
  List<String> imageList,
  int index,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final Size screenSize = MediaQuery.of(context).size;
      final double carouselWidth = screenSize.width * 0.9;
      final double carouselHeight = screenSize.height * 0.9;
      final double carouselSize =
          carouselWidth < carouselHeight * 16 / 9
              ? carouselWidth
              : carouselHeight * 16 / 9;

      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withValues(alpha: 128),
              ), // Correction ici
            ),
            Center(
              child: SizedBox(
                width: carouselSize,
                height: carouselSize * 9 / 16,
                child: CarouselSlider(
                  carouselController:
                      CarouselSliderController(), // Correction ici
                  options: CarouselOptions(
                    initialPage: index,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                  ),
                  items:
                      imageList.map((img) {
                        return Hero(
                          tag: "image_${imageList.indexOf(img)}",
                          child: Container(
                            width: carouselSize,
                            height: carouselSize * 9 / 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(img),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
            // Bouton de navigation précédent

            // Bouton de fermeture
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      );
    },
  );
}
