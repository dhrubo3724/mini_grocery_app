import 'package:flutter/material.dart';
import 'package:grocery/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'), backgroundColor: Colors.green[100]),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.all(12),
                      child: ListTile(
                        leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            value.cartItems[index][2],
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Text(
                          value.cartItems[index][0],
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text('\$${value.cartItems[index][1]}'),
                        trailing: IconButton(
                          onPressed: () => Provider.of<CartModel>(
                            context,
                            listen: false,
                          ).removeItemFromCart(index),
                          icon: Icon(Icons.highlight_remove_rounded),
                        ),
                      ),
                    );

                    //   trailing: IconButton(
                    //     icon: Icon(Icons.delete),
                    //     onPressed: () {},
                    //   ),
                    // );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '\$${value.getTotalPrice()}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 16,
                          ),
                          child: Text(
                            'Pay Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
