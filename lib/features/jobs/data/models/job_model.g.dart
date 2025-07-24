// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      id: json['id'] as String,
      title: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      requirements: json['requirements'] as String?,
      benefits: json['benefits'] as String?,
      salaryRange: json['salaryRange'] as String,
      workType: json['workType'] as String,
      experienceLevel: json['experienceLevel'] as String,
      category: json['category'] as String,
      companyLogo: json['companyLogo'] as String?,
      companyWebsite: json['companyWebsite'] as String?,
      companySizeMin: (json['companySizeMin'] as num?)?.toInt(),
      companySizeMax: (json['companySizeMax'] as num?)?.toInt(),
      companySector: json['companySector'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      sourceBoard: json['sourceBoard'] as String,
      originalUrl: json['originalUrl'] as String?,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      isActive: json['isActive'] as bool? ?? true,
      viewCount: (json['viewCount'] as num?)?.toInt(),
      applicationCount: (json['applicationCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'company': instance.company,
      'location': instance.location,
      'description': instance.description,
      'requirements': instance.requirements,
      'benefits': instance.benefits,
      'salaryRange': instance.salaryRange,
      'workType': instance.workType,
      'experienceLevel': instance.experienceLevel,
      'category': instance.category,
      'companyLogo': instance.companyLogo,
      'companyWebsite': instance.companyWebsite,
      'companySizeMin': instance.companySizeMin,
      'companySizeMax': instance.companySizeMax,
      'companySector': instance.companySector,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'sourceBoard': instance.sourceBoard,
      'originalUrl': instance.originalUrl,
      'skills': instance.skills,
      'isActive': instance.isActive,
      'viewCount': instance.viewCount,
      'applicationCount': instance.applicationCount,
    };
