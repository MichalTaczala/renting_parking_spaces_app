class ParkingDetailsModel {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String email;
  final List<String> images;
  final String description;
  final String? latitude;
  final String? longitude;
  final double price;
  final String currency;
  final String rating;
  final String distance;

  ParkingDetailsModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.images,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.currency,
    required this.rating,
    required this.distance,
  });

  factory ParkingDetailsModel.fromJson(Map<String, dynamic> json) {
    return ParkingDetailsModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      images: List<String>.from(json['images']),
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      price: json['price'],
      currency: json['currency'],
      rating: json['rating'],
      distance: json['distance'],
    );
  }
}
