import 'package:flutter/material.dart';
import 'package:myapp/Components/button.dart';
import 'package:myapp/Model/food.dart';
import 'package:myapp/Model/shop.dart';
import 'package:myapp/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  void removeFromList(Food food, BuildContext context) {
    // Get access to shop
    final shop = context.read<Shop>();
    // Remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          elevation: 0,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text(
            "My Cart",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            // Customer cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  // Get food from cart
                  final Food food = value.cart[index];
                  // Get food image
                  final String foodImage = food.imagePath;
                  // Get food name
                  final String foodName = food.name;
                  // Get food price
                  final String foodPrice = food.price;
                  // Return ListTile
                  return Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Image.asset(foodImage),
                        title: Text(
                            foodName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                        subtitle: Text(
                          '\$' + foodPrice,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 45, 133, 50),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () => removeFromList(food, context),
                          icon: const Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Pay button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(text: "Pay Now", onTap: () {
                // Add your logic for handling the payment here
              }),
            )
          ],
        ),
      ),
    );
  }
}
