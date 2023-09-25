import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Components/button.dart';
import 'package:myapp/Components/food_tile.dart';
import 'package:myapp/Model/shop.dart';
import 'package:myapp/Pages/food_details_page.dart';
import 'package:myapp/theme/colors.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  // Food item details Page
  void navigateToFoodDetails (int index){
    // grt the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
        // grt the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // AppBar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: primaryColor,
          size: 30,
        ),
        title: Text(
          'TOKYO',
          style: TextStyle(
            color: primaryColor,
            fontSize: 25,
          ),
        ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Promo Banner
          Container(
            decoration: BoxDecoration(
              color:primaryColor,
              borderRadius: BorderRadius.circular(20)
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Promo messenge
                    Text(
                      'Get 32% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Redeem Button
                    MyButton(
                      text: "Redeem",
                      onTap:(){
                      }
                    )
                  ],
                ),
                // Image
                Image.asset(
                  'lib/images/many_sushi.png',
                  height: 100,
                  
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Shearh
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:primaryColor),
                  borderRadius: BorderRadius.circular(20)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)
                ),prefixIcon: Icon(Icons.search, color: primaryColor),
                hintText: 'Shearh here...'
              ),
            ),
          ),
          const SizedBox(height: 25),
          // Menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Food Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18
              ),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap:() => navigateToFoodDetails(index) ,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 25),
            child: Text(
              "Faverite",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 71, 71, 71),
                fontSize: 18
              ),
            ),
          ),
          // popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin:const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 25
            ),
            padding:const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image
                    Row(
                      children: [
                        Image.asset(
                          'lib/images/salmon_eggs.png',
                          height: 60,
                        ),
                        const SizedBox(width: 20),
                        // Name and Price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            Text(
                              'Salmon Eggs',
                              style: GoogleFonts.dmSerifDisplay(
                              fontSize: 18
                              ),
                            ),
                            const SizedBox(height: 10,),
                            // Price
                            Text(
                              '\$18.00',
                              style: TextStyle(
                              color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            // Reting
                            Icon(
                              Icons.star,
                              color:Colors.amber[600],
                              size: 25,
                            ),
                            Text('4.9',style: TextStyle(color: Colors.grey[700]),),
                          ],
                        ),
                        // Hart
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.favorite,
                            color:primaryColor,
                            size: 29,
                          ),
                        ),
                      ],
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}