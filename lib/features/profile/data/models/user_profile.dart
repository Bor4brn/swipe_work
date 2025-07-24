import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  final String id;
  final String fullName;
  final String email;
  final String? phone;
  final String? profileImageUrl;
  final String? location;
  final String? jobTitle;
  final String? bio;
  final List<String> skills;
  final String? cvUrl;
  final int experienceYears;
  final String? educationLevel;
  final List<String> preferredCategories;
  final List<String> preferredLocations;
  final double? expectedSalaryMin;
  final double? expectedSalaryMax;
  final bool isRemotePreferred;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    this.phone,
    this.profileImageUrl,
    this.location,
    this.jobTitle,
    this.bio,
    this.skills = const [],
    this.cvUrl,
    this.experienceYears = 0,
    this.educationLevel,
    this.preferredCategories = const [],
    this.preferredLocations = const [],
    this.expectedSalaryMin,
    this.expectedSalaryMax,
    this.isRemotePreferred = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  UserProfile copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phone,
    String? profileImageUrl,
    String? location,
    String? jobTitle,
    String? bio,
    List<String>? skills,
    String? cvUrl,
    int? experienceYears,
    String? educationLevel,
    List<String>? preferredCategories,
    List<String>? preferredLocations,
    double? expectedSalaryMin,
    double? expectedSalaryMax,
    bool? isRemotePreferred,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      location: location ?? this.location,
      jobTitle: jobTitle ?? this.jobTitle,
      bio: bio ?? this.bio,
      skills: skills ?? this.skills,
      cvUrl: cvUrl ?? this.cvUrl,
      experienceYears: experienceYears ?? this.experienceYears,
      educationLevel: educationLevel ?? this.educationLevel,
      preferredCategories: preferredCategories ?? this.preferredCategories,
      preferredLocations: preferredLocations ?? this.preferredLocations,
      expectedSalaryMin: expectedSalaryMin ?? this.expectedSalaryMin,
      expectedSalaryMax: expectedSalaryMax ?? this.expectedSalaryMax,
      isRemotePreferred: isRemotePreferred ?? this.isRemotePreferred,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
