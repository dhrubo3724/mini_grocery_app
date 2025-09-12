import 'package:flutter/material.dart';
import 'package:grocery/models/cart_model.dart';
import 'package:provider/provider.dart';

import '../widget/grocery_item_card.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //logo
              Text('Good morning'),
              SizedBox(height: 20),

              Text(
                'Let\'s order fresh items for you',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),

              Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      itemCount: value.items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return GroceryItemCard(
                          itemName: value.items[index][0],
                          itemPrice: value.items[index][1],
                          itemImage: value.items[index][2],
                          Color: value.items[index][3],
                          onPressed: () {
                            Provider.of<CartModel>(
                              context,
                              listen: false,
                            ).addItemToCart(index);
                            // Provider.of<CartModel>(context, listen: false)
                            //     .addItemToCart(index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //go to cart page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => CartPage()),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag, color: Colors.white),
      ),
    );
  }
}
