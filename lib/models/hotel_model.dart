class Hotel {
  int? id;
  String? name;
  String? address;
  int? minimalPrice;
  String? priceForIt;
  int? rating;
  String? ratingName;
  List<String>? imageUrls;
  AboutTheHotel? aboutTheHotel;

  Hotel({
    this.id,
    this.name,
    this.address,
    this.minimalPrice,
    this.priceForIt,
    this.rating,
    this.ratingName,
    this.imageUrls,
    this.aboutTheHotel
  });

  Hotel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    address = json['adress'],
    minimalPrice = json['minimal_price'],
    priceForIt = json['price_for_it'],
    rating = json['rating'],
    ratingName = json['rating_name'],
    imageUrls = json['image_urls'],
    aboutTheHotel = json['about_the_hotel'] != null
        ? AboutTheHotel.fromJson(json['about_the_hotel'])
        : null;
}

class AboutTheHotel {
  String? description;
  List<String>? peculiarities;

  AboutTheHotel({
    this.description,
    this.peculiarities
  });

  AboutTheHotel.fromJson(Map<String, dynamic> json) :
    description = json['description'],
    peculiarities = json['peculiarities'];
}