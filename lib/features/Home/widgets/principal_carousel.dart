import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrincipalCarousel extends StatefulWidget {
  @override
  _PrincipalCarouselState createState() => _PrincipalCarouselState();
}

class _PrincipalCarouselState extends State<PrincipalCarousel> {
  final CarouselSliderController buttonCarouselController = CarouselSliderController();
  int currentIndex = 0;
  double pageValue = 0.0;

  // Datos
  final List<SlideData> slideData = [
    SlideData(
      imageUrl: "https://picsum.photos/400/200",
      title: "ESTO ES RUNNING",
      subtitle: "",
      tag: "DESTACADO",
      button: "COMPRAR AHORA",
      buttonb:  "normal",
    ),
    SlideData(
      imageUrl: "https://picsum.photos/401/200",
      title: "Segunda Slide",
      subtitle: "Imagen del centro",
      tag: "ORIGINALS",
      button: "DESCUBRE MÁS",
      buttonb:  "normal",
    ),
    SlideData(
      imageUrl: "https://picsum.photos/402/200",
      title: "Tercera Slide",
      subtitle: "Otra imagen central",
      tag: "NUEVO",
      button: "VER MÁS",
      buttonb:  "normal",
    ),
    SlideData(
      imageUrl: "https://picsum.photos/403/200",
      title: "Última Slide",
      subtitle: "Esta es la última imagen",
      tag: "DESTACADO",
      button: "COMPRAR AHORA",
      buttonb:  "normal",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: [
            CarouselSlider.builder(
              itemCount: slideData.length,
              itemBuilder: (context, index, realIndex) {
                return _buildSlide(index);
              },
              options: CarouselOptions(
                autoPlay: false,
                height: 550,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                viewportFraction: 0.8,
                aspectRatio: 2.0,
                initialPage: 0,
                padEnds: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                onScrolled: (value) {
                  setState(() {
                    pageValue = value ?? 0.0;
                  });
                },
              ),
            ),
            _buildTextOverlay(),
          ],
        ),
      ],
    );
  }

  Widget _buildSlide(int index) {
    bool isFirst = index == 0;
    bool isLast = index == slideData.length - 1;
    bool isCenter = !isFirst && !isLast;

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        left: isFirst ? 20.0 : 0.0,
        right: isLast ? 20.0 : 0.0,
      ),
      child: Stack(
        children: [
          // Imagen
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              image: DecorationImage(
                image: NetworkImage(slideData[index].imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradiente
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                stops: [0.5, 1.0],
              ),
            ),
          ),
          // Etiqueta
          Positioned(
            top: 16,
            left: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                color: _getTagColor(slideData[index].tag),
                borderRadius: BorderRadius.zero,
              ),
              child: Text(
                slideData[index].tag,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          //Botón
          Positioned(
            bottom: 26,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.zero,
                ),
                child: TextButton(
                  onPressed: () => {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        slideData[index].button,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      //SizedBox(width: 90),
                      SvgPicture.string(
                        '''<svg width="28" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M4 12H20M20 12L16 8M20 12L16 16" stroke="#000000" stroke-width="0.5" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>''',
                        width: 44,
                        height: 40,
                      ),
                    ],
                  ),
              ),
            ),
          ),
          ),
          //BORDE BOTON
          Positioned(
            bottom: 25,
            right: 0,
            left: 10,
            child: Padding(
              padding: EdgeInsets.all(13),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
                child: Text(
                  slideData[index].button,
                  style: TextStyle(
                    height: 2.5,
                    color: Colors.transparent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextOverlay() {
    return Positioned.fill(
      child: Container(
        child: Stack(
          children: slideData.asMap().entries.map((entry) {
            int index = entry.key;
            SlideData data = entry.value;

            double offset = (index - pageValue) * 0.8;

            return AnimatedPositioned(
              duration: Duration(milliseconds: 100),
              bottom: 110,
              left: MediaQuery.of(context).size.width * 0.1 + (offset * MediaQuery.of(context).size.width * 0.8),
              right: -MediaQuery.of(context).size.width * 0.1 + (-offset * MediaQuery.of(context).size.width * 0.8),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: (index - pageValue).abs() < 0.5 ? 1.0 : 0.3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        data.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          height: 3
                        ),
                      ),
                    ),
                      SizedBox(height: 8),
                      Text(
                        data.subtitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Color _getTagColor(String tag) {
    switch (tag) {
      case 'DESTACADO':
        return Colors.black;
      case 'ORIGINALS':
        return Colors.black;
      case 'NUEVO':
        return Colors.black;
      default:
        return Colors.black;
    }
  }

}

class SlideData {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String tag;
  final String button;
  final String buttonb;

  SlideData({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.button,
    required this.buttonb,
  });
}