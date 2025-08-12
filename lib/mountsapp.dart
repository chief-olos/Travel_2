import 'package:flutter/material.dart';

// =========================
// Global Constants
// =========================
final Color mainColor = const Color(0xFFFF5656);
// Colors.grey[800]
const Color _lightGrey = Color(0xFFBDBDBD); // Colors.grey
// Colors.grey.withOpacity(0.2)
const Color _softShadow = Color.fromRGBO(0, 0, 0, 0.1);      // Colors.black.withOpacity(0.1)
const Color _gradientOverlay = Color.fromRGBO(0, 0, 0, 0.7); // Colors.black.withOpacity(0.7)

// =========================
// Data Models
// =========================
class MountModel {
  final String path;
  final String name;
  final String location;
  final String description;

  MountModel({
    required this.path,
    required this.name,
    required this.location,
    required this.description,
  });
}

class CategoryModel {
  final String category;
  final IconData? icon;

  CategoryModel({required this.category, this.icon});
}

class AppBottomBarItem {
  final IconData? icon;
  final String label;
  bool isSelected;

  AppBottomBarItem({
    this.icon,
    required this.label,
    this.isSelected = false,
  });
}

// =========================
// Data Lists
// =========================
final List<MountModel> mountItems = [
  MountModel(
    path: '  https://sa.kapamilya.com/absnews/abscbnnews/media/2021/afp/01/17/20210116-mt-semeru-indonesia-ash-afp-s.jpg  ',
    name: 'Mount Semeru',
    location: 'East Java',
    description: 'Semeru is an active volcano in East Java, Indonesia. It is the highest mountain on the island of Java.',
  ),
  MountModel(
    path: 'https://media-cdn.tripadvisor.com/media/photo-s/04/a5/6f/ce/dsc-5622jpg.jpg  ',
    name: 'Mount Merbabu',
    location: 'Central Java',
    description: 'A dormant stratovolcano in Central Java, known as the "Mountain of Ash".',
  ),
  MountModel(
    path: 'https://cdn.dlmag.com/wp-content/uploads/2019/07/maunaloa1.jpg  ',
    name: 'Mauna Loa',
    location: 'Hawaii',
    description: 'One of the largest shield volcanoes on Earth, located in Hawaii.',
  ),
  MountModel(
    path: 'https://cdn.images.express.co.uk/img/dynamic/78/590x/mount-vesuvius-1100807.jpg  ',
    name: 'Mount Vesuvius',
    location: 'Italy',
    description: 'Famous for destroying Pompeii in 79 AD, located near Naples.',
  ),
  MountModel(
    path: 'https://upload.wikimedia.org/wikipedia/commons/0/04/PopoAmeca2zoom.jpg  ',
    name: 'Mount Popocatépetl',
    location: 'Mexico',
    description: 'An active volcano near Mexico City, one of the most active in North America.',
  ),
];

final List<CategoryModel> categories = [
  CategoryModel(category: 'Mountain', icon: Icons.terrain),
  CategoryModel(category: 'Forest', icon: Icons.park),
  CategoryModel(category: 'Beach', icon: Icons.beach_access),
  CategoryModel(category: 'Hiking', icon: Icons.directions_walk),
];

// =========================
// Main App Entry
// =========================
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    ),
  );
}

// =========================
// Splash Screen
// =========================
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MountsApp()),
      );
    });

    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Icon(Icons.terrain, color: Colors.white, size: 90),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =========================
// Main Home Page
// =========================
class MountsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Icon(Icons.terrain, color: mainColor, size: 40),
        ),
        actions: const [SizedBox(width: 40, height: 40)],
        iconTheme: IconThemeData(color: mainColor),
      ),
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(),
          const AppSearch(),
          Expanded(child: AppMountListView()),
          AppCategoryList(),
          AppBottomBar(),
        ],
      ),
    );
  }
}

// =========================
// App Header Widget
// =========================
class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              'https://avatars.githubusercontent.com/u/5081804?v=4',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Roman',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Good Morning',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =========================
// Search Widget
// =========================
class AppSearch extends StatelessWidget {
  const AppSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey[600]),
                      const SizedBox(width: 10),
                      Text(
                        'Search mountains...',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =========================
// Mountain List View
// =========================
class AppMountListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mountItems.length,
      itemBuilder: (context, index) {
        final mount = mountItems[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailsPage(mount)),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(mount.path.trim()),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Gradient overlay for text readability
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // Text content
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mount.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mount.location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// =========================
// Category List Widget
// =========================
class AppCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'See More',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: _lightGrey, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(category.icon, size: 24, color: mainColor),
                      const SizedBox(height: 4),
                      Text(
                        category.category,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// =========================
// Bottom Navigation Bar
// =========================
class AppBottomBar extends StatefulWidget {
  @override
  AppBottomBarState createState() => AppBottomBarState();
}

class AppBottomBarState extends State<AppBottomBar> {
  final List<AppBottomBarItem> barItems = [
    AppBottomBarItem(icon: Icons.home, label: 'Home', isSelected: true),
    AppBottomBarItem(icon: Icons.explore, label: 'Explore', isSelected: false),
    AppBottomBarItem(icon: Icons.turned_in_not, label: 'Tag', isSelected: false),
    AppBottomBarItem(icon: Icons.person_outline, label: 'Profile', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: _softShadow,
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: barItems.map((item) {
          Widget barItem;
          if (item.isSelected) {
            barItem = Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(item.icon, color: Colors.white),
                  const SizedBox(width: 5),
                  Text(item.label, style: const TextStyle(color: Colors.white)),
                ],
              ),
            );
          } else {
            barItem = IconButton(
              icon: Icon(item.icon, color: Colors.grey),
              onPressed: () {
                setState(() {
                  barItems.forEach((i) => i.isSelected = i == item);
                });
              },
            );
          }
          return barItem;
        }).toList(),
      ),
    );
  }
}

// =========================
// Details Page
// =========================
class DetailsPage extends StatelessWidget {
  final MountModel mount;

  const DetailsPage(this.mount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Stack(
                children: [
                  // Background Image
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(mount.path.trim()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Gradient Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, _gradientOverlay],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  // Title Text
                  const Positioned(
                    bottom: 30,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mount Semeru',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'East Java',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  // App Bar
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconTheme: const IconThemeData(color: Colors.white),
                    title: const Center(
                      child: Icon(Icons.terrain, color: Colors.white, size: 40),
                    ),
                    actions: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(Icons.pending, color: Colors.white, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsRatingBar(),
                  const SizedBox(height: 20),
                  const Text(
                    'About Mount Semeru',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Semeru is an active volcano in East Java, Indonesia. It is the highest mountain on the island of Java and part of the Pacific Ring of Fire.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  DetailsBottomActions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =========================
// Rating Bar Widget
// =========================
class DetailsRatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> ratings = {'Rating': '4.6', 'Price': '\$12', 'Open': '24hrs'};

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ratings.entries.map((entry) {
        return Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: _lightGrey, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                entry.key,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                entry.value,
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// =========================
// Bottom Actions Widget
// =========================
class DetailsBottomActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            borderRadius: BorderRadius.circular(15),
            color: mainColor,
            child: InkWell(
              // ignore: deprecated_member_use
              splashColor: Colors.white.withOpacity(0.2),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(21),
                child: const Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: mainColor, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(Icons.turned_in_not, color: mainColor, size: 25),
        ),
      ],
    );
  }
}

// =========================
// App Drawer
// =========================
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: mainColor),
            child: Row(
              children: [
                Icon(Icons.terrain, color: Colors.white, size: 60),
                const SizedBox(width: 10),
                Text(
                  'Mounts\nof the World',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: mainColor),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: const Text('Favorites'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.explore, color: mainColor),
            title: const Text('Explore'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Exploring...')),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.grey),
            title: const Text('Close'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}