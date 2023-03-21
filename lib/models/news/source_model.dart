// ignore_for_file: prefer_if_null_operators

class SourceModel {
  final String? id;
  final String? name;

  SourceModel({
    this.id,
    this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json['id'] == null ? null : json['id'],
        name: json['name'] == null ? null : json['name'],
      );
}
