import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _selectedFilterIndex = 0;
  TextEditingController _searchController = TextEditingController();

  final List<String> _filterTabs = ['Most Viewed', 'Nearby', 'Latest'];

  final List<Map<String, dynamic>> _places = [
    {
      'name': 'Eiffel Tower, Paris',
      'location': 'Paris',
      'rating': 4.8,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReoSIw3wbEXO273w6H2WD_l_U1zc-rRpKfDw&s',
    },
    {
      'name': 'Seoul, Korea',
      'location': 'South Korea',
      'rating': 4.6,
      'image': 'https://transcode-v2.app.engoo.com/image/fetch/f_auto,c_lfill,w_300,dpr_3/https://assets.app.engoo.com/images/3BoY3mrOBOcDNIEl3Nmb8W.jpeg',
    }
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: _currentIndex == 0 ? _buildHomeContent() : _buildOtherScreens(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 30),
          _buildSearchBar(),
          SizedBox(height: 30),
          _buildPopularPlacesHeader(),
          SizedBox(height: 20),
          _buildFilterTabs(),
          SizedBox(height: 20),
          _buildPlacesList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Jin 👋',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E3A47),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Explore the world',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8A9BA8),
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'data:image/jpeg;base64,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',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search places',
          hintStyle: TextStyle(
            color: Color(0xFF8A9BA8),
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xFF8A9BA8),
            size: 22,
          ),
          suffixIcon: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF4A90E2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.tune,
              color: Colors.white,
              size: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildPopularPlacesHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular places',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E3A47),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Handle view all tap
          },
          child: Text(
            'View all',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF4A90E2),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterTabs() {
    return Row(
      children: _filterTabs.asMap().entries.map((entry) {
        int index = entry.key;
        String tab = entry.value;
        bool isSelected = index == _selectedFilterIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedFilterIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 15),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFF2E3A47) : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              tab,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF8A9BA8),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPlacesList() {
    return Row(
      children: _places.map((place) => _buildPlaceCard(place)).toList(),
    );
  }

  Widget _buildPlaceCard(Map<String, dynamic> place) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(place['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Color(0xFF2E3A47),
                      size: 20,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  right: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white70,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            place['location'],
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            place['rating'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF4A90E2),
          unselectedItemColor: Color(0xFF8A9BA8),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _currentIndex == 0 ? Color(0xFF4A90E2).withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.home_outlined),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _currentIndex == 1 ? Color(0xFF4A90E2).withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.access_time),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _currentIndex == 2 ? Color(0xFF4A90E2).withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.favorite_outline),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _currentIndex == 3 ? Color(0xFF4A90E2).withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.person_outline),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherScreens() {
    return Center(
      child: Text(
        'Screen ${_currentIndex + 1}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2E3A47),
        ),
      ),
    );
  }
}
