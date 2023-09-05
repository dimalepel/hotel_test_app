class RoomResult {
  List<Room>? rooms;

  RoomResult({
    this.rooms
  });

  RoomResult.fromJson(Map<String, dynamic> json) :
    rooms = List<Room>.from(json['rooms'].map((r) => Room.fromJson(r)));
}

class Room {
  int? id;
  String? name;
  int? price;
  String? pricePer;
  List<dynamic>? peculiarities;
  List<dynamic>? imageUrls;

  Room({
    this.id,
    this.name,
    this.price,
    this.pricePer,
    this.peculiarities,
    this.imageUrls
  });

  Room.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    price = json['price'],
    pricePer = json['price_per'],
    peculiarities = json['peculiarities'],
    imageUrls = json['image_urls'];
}