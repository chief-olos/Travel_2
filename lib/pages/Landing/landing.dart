import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slider_button/slider_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background Image
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/island.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Bottom Blurred Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                child: Container(
                  color: Colors.black26,
                  height: 380,
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title
                      const _TitleText(),
                      const SizedBox(height: 16),

                      // Norway + Description
                      SizedBox(
                        width: screenWidth * 2 / 3,
                        child: const Column(
                          children: [
                            _NorwayText(),
                            SizedBox(height: 12),
                            _DescriptionText(),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Slider Button
                      _buildSliderButton(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderButton(BuildContext context) {
    return SliderButton(
      shimmer: false,
      height: 60,
      backgroundColor: const Color(0xff4c593b),
      buttonColor: const Color(0xff9bfe67),
      action: () async {
        // ✅ Now returns Future<bool?> (async + nullable)
        // Add navigation, analytics, etc.
        // Example: Navigator.push(context, MaterialPageRoute(builder: (_) => NextPage()));
        await Future.delayed(const Duration(milliseconds: 500)); // Simulate work
        return true; // Can return null too, if needed
      },
      label: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          const Text(
            "Explore Now",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          const SizedBox(width: 12),
          // ✅ Use colorFilter instead of deprecated 'color'
          SvgPicture.asset(
            "assets/icons/doubleArrow.svg",
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ],
      ),
      icon: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
    );
  }
}

// =================== Sub-Widgets ===================

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Unveil The \nTravel Wonders',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          letterSpacing: 0.1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _NorwayText extends StatelessWidget {
  const _NorwayText();

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'NORWAY',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          letterSpacing: 16,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText();

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Take the first step to an unforgettable journey',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}