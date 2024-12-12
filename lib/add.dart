import 'package:flutter/material.dart';
import 'add_data.dart';

class AddDataPage extends StatefulWidget {
  @override
  _AddDataPageState createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Burger King Medium',
      'price': 'Rp.50.000,00',
      'imageUrl': 'https://s3-alpha-sig.figma.com/img/79ec/0a3c/599e7e8a2a79a6e7a4f0dc9173b27282?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ccF5PGQme45ThVdSrBffB3Kdxnf3p~PzmGyCXTqM0jGuj4Cv~ub8KEFfn0y7qtsiYcbddbKzf594xmWmhYIVoNNHziI-hghMB02c0GAlYhiArHSbP9ieWlUdn11kjR6~dbtRf0L8BR0m5RNhmbUW-P9WgQ5kbPAtT5JlbicX9k-BPBZeg0Jo3Snk4TvpPjmN2s4msoJArs2Gp~jkS88C5vKE59nTI-laWIGpXCkNhiBXHrarKd1H3MC5Jdc2MYf6IhxSIXnUz9ojN6e8cCBpWALsueM3TE2FEMK0eND8Ekbe4oGwygFsS8ewwkx4lPsh--AD3Nsw3eXGLt771STRYw__', // Correct image URL
    },
    {
      'name': 'Teh Botol',
      'price': 'Rp.4.000,00',
      'imageUrl': 'https://s3-alpha-sig.figma.com/img/f175/2044/627b328a606326f488a5c5fafdc4c8cc?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Zetb1OVwKrb4Unhuc9Q5zQkap6hjOrEzV9iF7ybka0zUC61DVr4n9UDsonT8nED~jJuBLx5Ct6NxuIM~Apibc2VANyZcdW3LYH8xxrfxhyIHLSstuyKLcNpYsnTbAF-LWxWR03CwqTpkz6CPL6kMzXb2-9pqoiXO7vMXJ1c0Hud1yWU5BSAnzi10st9NZZREHikRFFMGbcYiS7MZv6s-~UhWKeNa0Htz7RmyQc76lx6vb9PZhbqdOIMwOFm-IPwrL8BGI918M9FhKlzyy5aUMNxDHRDiDmyTo4bl6SQngUgL55yZWpOOBmnkuIMkYNkGDmIDz9pZ4qLcd12FnYgVGw__', // Correct image URL
    },
    // Add more items as needed
  ];

  void _deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Button to Add Data
          Padding(
  padding: const EdgeInsets.all(16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start, // Memposisikan tombol ke kiri
    children: [
      ElevatedButton.icon(
        onPressed: () async {
          // Navigate to Add New Data Page
          final newItem = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewDataPage()),
          );
          if (newItem != null) {
            setState(() {
              cartItems.add(newItem);
            });
          }
        },
        icon: Icon(Icons.add, color: Colors.white),
        label: Text('Add Data', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          backgroundColor: Colors.blue,
        ),
      ),
    ],
  ),
),

          // Table Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Foto', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Nama Produk', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Harga', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Aksi', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(),
          // List View of Cart Items
          Expanded(
  child: ListView.builder(
    itemCount: cartItems.length,
    itemBuilder: (context, index) {
      final item = cartItems[index];

      // Provide default values for null fields
      final imageUrl = item['imageUrl'] ?? 'https://example.com/default.jpg'; // Default image URL
      final name = item['name'] ?? 'No Name'; // Default name
      final price = item['price'] ?? 'Unknown Price'; // Default price

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Check for image URL and display accordingly
                Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Icon(Icons.error, size: 50);
                  },
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    price,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _deleteItem(index);
                  },
                ),
              ],
            ),
            Divider(),
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
