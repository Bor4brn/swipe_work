import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/job_application.dart';
import '../../../jobs/data/models/job_model.dart';

// Applications state provider
final applicationsProvider = StateNotifierProvider<ApplicationsNotifier, List<JobApplication>>((ref) {
  return ApplicationsNotifier();
});

class ApplicationsNotifier extends StateNotifier<List<JobApplication>> {
  ApplicationsNotifier() : super([]);

  void addApplication(JobModel job) {
    final application = JobApplication(
      id: const Uuid().v4(),
      userId: 'current_user', // TODO: Get actual user ID
      jobId: job.id,
      job: job,
      status: ApplicationStatus.applied,
      appliedAt: DateTime.now(),
      statusUpdatedAt: DateTime.now(),
    );

    state = [...state, application];
  }

  void updateApplicationStatus(String applicationId, ApplicationStatus newStatus) {
    state = state.map((app) {
      if (app.id == applicationId) {
        return app.copyWith(
          status: newStatus,
          statusUpdatedAt: DateTime.now(),
        );
      }
      return app;
    }).toList();
  }

  void removeApplication(String applicationId) {
    state = state.where((app) => app.id != applicationId).toList();
  }

  List<JobApplication> getApplicationsByStatus(ApplicationStatus status) {
    return state.where((app) => app.status == status).toList();
  }
}
