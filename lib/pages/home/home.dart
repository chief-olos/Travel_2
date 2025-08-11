import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 28),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // layout widget
              children: [
                // takes up children since it takes up multiple items
                RichText(
                  text: TextSpan(
                    text: 'Find your\nfavorite place ',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 228, 228, 228),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(24),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/bell.svg",
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // second part of the column: search section
          Padding(
            padding: EdgeInsetsGeometry.only(left: 16, right: 16),
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth * 2 / 3,
                  child: SearchAnchor(
                    builder: (
                      BuildContext context,
                      SearchController controller,
                    ) {
                      return SearchBar(
                        controller: controller,
                        padding: const WidgetStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),
                        trailing: <Widget>[
                          Tooltip(
                            message: 'Change brightness mode',
                            child: IconButton(
                              // isSelected: isDark,
                              onPressed: () {
                                setState(() {
                                  // isDark = !isDark;
                                });
                              },
                              icon: const Icon(Icons.wb_sunny_outlined),
                              selectedIcon: const Icon(
                                Icons.brightness_2_outlined,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    suggestionsBuilder: (
                      BuildContext context,
                      SearchController controller,
                    ) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      });
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 228, 228, 228),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(24),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/filter_icon.svg",
                      width: 28,
                      height: 28,
                      color: Color(0xff7f7e7e),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}