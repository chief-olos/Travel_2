import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16), // ✅ Left & Right Padding (no top/bottom)
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ Space between text and icon
            children: [
              // Title Text
              RichText(
                text: TextSpan(
                  text: 'Find Your\nFavourite Destination',
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color(0xff543319), // ✅ Fixed color syntax
                  ),
                ),
              ),

              // Notification Icon Button
              IconButton(
                onPressed: () {
                  // Add action later (e.g., show notifications)
                },
                icon: SvgPicture.asset(
                  'assets/icons/bell.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),

          // ✅ Optional: Add vertical space below the row
          const SizedBox(height: 16),

          // Placeholder for other content
          // Example: Text('More content goes here...'),
        ],
      ),
    );
  }
}