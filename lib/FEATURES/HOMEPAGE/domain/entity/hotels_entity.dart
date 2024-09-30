//
// class HotelsEntity {
//   HotelsEntity({
//     required this.hotels,
//   });
//
//   List<dynamic> hotels;
//
//   factory HotelsEntity.fromJson(Map<String, dynamic> json) => HotelsEntity(
//     hotels: List<dynamic>.from(json["Hotels"].map((x) => Hotel.fromJson(x))),
//   );
//
// }
//
//
// class Hotel {
//   Hotel({
//     required this.id,
//     required this.name,
//   });
//
//   int id;
//   String name;
//
//   factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
//     id: json["id"],
//     name: json["name"],
//   );
// }
