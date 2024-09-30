class StaffModel extends StaffEntity {
  StaffModel({required List<Staff> staffs})
      : super(staffs: staffs);

  // Adjusted to directly accept a list of dynamic objects
  factory StaffModel.fromJson(List<dynamic> jsonList) => StaffModel(
    staffs: List<Staff>.from(jsonList.map((x) => Staff.fromJson(x))),
  );
}

class StaffEntity {
  StaffEntity({
    required this.staffs,
  });

  List<Staff> staffs;
}

class Staff {
  Staff({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    id: json["id"],
    name: json["name"],
  );
}