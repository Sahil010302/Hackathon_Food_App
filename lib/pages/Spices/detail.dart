import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:userside/pages/cart.dart';

class DetailProduct extends StatelessWidget {
  String title;
  DetailProduct({required this.title});
  static const List<String> Redchilli = [
    "https://cdn.shopify.com/s/files/1/0604/6345/products/Red_Chilli_Powder.jpg?v=1514273566",
    "https://kj1bcdn.b-cdn.net/media/82514/red-chili-pepper-765.jpg",
    "https://www.couponmoto.com/top-10/wp-content/uploads/2023/05/Best-Red-Chilli-Powder.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 249, 249),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(fontFamily: "Heading"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.search_favorite,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: const Icon(
              CupertinoIcons.cart,
            ),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: CarouselSlider(
              // disableGesture: false,
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                height: 200,
              ),
              items: Redchilli.map(
                (item) => Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      item.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
          const SizedBox(),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10),
            child: Text(
              "Description",
              style: TextStyle(fontFamily: "Title", fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: const Text(
              "Experience the bold essence of our Black Pepper, the ultimate flavor enhancer for your kitchen adventures. With its intense kick and aromatic flair, it transforms any dish into a culinary masterpiece. Sprinkle it generously to elevate your meals with a burst of zesty flavor that leaves taste buds craving more. Loved by all and rated 4.5 stars, it's your go-to spice for adding that extra punch to every recipe.",
              style: TextStyle(fontFamily: "Local_Font", fontSize: 18),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Merchant : Sahil Dongre",
              style: TextStyle(fontFamily: "Title", fontSize: 20),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  "Price Details",
                  style: TextStyle(fontFamily: "Title", fontSize: 20),
                ),
              ),
              Spacer(),
              Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        "150 RS ",
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        "Per Kg ",
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              print("ADD");
            },
            child: Container(
              margin: EdgeInsets.all(20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red.shade700),
              child: const Center(
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(
                      fontFamily: "Title", fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
