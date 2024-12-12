import 'package:flutter/material.dart';
import 'package:aplikasi_makanan/main.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Burger King Medium',
      'price': 50000,
      'imageUrl': 'https://s3-alpha-sig.figma.com/img/79ec/0a3c/599e7e8a2a79a6e7a4f0dc9173b27282?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ccF5PGQme45ThVdSrBffB3Kdxnf3p~PzmGyCXTqM0jGuj4Cv~ub8KEFfn0y7qtsiYcbddbKzf594xmWmhYIVoNNHziI-hghMB02c0GAlYhiArHSbP9ieWlUdn11kjR6~dbtRf0L8BR0m5RNhmbUW-P9WgQ5kbPAtT5JlbicX9k-BPBZeg0Jo3Snk4TvpPjmN2s4msoJArs2Gp~jkS88C5vKE59nTI-laWIGpXCkNhiBXHrarKd1H3MC5Jdc2MYf6IhxSIXnUz9ojN6e8cCBpWALsueM3TE2FEMK0eND8Ekbe4oGwygFsS8ewwkx4lPsh--AD3Nsw3eXGLt771STRYw__',
      'quantity': 1,
    },
    {
      'name': 'Teh botol',
      'price': 4000,
      'imageUrl': 'https://s3-alpha-sig.figma.com/img/f175/2044/627b328a606326f488a5c5fafdc4c8cc?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Zetb1OVwKrb4Unhuc9Q5zQkap6hjOrEzV9iF7ybka0zUC61DVr4n9UDsonT8nED~jJuBLx5Ct6NxuIM~Apibc2VANyZcdW3LYH8xxrfxhyIHLSstuyKLcNpYsnTbAF-LWxWR03CwqTpkz6CPL6kMzXb2-9pqoiXO7vMXJ1c0Hud1yWU5BSAnzi10st9NZZREHikRFFMGbcYiS7MZv6s-~UhWKeNa0Htz7RmyQc76lx6vb9PZhbqdOIMwOFm-IPwrL8BGI918M9FhKlzyy5aUMNxDHRDiDmyTo4bl6SQngUgL55yZWpOOBmnkuIMkYNkGDmIDz9pZ4qLcd12FnYgVGw__',
      'quantity': 2,
    },
    {
      'name': 'Burger King Small',
      'price': 35000,
      'imageUrl': 'https://s3-alpha-sig.figma.com/img/79ec/0a3c/599e7e8a2a79a6e7a4f0dc9173b27282?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ccF5PGQme45ThVdSrBffB3Kdxnf3p~PzmGyCXTqM0jGuj4Cv~ub8KEFfn0y7qtsiYcbddbKzf594xmWmhYIVoNNHziI-hghMB02c0GAlYhiArHSbP9ieWlUdn11kjR6~dbtRf0L8BR0m5RNhmbUW-P9WgQ5kbPAtT5JlbicX9k-BPBZeg0Jo3Snk4TvpPjmN2s4msoJArs2Gp~jkS88C5vKE59nTI-laWIGpXCkNhiBXHrarKd1H3MC5Jdc2MYf6IhxSIXnUz9ojN6e8cCBpWALsueM3TE2FEMK0eND8Ekbe4oGwygFsS8ewwkx4lPsh--AD3Nsw3eXGLt771STRYw__',
      'quantity': 1,
    },
  ];

 int getTotalPrice() {
  return cartItems.fold(0, (total, item) {
    return total + (item['price'] as int) * (item['quantity'] as int);
  });
}


  @override
  void initState() {
    super.initState();
  }

  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = getTotalPrice();
    int ppn = (totalPrice * 0.11).toInt();
    int totalPembayaran = totalPrice + ppn;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      backgroundColor: Colors.white,
                      elevation: 3,
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.red),
                  ),
                ),
              ),
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
                      elevation: 3,
                    ),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            item['imageUrl'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Rp ${item['price'] * item['quantity']},00',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => _decreaseQuantity(index),
                                    child: Text('-'),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(30, 30),
                                      padding: EdgeInsets.zero,
                                      shape: CircleBorder(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      item['quantity'].toString(),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => _increaseQuantity(index),
                                    child: Text('+'),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(30, 30),
                                      padding: EdgeInsets.zero,
                                      shape: CircleBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => _removeItem(index),
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('PPN 11%', style: TextStyle(fontSize: 16)),
                    Text('Rp $ppn,00', style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total belanja', style: TextStyle(fontSize: 16)),
                    Text('Rp $totalPrice,00', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp $totalPembayaran,00',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                    child: Text('Checkout', style: TextStyle(fontSize: 16, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
