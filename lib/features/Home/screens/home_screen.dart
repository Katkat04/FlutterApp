import 'package:flutter/material.dart';
import 'package:hello_world/shared/widgets/layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hello_world/features/Home/widgets/principal_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 0.0, left: 20.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NOVEDADES',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    side: const BorderSide(color: Colors.black, width: 0.4),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: const EdgeInsets.all(6),
                    minimumSize: const Size(0, 0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'COMPRAR NOVEDADES',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(width: 12),
                      SvgPicture.string(
                        '''<svg width="28" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M4 12H20M20 12L16 8M20 12L16 16" stroke="#000000" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>''',
                        width: 28,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PrincipalCarousel(),
          const SizedBox(height: 18),
          Image.asset('assets/Deporte.jpg'),
        ],
      ),
    ),
  );
  }
}
