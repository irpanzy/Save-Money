class SettingsModel {
  final String name;

  SettingsModel({required this.name});

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(name: map['nama']);
  }

  Map<String, dynamic> toMap() {
    return {'nama': name};
  }
}
