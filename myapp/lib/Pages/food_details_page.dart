import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Components/button.dart';
import 'package:myapp/Model/shop.dart';
import 'package:myapp/theme/colors.dart';
import 'package:provider/provider.dart';
import '../Model/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  // quantity
  int quantityCount = 0;

  // Decrement quantity
  void decrementQuantity(){
    setState(() {
      if (quantityCount>0){
        quantityCount--;
      }

    });
  }

  // increment quantity
  void incrementQuantity(){
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  // add to cart
  void addToCart(){

    // only add to cart if there is something in the cart
    if(quantityCount > 0){  
    // get access to shop
    final shop = context.read<Shop>();
    // add to cart
    shop.addToCart(widget.food, quantityCount);
    // let the user know it was successful
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: primaryColor,
        content:const Text(
        ('Successfully added to Cart'),
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        ),
        actions: [
          // ok button
          IconButton(onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(
              Icons.done,
            ),
          )
        ],
    ));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();}
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor:primaryColor,
        actions: [
          // button cart
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cartpage');
          },
          icon: Icon(
            Icons.shopping_cart,
            color: primaryColor,
            size: 30,
          ))
        ],
      ),
      body: Column(
        children: [
          // Listview of food details
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                // image
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
          
                ),
                const SizedBox(height: 25),
                // reting
                Row(
                  children: [
                    // star icon
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),

                    const SizedBox(width: 5),
          
                    // reting number
                    Text(
                      widget.food.reting,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 10),     
                // food name
                Text(
                  widget.food.name,
                  style:GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),

                const SizedBox(height: 25),     

                // description
                const Text(
                  'Description',
                  style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.food.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    height: 2,
                  ),
                  textAlign: TextAlign.justify,
                )

              ],
            ),
          )),
          // Price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child:Column(
              children: [
                // Price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    Text(
                      '\$'+ widget.food.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    // quantity
                    Row(
                      children: [
                        // minus button
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(220, 100, 53, 50),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon:const Icon(
                              Icons.remove,color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                            )
                        ),
                        // quantity button
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        // plus button
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(220, 100, 53, 50),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon:const Icon(
                              Icons.add,color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                            )
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),

                // add to cart button
                MyButton(text: "Add To Cart", onTap: addToCart)

              ],
            ) ,
          )
        ],
      ),
    );
  }
}