
class LeadFieldsModel {
  final String? name;
  final String? value;
  final String? description;
  final bool? isActive;

  LeadFieldsModel({
      this.name,
      this.value,
    this.description,
      this.isActive,
  });

  factory LeadFieldsModel.fromJson(Map<String, dynamic> json) {
    return LeadFieldsModel(
      name: json['Name'],
      value: json['Value'],
      description: json['Description'],
      isActive: json['IsActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Value': value,
      'Description': description,
      'IsActive': isActive,
    };
  }
}