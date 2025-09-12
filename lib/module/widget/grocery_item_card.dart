import 'package:flutter/material.dart';

class GroceryItemCard extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemImage;
  void Function()? onPressed;
  final Color;
  GroceryItemCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.Color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16, bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          //image
          Image.asset(itemImage, height: 100, width: 100),
          //item_name
          Text(
            itemName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          //item_price
          MaterialButton(
            onPressed: onPressed,
            color: Color[600],
            child: Text('\$$itemPrice', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
