import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pikbil_rentcar/config/app_asset.dart';
import 'package:pikbil_rentcar/config/app_color.dart';
import 'package:pikbil_rentcar/indicator_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                header(),
                const SizedBox(
                  height: 20,
                ),
                CarouselPromo(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "New year 2024 25% off promo",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primary,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IndicatorCarousel(
                    controller: _controller,
                    current: _current,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top vehicle",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary),
                    ),
                    Text(
                      "See all",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textSecondary),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 400, // Atur tinggi sesuai kebutuhan
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      carCard(),
                      SizedBox(width: 16),
                      carCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container carCard() {
    return Container(
      width: 250,
      height: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              AppAsset.car1,
              width: 220,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Honda City - 2019",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColor.textPrimary,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "4.5",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textPrimary,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "(124 Review)",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Rp 450.000",
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF103F74)),
            ),
          )
        ],
      ),
    );
  }

  CarouselSlider CarouselPromo() {
    return CarouselSlider(
      items: [
        AppAsset.car1,
        AppAsset.car2,
        AppAsset.car3,
      ].map((i) {
        // Return the result of the Builder function
        return Builder(builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                i,
                fit: BoxFit.fill,
              ),
            ),
          );
        });
      }).toList(),
      options: CarouselOptions(
        height: 210,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  Row header() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Location",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textSecondary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Bandung, Indonesia",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textPrimary,
                ),
              ),
            ],
          ),
        ),
        const Row(
          children: [
            Icon(
              Icons.search_rounded,
              size: 24,
              color: AppColor.primary,
            ),
            SizedBox(width: 16),
            Icon(
              Icons.notifications_none_outlined,
              size: 24,
              color: AppColor.primary,
            ),
          ],
        ),
      ],
    );
  }
}
