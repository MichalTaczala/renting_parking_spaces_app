import 'dart:io';

class ParkingDetailsModel {
  final String? id;
  final String name;
  final String? address;
  final String? phone;
  final String? email;
  final List<File>? images;
  final String description;
  final String? latitude;
  final String? longitude;
  final double price;
  final String currency;
  final String? rating;
  final String? distance;

  ParkingDetailsModel({
    this.id,
    required this.name,
    this.address,
    this.phone,
    this.email,
    this.images,
    required this.description,
    this.latitude,
    this.longitude,
    required this.price,
    required this.currency,
    this.rating,
    this.distance,
  });

  factory ParkingDetailsModel.fromJson(Map<String, dynamic> json) {
    return ParkingDetailsModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      images: [],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      price: json['price'],
      currency: json['currency'],
      rating: json['rating'],
      distance: json['distance'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'images': images.map((file) => file.path).toList(),
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'price': price,
      'currency': currency,
      'rating': rating,
      'distance': distance,
    };
  }
}
