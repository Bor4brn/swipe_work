// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      location: json['location'] as String?,
      jobTitle: json['jobTitle'] as String?,
      bio: json['bio'] as String?,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cvUrl: json['cvUrl'] as String?,
      experienceYears: (json['experienceYears'] as num?)?.toInt() ?? 0,
      educationLevel: json['educationLevel'] as String?,
      preferredCategories: (json['preferredCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preferredLocations: (json['preferredLocations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      expectedSalaryMin: (json['expectedSalaryMin'] as num?)?.toDouble(),
      expectedSalaryMax: (json['expectedSalaryMax'] as num?)?.toDouble(),
      isRemotePreferred: json['isRemotePreferred'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'profileImageUrl': instance.profileImageUrl,
      'location': instance.location,
      'jobTitle': instance.jobTitle,
      'bio': instance.bio,
      'skills': instance.skills,
      'cvUrl': instance.cvUrl,
      'experienceYears': instance.experienceYears,
      'educationLevel': instance.educationLevel,
      'preferredCategories': instance.preferredCategories,
      'preferredLocations': instance.preferredLocations,
      'expectedSalaryMin': instance.expectedSalaryMin,
      'expectedSalaryMax': instance.expectedSalaryMax,
      'isRemotePreferred': instance.isRemotePreferred,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
