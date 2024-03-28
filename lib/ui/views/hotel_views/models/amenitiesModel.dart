class AmenitiesModel {
  String image;
  String title;

  AmenitiesModel({required this.image, required this.title});
}

List<AmenitiesModel> Amenities = [
  AmenitiesModel(image: 'assets/image/png/pool.png', title: 'Pool'),
  AmenitiesModel(image: 'assets/image/png/services.png', title: 'Services'),
  AmenitiesModel(image: 'assets/image/png/internet.png', title: 'Internet'),
  AmenitiesModel(image: 'assets/image/png/parking.png', title: 'Parking'),
  AmenitiesModel(image: 'assets/image/png/beauty.png', title: 'Beauty'),
  AmenitiesModel(image: 'assets/image/png/internet.png', title: 'Internet'),
];
