import 'package:json_annotation/json_annotation.dart';
import '../../../jobs/data/models/job_model.dart';

part 'job_application.g.dart';

enum ApplicationStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('applied')
  applied,
  @JsonValue('viewed')
  viewed,
  @JsonValue('shortlisted')
  shortlisted,
  @JsonValue('interview_scheduled')
  interviewScheduled,
  @JsonValue('interviewed')
  interviewed,
  @JsonValue('offered')
  offered,
  @JsonValue('accepted')
  accepted,
  @JsonValue('rejected')
  rejected,
  @JsonValue('withdrawn')
  withdrawn,
}

@JsonSerializable()
class JobApplication {
  final String id;
  final String userId;
  final String jobId;
  final JobModel job;
  final ApplicationStatus status;
  final DateTime appliedAt;
  final DateTime? statusUpdatedAt;
  final String? coverLetter;
  final String? notes;
  final Map<String, dynamic>? additionalData;

  const JobApplication({
    required this.id,
    required this.userId,
    required this.jobId,
    required this.job,
    required this.status,
    required this.appliedAt,
    this.statusUpdatedAt,
    this.coverLetter,
    this.notes,
    this.additionalData,
  });

  factory JobApplication.fromJson(Map<String, dynamic> json) => _$JobApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$JobApplicationToJson(this);

  JobApplication copyWith({
    String? id,
    String? userId,
    String? jobId,
    JobModel? job,
    ApplicationStatus? status,
    DateTime? appliedAt,
    DateTime? statusUpdatedAt,
    String? coverLetter,
    String? notes,
    Map<String, dynamic>? additionalData,
  }) {
    return JobApplication(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      jobId: jobId ?? this.jobId,
      job: job ?? this.job,
      status: status ?? this.status,
      appliedAt: appliedAt ?? this.appliedAt,
      statusUpdatedAt: statusUpdatedAt ?? this.statusUpdatedAt,
      coverLetter: coverLetter ?? this.coverLetter,
      notes: notes ?? this.notes,
      additionalData: additionalData ?? this.additionalData,
    );
  }

  String get statusDisplayText {
    switch (status) {
      case ApplicationStatus.pending:
        return 'Beklemede';
      case ApplicationStatus.applied:
        return 'Başvuru Yapıldı';
      case ApplicationStatus.viewed:
        return 'Görüntülendi';
      case ApplicationStatus.shortlisted:
        return 'Kısa Listede';
      case ApplicationStatus.interviewScheduled:
        return 'Mülakat Planlandı';
      case ApplicationStatus.interviewed:
        return 'Mülakat Yapıldı';
      case ApplicationStatus.offered:
        return 'Teklif Alındı';
      case ApplicationStatus.accepted:
        return 'Kabul Edildi';
      case ApplicationStatus.rejected:
        return 'Reddedildi';
      case ApplicationStatus.withdrawn:
        return 'Geri Çekildi';
    }
  }
}
