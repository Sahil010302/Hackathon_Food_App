import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String imageUrl;
  int quantity;
  final double price;

  CartItem({
    required this.title,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
}

class Cart extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<Cart> {
  List<CartItem> _cartItems = [
    CartItem(
      title: 'Product 1',
      imageUrl:
          'https://arevafoodproducts.com/wp-content/uploads/2017/08/turmaric1.png',
      quantity: 1,
      price: 10.0,
    ),
    CartItem(
      title: 'Product 2',
      imageUrl:
          'https://4.imimg.com/data4/TJ/VN/MY-32099850/haldi-powder-500x500.jpg',
      quantity: 2,
      price: 15.0,
    ),
    // Add more items as needed
  ];

  double _calculateTotalPrice() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontFamily: "Title",
          ),
        ),
        centerTitle: true,
        leadingWidth: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length + 1, // +1 for total price row
              itemBuilder: (context, index) {
                if (index == _cartItems.length) {
                  // Total price row
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Total Price: \$${_calculateTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Title"),
                    ),
                  );
                }

                final item = _cartItems[index];

                return Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: ListTile(
                    leading: Image.network(item.imageUrl),
                    title: Text(
                      item.title,
                      style: const TextStyle(
                          fontFamily: "Title", color: Colors.white),
                    ),
                    subtitle: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (item.quantity > 1) {
                                item.quantity--;
                              }
                            });
                          },
                        ),
                        Text(
                          item.quantity.toString(),
                          style: const TextStyle(
                            fontFamily: "Title",
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          splashColor: Colors.grey,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            shadows: [Shadow(blurRadius: 2)],
                          ),
                          onPressed: () {
                            setState(() {
                              item.quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                _cartItems.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "BUY",
                  style: TextStyle(fontSize: 20, fontFamily: "Title"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
