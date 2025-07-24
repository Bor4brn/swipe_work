// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobApplication _$JobApplicationFromJson(Map<String, dynamic> json) =>
    JobApplication(
      id: json['id'] as String,
      userId: json['userId'] as String,
      jobId: json['jobId'] as String,
      job: JobModel.fromJson(json['job'] as Map<String, dynamic>),
      status: $enumDecode(_$ApplicationStatusEnumMap, json['status']),
      appliedAt: DateTime.parse(json['appliedAt'] as String),
      statusUpdatedAt: json['statusUpdatedAt'] == null
          ? null
          : DateTime.parse(json['statusUpdatedAt'] as String),
      coverLetter: json['coverLetter'] as String?,
      notes: json['notes'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$JobApplicationToJson(JobApplication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'jobId': instance.jobId,
      'job': instance.job,
      'status': _$ApplicationStatusEnumMap[instance.status]!,
      'appliedAt': instance.appliedAt.toIso8601String(),
      'statusUpdatedAt': instance.statusUpdatedAt?.toIso8601String(),
      'coverLetter': instance.coverLetter,
      'notes': instance.notes,
      'additionalData': instance.additionalData,
    };

const _$ApplicationStatusEnumMap = {
  ApplicationStatus.pending: 'pending',
  ApplicationStatus.applied: 'applied',
  ApplicationStatus.viewed: 'viewed',
  ApplicationStatus.shortlisted: 'shortlisted',
  ApplicationStatus.interviewScheduled: 'interview_scheduled',
  ApplicationStatus.interviewed: 'interviewed',
  ApplicationStatus.offered: 'offered',
  ApplicationStatus.accepted: 'accepted',
  ApplicationStatus.rejected: 'rejected',
  ApplicationStatus.withdrawn: 'withdrawn',
};
