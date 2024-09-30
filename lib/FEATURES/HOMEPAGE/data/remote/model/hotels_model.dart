class HotelModel extends HotelsEntity {
  HotelModel({required List<Hotel> hotels})
      : super(hotels: hotels);

  // Adjusted to directly accept a list of dynamic objects
  factory HotelModel.fromJson(List<dynamic> jsonList) => HotelModel(
    hotels: List<Hotel>.from(jsonList.map((x) => Hotel.fromJson(x))),
  );
}

class HotelsEntity {
  HotelsEntity({
    required this.hotels,
  });

  List<Hotel> hotels;
}

class Hotel {
  Hotel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    id: json["id"],
    name: json["name"],
  );
}

