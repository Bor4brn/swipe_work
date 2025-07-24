import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/themes/app_theme.dart';
import '../../data/providers/applications_provider.dart';
import '../../data/models/job_application.dart';

class ApplicationsPage extends ConsumerStatefulWidget {
  const ApplicationsPage({super.key});

  @override
  ConsumerState<ApplicationsPage> createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends ConsumerState<ApplicationsPage> {
  @override
  Widget build(BuildContext context) {
    final applications = ref.watch(applicationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Başvurularım'),
        backgroundColor: AppTheme.backgroundLight,
        foregroundColor: AppTheme.textPrimary,
        elevation: 0,
      ),
      backgroundColor: AppTheme.backgroundLight,
      body: applications.isEmpty
          ? _buildEmptyState()
          : _buildApplicationsList(applications),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_outlined,
            size: 80,
            color: AppTheme.textSecondary,
          ),
          SizedBox(height: 16),
          Text(
            'Başvuru Geçmişi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Henüz başvuru yapmadınız',
            style: TextStyle(
              color: AppTheme.textSecondary,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'İş fırsatlarını keşfedin ve sağa kaydırarak başvuru yapın!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationsList(List<JobApplication> applications) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: applications.length,
      itemBuilder: (context, index) {
        final application = applications[index];
        return _buildApplicationCard(application);
      },
    );
  }

  Widget _buildApplicationCard(JobApplication application) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        application.job.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        application.job.company,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: AppTheme.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            application.job.location,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _buildStatusChip(application.status),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 16,
                  color: AppTheme.textSecondary,
                ),
                const SizedBox(width: 4),
                Text(
                  'Başvuru: ${_formatDate(application.appliedAt)}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              application.job.salaryRange,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryRed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(ApplicationStatus status) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case ApplicationStatus.applied:
        backgroundColor = AppTheme.successGreen.withOpacity(0.1);
        textColor = AppTheme.successGreen;
        break;
      case ApplicationStatus.viewed:
        backgroundColor = AppTheme.warningOrange.withOpacity(0.1);
        textColor = AppTheme.warningOrange;
        break;
      case ApplicationStatus.rejected:
        backgroundColor = AppTheme.errorRed.withOpacity(0.1);
        textColor = AppTheme.errorRed;
        break;
      default:
        backgroundColor = AppTheme.secondaryGray.withOpacity(0.1);
        textColor = AppTheme.textSecondary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _getStatusDisplayText(status),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _getStatusDisplayText(ApplicationStatus status) {
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
