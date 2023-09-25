class Food {
  String name;
  String price;
  String imagePath;
  String reting;
  String description;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.reting,
    required this.description
  });

  String get _name => name;
  String get _price => price;
  String get _imagepath => imagePath;
  String get _reting => reting;
  String get _description => description;
  


}