class Booking {
  int id;
  String hotelName;
  String hotelAddress;
  int horating;
  String ratingName;
  String departure;
  String arrivalCountry;
  String tourDateStart;
  String tourDateStop;
  int numberOfNights;
  String room;
  String nutrition;
  int tourPrice;
  int fuelCharge;
  int serviceCharge;

  Booking({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge
  });

  Booking.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    hotelName = json['hotel_name'],
    hotelAddress = json['hotel_adress'],
    horating = json['horating'],
    ratingName = json['rating_name'],
    departure = json['departure'],
    arrivalCountry = json['arrival_country'],
    tourDateStart = json['tour_date_start'],
    tourDateStop = json['tour_date_stop'],
    numberOfNights = json['number_of_nights'],
    room = json['room'],
    nutrition = json['nutrition'],
    tourPrice = json['tour_price'],
    fuelCharge = json['fuel_charge'],
    serviceCharge = json['service_charge'];
}