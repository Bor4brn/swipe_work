import 'package:json_annotation/json_annotation.dart';

part 'job_model.g.dart';

@JsonSerializable()
class JobModel {
  final String id;
  final String title;
  final String company;
  final String location;
  final String description;
  final String? requirements;
  final String? benefits;
  final String salaryRange;
  final String workType; // 'remote', 'hybrid', 'on-site'
  final String experienceLevel;
  final String category;
  final String? companyLogo;
  final String? companyWebsite;
  final int? companySizeMin;
  final int? companySizeMax;
  final String? companySector;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String sourceBoard; // 'kariyer.net', 'secretcv', 'linkedin', etc.
  final String? originalUrl;
  final List<String> skills;
  final bool isActive;
  final int? viewCount;
  final int? applicationCount;

  const JobModel({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    this.requirements,
    this.benefits,
    required this.salaryRange,
    required this.workType,
    required this.experienceLevel,
    required this.category,
    this.companyLogo,
    this.companyWebsite,
    this.companySizeMin,
    this.companySizeMax,
    this.companySector,
    required this.createdAt,
    this.updatedAt,
    required this.sourceBoard,
    this.originalUrl,
    required this.skills,
    this.isActive = true,
    this.viewCount,
    this.applicationCount,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobModelToJson(this);

  JobModel copyWith({
    String? id,
    String? title,
    String? company,
    String? location,
    String? description,
    String? requirements,
    String? benefits,
    String? salaryRange,
    String? workType,
    String? experienceLevel,
    String? category,
    String? companyLogo,
    String? companyWebsite,
    int? companySizeMin,
    int? companySizeMax,
    String? companySector,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? sourceBoard,
    String? originalUrl,
    List<String>? skills,
    bool? isActive,
    int? viewCount,
    int? applicationCount,
  }) {
    return JobModel(
      id: id ?? this.id,
      title: title ?? this.title,
      company: company ?? this.company,
      location: location ?? this.location,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      benefits: benefits ?? this.benefits,
      salaryRange: salaryRange ?? this.salaryRange,
      workType: workType ?? this.workType,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      category: category ?? this.category,
      companyLogo: companyLogo ?? this.companyLogo,
      companyWebsite: companyWebsite ?? this.companyWebsite,
      companySizeMin: companySizeMin ?? this.companySizeMin,
      companySizeMax: companySizeMax ?? this.companySizeMax,
      companySector: companySector ?? this.companySector,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sourceBoard: sourceBoard ?? this.sourceBoard,
      originalUrl: originalUrl ?? this.originalUrl,
      skills: skills ?? this.skills,
      isActive: isActive ?? this.isActive,
      viewCount: viewCount ?? this.viewCount,
      applicationCount: applicationCount ?? this.applicationCount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JobModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'JobModel(id: $id, title: $title, company: $company, location: $location)';
  }
}
