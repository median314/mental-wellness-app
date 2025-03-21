import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/letters/letters_home_page.dart';

class BannerCarouselWidget extends StatefulWidget {
  const BannerCarouselWidget({super.key});

  @override
  State<BannerCarouselWidget> createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140, // Fixed height for the carousel
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            // This makes the carousel snap to each page
            physics: const ClampingScrollPhysics(),
            children: [
              _buildBannerItem(context, 'Dear Myself', 'Tulis pesan untuk dirimu sendiri. Belajar refleksi diri untuk hidup lebih baik'),
              _buildBannerItem(context, 'Gratitude', 'Tulis apa yang kamu syukuri hari ini, belajar untuk hidup lebih bersyukur'),
              _buildBannerItem(context, 'Analytics', 'Tulis pesan untuk dirimu sendiri. Belajar refleksi diri untuk hidup lebih baik'),
              // Add more banners as needed
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Optional: Page indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicator(),
        ),
      ],
    );
  }

  Widget _buildBannerItem(BuildContext context, String title, String description) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/capy_duck.png', width: 100),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Nunito', 
                    fontWeight: FontWeight.w700, 
                    fontSize: 14
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Nunito', 
                    fontWeight: FontWeight.w600, 
                    fontSize: 11
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TextColor.primary,
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      )
                    ),
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) {
                            return const LettersHomePage();
                          }
                        )
                      );
                    }, 
                    child: const Text(
                      'Lihat', 
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    const int pageCount = 3; // Update this based on how many banners you have
    
    for (int i = 0; i < pageCount; i++) {
      indicators.add(
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i 
                ? TextColor.primary 
                : Colors.grey.shade300,
          ),
        ),
      );
    }
    
    return indicators;
  }
}