import 'package:aplikasi_makanan/add.dart';
import 'package:aplikasi_makanan/kartpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Variabel statis untuk memastikan Splash Screen hanya muncul sekali
  static bool isFirstLaunch = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Tetapkan halaman awal berdasarkan kondisi isFirstLaunch
      home: isFirstLaunch ? SplashScreen() : MyAppMain(),
    );
  }
}

class MyAppMain extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyAppMain> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    CartPage(),
    AddDataPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: _children[_currentIndex],
        bottomNavigationBar: _currentIndex == 0 
            ? BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    label: 'Add',
                  ),
                ],
              )
            : null, 
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: ElevatedButton(
              onPressed: () {
                print('Button profile ditekan');
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                backgroundColor: Colors.white,
                elevation: 5,
              ),
              child: Icon(Icons.person),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: ElevatedButton(
              onPressed: () {
                print('Button menu ditekan');
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                backgroundColor: Colors.white,
                elevation: 5,
              ),
              child: Icon(Icons.menu),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildFoodButton(
                      imageUrl:
                          'https://s3-alpha-sig.figma.com/img/79ec/0a3c/599e7e8a2a79a6e7a4f0dc9173b27282?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ccF5PGQme45ThVdSrBffB3Kdxnf3p~PzmGyCXTqM0jGuj4Cv~ub8KEFfn0y7qtsiYcbddbKzf594xmWmhYIVoNNHziI-hghMB02c0GAlYhiArHSbP9ieWlUdn11kjR6~dbtRf0L8BR0m5RNhmbUW-P9WgQ5kbPAtT5JlbicX9k-BPBZeg0Jo3Snk4TvpPjmN2s4msoJArs2Gp~jkS88C5vKE59nTI-laWIGpXCkNhiBXHrarKd1H3MC5Jdc2MYf6IhxSIXnUz9ojN6e8cCBpWALsueM3TE2FEMK0eND8Ekbe4oGwygFsS8ewwkx4lPsh--AD3Nsw3eXGLt771STRYw__',
                      label: 'All',
                      onPressed: () {
                        print('Button 1 ditekan');
                      },
                      backgroundColor: Color(0xFF3748E4),
                    ),
                    SizedBox(width: 40),
                    buildFoodButton(
                      imageUrl:
                          'https://s3-alpha-sig.figma.com/img/79ec/0a3c/599e7e8a2a79a6e7a4f0dc9173b27282?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ccF5PGQme45ThVdSrBffB3Kdxnf3p~PzmGyCXTqM0jGuj4Cv~ub8KEFfn0y7qtsiYcbddbKzf594xmWmhYIVoNNHziI-hghMB02c0GAlYhiArHSbP9ieWlUdn11kjR6~dbtRf0L8BR0m5RNhmbUW-P9WgQ5kbPAtT5JlbicX9k-BPBZeg0Jo3Snk4TvpPjmN2s4msoJArs2Gp~jkS88C5vKE59nTI-laWIGpXCkNhiBXHrarKd1H3MC5Jdc2MYf6IhxSIXnUz9ojN6e8cCBpWALsueM3TE2FEMK0eND8Ekbe4oGwygFsS8ewwkx4lPsh--AD3Nsw3eXGLt771STRYw__',
                      label: 'Makanan',
                      onPressed: () {
                        print('Button 2 ditekan');
                      },
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 40),
                    buildFoodButton(
                      imageUrl:
                          'https://s3-alpha-sig.figma.com/img/f175/2044/627b328a606326f488a5c5fafdc4c8cc?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Zetb1OVwKrb4Unhuc9Q5zQkap6hjOrEzV9iF7ybka0zUC61DVr4n9UDsonT8nED~jJuBLx5Ct6NxuIM~Apibc2VANyZcdW3LYH8xxrfxhyIHLSstuyKLcNpYsnTbAF-LWxWR03CwqTpkz6CPL6kMzXb2-9pqoiXO7vMXJ1c0Hud1yWU5BSAnzi10st9NZZREHikRFFMGbcYiS7MZv6s-~UhWKeNa0Htz7RmyQc76lx6vb9PZhbqdOIMwOFm-IPwrL8BGI918M9FhKlzyy5aUMNxDHRDiDmyTo4bl6SQngUgL55yZWpOOBmnkuIMkYNkGDmIDz9pZ4qLcd12FnYgVGw__',
                      label: 'Minuman',
                      onPressed: () {
                        print('Button 3 ditekan');
                      },
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'All Food',
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildCompactFoodCard(
                              imageUrl:
                                  'https://s3-alpha-sig.figma.com/img/79ec/0a3c/599e7e8a2a79a6e7a4f0dc9173b27282?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ccF5PGQme45ThVdSrBffB3Kdxnf3p~PzmGyCXTqM0jGuj4Cv~ub8KEFfn0y7qtsiYcbddbKzf594xmWmhYIVoNNHziI-hghMB02c0GAlYhiArHSbP9ieWlUdn11kjR6~dbtRf0L8BR0m5RNhmbUW-P9WgQ5kbPAtT5JlbicX9k-BPBZeg0Jo3Snk4TvpPjmN2s4msoJArs2Gp~jkS88C5vKE59nTI-laWIGpXCkNhiBXHrarKd1H3MC5Jdc2MYf6IhxSIXnUz9ojN6e8cCBpWALsueM3TE2FEMK0eND8Ekbe4oGwygFsS8ewwkx4lPsh--AD3Nsw3eXGLt771STRYw__',
                              title: 'Burger King Medium',
                              price: 'Rp 50.000',
                            ),
                            buildCompactFoodCard(
                              imageUrl:
                                  'https://s3-alpha-sig.figma.com/img/79ec/0a3c/599e7e8a2a79a6e7a4f0dc9173b27282?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ccF5PGQme45ThVdSrBffB3Kdxnf3p~PzmGyCXTqM0jGuj4Cv~ub8KEFfn0y7qtsiYcbddbKzf594xmWmhYIVoNNHziI-hghMB02c0GAlYhiArHSbP9ieWlUdn11kjR6~dbtRf0L8BR0m5RNhmbUW-P9WgQ5kbPAtT5JlbicX9k-BPBZeg0Jo3Snk4TvpPjmN2s4msoJArs2Gp~jkS88C5vKE59nTI-laWIGpXCkNhiBXHrarKd1H3MC5Jdc2MYf6IhxSIXnUz9ojN6e8cCBpWALsueM3TE2FEMK0eND8Ekbe4oGwygFsS8ewwkx4lPsh--AD3Nsw3eXGLt771STRYw__',
                              title: 'Burger King Medium',
                              price: 'Rp 50.000',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildCompactFoodCard(
                              imageUrl:
                                  'https://s3-alpha-sig.figma.com/img/f175/2044/627b328a606326f488a5c5fafdc4c8cc?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Zetb1OVwKrb4Unhuc9Q5zQkap6hjOrEzV9iF7ybka0zUC61DVr4n9UDsonT8nED~jJuBLx5Ct6NxuIM~Apibc2VANyZcdW3LYH8xxrfxhyIHLSstuyKLcNpYsnTbAF-LWxWR03CwqTpkz6CPL6kMzXb2-9pqoiXO7vMXJ1c0Hud1yWU5BSAnzi10st9NZZREHikRFFMGbcYiS7MZv6s-~UhWKeNa0Htz7RmyQc76lx6vb9PZhbqdOIMwOFm-IPwrL8BGI918M9FhKlzyy5aUMNxDHRDiDmyTo4bl6SQngUgL55yZWpOOBmnkuIMkYNkGDmIDz9pZ4qLcd12FnYgVGw__',
                              title: 'Teh botol',
                              price: 'Rp 15.000',
                            ),
                            buildCompactFoodCard(
                              imageUrl:
                                  'https://s3-alpha-sig.figma.com/img/f175/2044/627b328a606326f488a5c5fafdc4c8cc?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Zetb1OVwKrb4Unhuc9Q5zQkap6hjOrEzV9iF7ybka0zUC61DVr4n9UDsonT8nED~jJuBLx5Ct6NxuIM~Apibc2VANyZcdW3LYH8xxrfxhyIHLSstuyKLcNpYsnTbAF-LWxWR03CwqTpkz6CPL6kMzXb2-9pqoiXO7vMXJ1c0Hud1yWU5BSAnzi10st9NZZREHikRFFMGbcYiS7MZv6s-~UhWKeNa0Htz7RmyQc76lx6vb9PZhbqdOIMwOFm-IPwrL8BGI918M9FhKlzyy5aUMNxDHRDiDmyTo4bl6SQngUgL55yZWpOOBmnkuIMkYNkGDmIDz9pZ4qLcd12FnYgVGw__',
                              title: 'Teh botol',
                              price: 'Rp 15.000',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildCompactFoodCard(
                              imageUrl:
                                  'https://s3-alpha-sig.figma.com/img/f175/2044/627b328a606326f488a5c5fafdc4c8cc?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Zetb1OVwKrb4Unhuc9Q5zQkap6hjOrEzV9iF7ybka0zUC61DVr4n9UDsonT8nED~jJuBLx5Ct6NxuIM~Apibc2VANyZcdW3LYH8xxrfxhyIHLSstuyKLcNpYsnTbAF-LWxWR03CwqTpkz6CPL6kMzXb2-9pqoiXO7vMXJ1c0Hud1yWU5BSAnzi10st9NZZREHikRFFMGbcYiS7MZv6s-~UhWKeNa0Htz7RmyQc76lx6vb9PZhbqdOIMwOFm-IPwrL8BGI918M9FhKlzyy5aUMNxDHRDiDmyTo4bl6SQngUgL55yZWpOOBmnkuIMkYNkGDmIDz9pZ4qLcd12FnYgVGw__',
                              title: 'Teh botol',
                              price: 'Rp 15.000',
                            ),
                            buildCompactFoodCard(
                              imageUrl:
                                  'https://s3-alpha-sig.figma.com/img/f175/2044/627b328a606326f488a5c5fafdc4c8cc?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Zetb1OVwKrb4Unhuc9Q5zQkap6hjOrEzV9iF7ybka0zUC61DVr4n9UDsonT8nED~jJuBLx5Ct6NxuIM~Apibc2VANyZcdW3LYH8xxrfxhyIHLSstuyKLcNpYsnTbAF-LWxWR03CwqTpkz6CPL6kMzXb2-9pqoiXO7vMXJ1c0Hud1yWU5BSAnzi10st9NZZREHikRFFMGbcYiS7MZv6s-~UhWKeNa0Htz7RmyQc76lx6vb9PZhbqdOIMwOFm-IPwrL8BGI918M9FhKlzyy5aUMNxDHRDiDmyTo4bl6SQngUgL55yZWpOOBmnkuIMkYNkGDmIDz9pZ4qLcd12FnYgVGw__',
                              title: 'Teh botol',
                              price: 'Rp 15.000',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildFoodButton({
  required String imageUrl,
  required String label,
  required VoidCallback onPressed,
  required Color backgroundColor,
}) {
  return Column(
    children: [
      SizedBox(
        width: 70,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(7),
            elevation: 5,
            backgroundColor: backgroundColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(
          label,
          style: GoogleFonts.poppins(),
        ),
      ),
    ],
  );
}

Widget buildCompactFoodCard({
  required String imageUrl,
  required String title,
  required String price,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    child: Container(
      width: 160,
      height: 200,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 4),
              Text(
  title,
  textAlign: TextAlign.center,
  style: GoogleFonts.poppins(
    fontSize: 14, 
    fontWeight: FontWeight.bold,
  ),
)
,
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style:
                        GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Tombol Add ditekan');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(6),
                      backgroundColor: Color.fromARGB(255, 113, 228, 55),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
