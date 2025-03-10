import 'package:flutter/material.dart';
import 'package:gregory_descamps/theme.dart';
import 'package:gregory_descamps/ui/protfolio/show_image_carousel.dart';

import '../common/custom_appbar.dart';
import '../common/footer.dart';

class Portfolio extends StatelessWidget {
  final List<List<String>> imageLists = [
    ["assets/images/chantiers/img_1.jpg", "assets/images/chantiers/img_2.jpg", "assets/images/chantiers/img_3.jpg", "assets/images/chantiers/img_4.jpg"],
    ["assets/images/chantiers/img_5.jpg", "assets/images/chantiers/img_6.jpg", "assets/images/chantiers/img_7.jpg", "assets/images/chantiers/img_8.jpg"],
  ];

  Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      drawer: MediaQuery.of(context).size.width <= 750 ? const CustomDrawer() : null,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('Mes Réalisations', style: titleStyleMedium(context), textAlign: TextAlign.center),
                  const SizedBox(height: 35),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: imageLists.map((imageList) => _buildImageItem(context, imageList)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }

  Widget _buildImageItem(BuildContext context, List<String> images) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth > 600 ? (constraints.maxWidth - 20) / 2 : constraints.maxWidth;
        return GestureDetector(
          onTap: () => showImageCarousel(context, images, 0),
          child: Hero(
            tag: "carousel_${imageLists.indexOf(images)}",
            child: Container(
              width: width,
              height: width * 9 / 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(images[0]), fit: BoxFit.cover),
              ),
            ),
          ),
        );
      },
    );
  }
}


