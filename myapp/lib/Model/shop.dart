import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier{
  // Food menu
  final List<Food> _foodMenu = [

    // 1. Nigiri Sushi
    Food(
      name: "Nigiri Sushi",
      price:"18.00",
      imagePath: 'lib/images/nigirisushi.png',
      reting: "4.5",
      description:"Nigiri sushi is a classic Japanese dish made of hand-pressed vinegared rice topped with various ingredients. The toppings can include fresh slices of raw fish, cooked seafood, or even tamago (sweet omelet). It's often garnished with a touch of wasabi and served with pickled ginger."
    ),
    // 2. Sashimi
    Food(
      name: "Sashimi",
      price:"15.00",
      imagePath: 'lib/images/sashimi.png',
      reting: "3.9",
      description:"Sashimi is not technically sushi but a standalone Japanese dish consisting of thinly sliced, high-quality raw seafood. Common sashimi options include tuna, salmon, yellowtail, and more, and it's typically served with soy sauce and wasabi for dipping."
    ),
    // 3. Maki Sushi
    Food(
      name: "Maki Sushi",
      price:"18.99",
      imagePath: 'lib/images/makisushi.png',
      reting: "4.8",
      description:"Maki sushi, also known as sushi rolls, involves rolling vinegared rice and various fillings in a sheet of seaweed (nori). There are different types, including uramaki (inside-out rolls), nori maki (traditional rolls), and temaki (hand-rolled cones)."
    ),
    // 4. Chirashi Sushi
    Food(
      name: "Chirashi Sushi",
      price:"18.00",
      imagePath: 'lib/images/chirashisushi.png',
      reting: "4.0",
      description:"Chirashi sushi is a colorful bowl of sushi rice topped with an assortment of sashimi-grade fish, vegetables, and other toppings. It's often served with pickled ginger and wasabi."
    ),
    // 5. Sushi Sashimi
    Food(
      name: "Sushi Sashimi",
      price:"17.00",
      imagePath: 'lib/images/sushisashimicombo.png',
      reting: "4.5",
      description:"A sushi sashimi combo offers the best of both worlds. It typically includes a variety of nigiri sushi and sashimi, providing a diverse selection of raw and cooked seafood."
    ),
    // 6. Narezushi
    Food(
      name: "Narezushi",
      price:"28.00",
      imagePath: 'lib/images/narezushi.png',
      reting: "5.0",
      description:"Narezushi is an ancient form of fermented sushi. It involves preserving fish and rice together, allowing them to ferment for an extended period, resulting in a unique and acquired taste."
    ),
    // 7. Inari Sushi
    Food(
      name: "Inari Sushi",
      price:"18.00",
      imagePath: 'lib/images/inarisushi.png',
      reting: "4.8",
      description:"Inari sushi features vinegared rice enclosed in pockets of sweet, marinated tofu skin known as inarizushi-no-moto. The combination of savory rice and sweet tofu creates a delightful contrast of flavors."
    ),
    // 8. Gunkan Maki
    Food(
      name: "Gunkan Maki",
      price:"15.00",
      imagePath: 'lib/images/gunkanmaki.png',
      reting: "4.0",
      description:" Gunkan maki, or 'battleship sushi,' is a type of sushi where a small strip of nori is wrapped around a mound of rice, creating a vessel for ingredients like sea urchin (uni) or fish roe (ikura)."
    ),
    // 9. Sushi Bowl
    Food(
      name: "Sushi Bowl",
      price:"17.00",
      imagePath: 'lib/images/sushibowl.png',
      reting: "4.9",
      description:"Sushi bowls, or sushi donburi, consist of a bowl of sushi rice topped with a variety of sashimi-grade seafood, vegetables, and other toppings. It's a visually appealing and delicious way to enjoy sushi flavors without the traditional rolls."
    ),
    // 10. Vegetarian Sushi
    Food(
      name: "Vegetarian Sushi",
      price:"12.00",
      imagePath: 'lib/images/vegetariansushi.png',
      reting: "3.9",
      description:"Vegetarian sushi options cater to those who prefer not to consume fish or meat. They often feature ingredients like cucumber, avocado, pickled vegetables, and tamago (sweet omelet) to create delicious and satisfying rolls."
    ),
    // 11. Sushi Pizza
    Food(
      name: "Sushi Pizza",
      price:"10.00",
      imagePath: 'lib/images/sushipizza.png',
      reting: "3.5",
      description:"Sushi pizza is a fusion dish that combines sushi ingredients with a crispy rice cake base. Toppings can include spicy tuna, avocado, mayonnaise, and various sauces, creating a delightful blend of textures and flavors."
    ),
    // 12. Aburi Sushi
    Food(
      name: "Aburi Sushi",
      price:"18.00",
      imagePath: 'lib/images/aburisushi.png',
      reting: "4.9",
      description:"Aburi sushi involves searing or torching the surface of the fish or other toppings, imparting a smoky flavor and altering the texture while keeping the interior raw."
    ),
    // 13. Tataki Sushi
    Food(
      name: "Tataki Sushi",
      price:"20.00",
      imagePath: 'lib/images/tatakisushi.png',
      reting: "4.9",
      description:"Tataki sushi features lightly seared fish or toppings, often with a quick sear on the outside while maintaining a raw center, enhancing the flavor and visual appeal."
    ),
    // 14. Onigirazu Sushi
    Food(
      name: "Onigirazu Sushi",
      price:"19.99",
      imagePath: 'lib/images/onigirazusushi.png',
      reting: "4.9",
      description:"Onigirazu sushi is a sushi sandwich where rice and fillings are wrapped in a sheet of nori, creating a convenient and portable sushi meal."
    ),
    // 15. Kaisen Don
    Food(
      name: "Kaisen Don",
      price:"18.00",
      imagePath: 'lib/images/kaisendon.png',
      reting: "4.5",
      description:"Kaisen don is a rice bowl topped with a variety of sashimi-grade seafood, providing a satisfying combination of flavors and textures in a single dish."
    ),
    // 16. Spicy Sushi
    Food(
      name: "Spicy Sushi",
      price:"16.00",
      imagePath: 'lib/images/spicysushi.png',
      reting: "4.0",
      description:"Spicy sushi options incorporate spicy sauces, such as spicy mayo or sriracha, to add heat and flavor to rolls and dishes."
    ),
    // 17. Dragon Roll
    Food(
      name: "Dragon Roll",
      price:"20.00",
      imagePath: 'lib/images/dragonroll.png',
      reting: "4.5",
      description:"A dragon roll is a visually striking sushi roll typically filled with eel (unagi), cucumber, and avocado. Slices of avocado are layered on top to resemble dragon scales, and it's often drizzled with eel sauce."
    ),
    // 18. Rainbow Roll
    Food(
      name: "Rainbow Roll",
      price:"20.00",
      imagePath: 'lib/images/rainbowroll.png',
      reting: "4.9",
      description:"A rainbow roll is a colorful sushi roll consisting of a California roll (avocado, crab, cucumber) inside, topped with an assortment of sashimi slices in various colors, creating a visually appealing and flavorful combination."
    ),
    // 19. Futomaki
    Food(
      name: "Futomaki",
      price:"18.00",
      imagePath: 'lib/images/futomaki.png',
      reting: "4.9",
      description:"Futomaki, meaning 'thick roll,' features a larger roll diameter compared to standard maki, allowing for a variety of ingredients to be included in each bite."
    ),
    // 20. Hosomaki
    Food(
      name: "Hosomaki",
      price:"15.00",
      imagePath: 'lib/images/hosomaki.png',
      reting: "3.9",
      description:"Hosomaki, or 'thin roll,' consists of a single filling, such as cucumber, avocado, or tuna, wrapped in nori and rice. These rolls are typically smaller in diameter compared to futomaki."
    ),
    // 21. Sushi Burrito
    Food(
      name: "Sushi Burrito",
      price:"19.20",
      imagePath: 'lib/images/sushiburrito.png',
      reting: "4.9",
      description:"Sushi burritos are a fusion creation that combines sushi ingredients, including rice, fish, vegetables, and sauces, within a large sheet of seaweed, creating a substantial and flavorful roll."
    ),
    // 22. Sushi Conveyor
    Food(
      name: "Sushi Conveyor",
      price:"21.00",
      imagePath: 'lib/images/sushiconveyorbelt.png',
      reting: "4.9",
      description:"Some sushi restaurants feature a conveyor belt system where plates of sushi travel by diners on a moving belt. Diners can select the plates they like as they pass by, and the bill is calculated based on the number and color of the plates chosen."
    ),
    // 23. Salmon Sushi
    Food(
      name: "Salmon Sushi",
      price:"21.00",
      imagePath: 'lib/images/salmon_sushi.png',
      reting: "4.9",
      description:"Salmon sushi, also known as 'sake' in Japanese, is a popular type of nigiri sushi. It consists of a small mound of vinegared rice that is hand-pressed and typically topped with a slice of fresh, high-quality salmon. The salmon is often served raw but may also be lightly seared or marinated. Salmon sushi has a rich, buttery flavor and a tender texture. It is commonly garnished with a small dab of wasabi and may be served with pickled ginger on the side."
    ),

    // 24. Tuna
    Food(
      name: "Tuna Sushi",
      price:"20.00",
      imagePath: 'lib/images/tuna.png',
      reting: "4.5",
      description:" Tuna sushi, known as 'maguro' in Japanese, is another beloved type of nigiri sushi. It features a mound of vinegared rice, hand-pressed and usually topped with a slice of raw tuna. There are different types of tuna used in sushi, including akami (lean tuna), chu-toro (medium fatty tuna), and o-toro (fatty tuna), each offering a unique flavor and texture. Tuna sushi is often served with wasabi and pickled ginger, enhancing its natural umami taste. It's prized for its clean, fresh flavor and is a staple in sushi menus worldwide."
    ),


    

  ];

  // customer cart
  List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem ,int quantity){
    for (int i =0; i<quantity; i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }
  // remove from cart
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }
}