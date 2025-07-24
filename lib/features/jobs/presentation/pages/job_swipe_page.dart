import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../applications/data/providers/applications_provider.dart';
import '../../data/models/job_model.dart';

class JobSwipePage extends ConsumerStatefulWidget {
  const JobSwipePage({super.key});

  @override
  ConsumerState<JobSwipePage> createState() => _JobSwipePageState();
}

class _JobSwipePageState extends ConsumerState<JobSwipePage>
    with TickerProviderStateMixin {
  final CardSwiperController _swiperController = CardSwiperController();
  late AnimationController _buttonAnimationController;

  // Sample job data
  final List<JobListing> _jobs = [
    JobListing(
      title: 'Senior Flutter Developer',
      company: 'TechCorp Türkiye',
      location: 'İstanbul, Türkiye',
      salary: '15.000 - 25.000 TL',
      workType: 'Hibrit',
      experience: '3-5 yıl',
      description: 'Flutter ile mobil uygulama geliştirme pozisyonu. Modern teknolojiler ve agile metodoloji kullanarak...',
      requirements: ['Flutter', 'Dart', 'REST API', 'Git', 'Agile'],
      isRemote: true,
      companyLogo: null,
    ),
    JobListing(
      title: 'UI/UX Designer',
      company: 'Design Studio İstanbul',
      location: 'İstanbul, Türkiye',
      salary: '8.000 - 15.000 TL',
      workType: 'Tam Zamanlı',
      experience: '2-4 yıl',
      description: 'Kullanıcı deneyimi tasarımı ve arayüz tasarımı pozisyonu. Figma, Adobe XD ve diğer tasarım araçları...',
      requirements: ['Figma', 'Adobe XD', 'Prototyping', 'User Research'],
      isRemote: false,
      companyLogo: null,
    ),
    JobListing(
      title: 'Backend Developer',
      company: 'StartupTech',
      location: 'Ankara, Türkiye',
      salary: '12.000 - 20.000 TL',
      workType: 'Uzaktan',
      experience: '2-3 yıl',
      description: 'Node.js ve MongoDB kullanarak backend geliştirme. RESTful API tasarımı ve mikroservis mimarisi...',
      requirements: ['Node.js', 'MongoDB', 'REST API', 'Docker', 'AWS'],
      isRemote: true,
      companyLogo: null,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    super.dispose();
  }

  bool _onSwipe(int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    final job = _jobs[previousIndex];
    
    if (direction == CardSwiperDirection.right) {
      _applyToJob(job);
    } else if (direction == CardSwiperDirection.left) {
      _skipJob(job);
    }
    
    return true;
  }

  void _applyToJob(JobListing job) {
    // Create a JobModel from JobListing for compatibility
    final jobModel = _convertToJobModel(job);
    
    // Add to applications using Riverpod provider
    ref.read(applicationsProvider.notifier).addApplication(jobModel);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${job.title} pozisyonuna başvuru gönderildi!'),
        backgroundColor: AppTheme.successGreen,
      ),
    );
  }

  void _skipJob(JobListing job) {
    // TODO: Implement skip logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${job.title} pozisyonu geçildi'),
        backgroundColor: AppTheme.secondaryGray,
      ),
    );
  }

  JobModel _convertToJobModel(JobListing job) {
    return JobModel(
      id: const Uuid().v4(),
      title: job.title,
      company: job.company,
      location: job.location,
      description: job.description,
      requirements: job.requirements.join(', '),
      salaryRange: job.salary,
      workType: job.workType,
      experienceLevel: job.experience,
      category: 'Yazılım', // Default category
      createdAt: DateTime.now(),
      sourceBoard: 'app_sample',
      skills: job.requirements,
      isActive: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: const Text('İş Fırsatları'),
        backgroundColor: AppTheme.backgroundLight,
        foregroundColor: AppTheme.textPrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Show filter dialog
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Swipe instructions
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.swipe_left,
                        color: AppTheme.errorRed.withOpacity(0.7),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Geç',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.swipe_right,
                        color: AppTheme.successGreen.withOpacity(0.7),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Başvur',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Card swiper
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _jobs.isEmpty
                    ? _buildEmptyState()
                    : CardSwiper(
                        controller: _swiperController,
                        cardsCount: _jobs.length,
                        onSwipe: _onSwipe,
                        cardBuilder: (context, index, horizontalThreshold, verticalThreshold) {
                          return _buildJobCard(_jobs[index]);
                        },
                        allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
                          horizontal: true,
                        ),
                        scale: 0.9,
                        padding: const EdgeInsets.all(8.0),
                      ),
              ),
            ),
            
            // Action buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Skip button
                  FloatingActionButton(
                    heroTag: 'skip',
                    onPressed: () {
                      _swiperController.swipe(CardSwiperDirection.left);
                    },
                    backgroundColor: AppTheme.errorRed,
                    child: const Icon(Icons.close, color: AppTheme.primaryWhite),
                  ),
                  
                  // Info button
                  FloatingActionButton(
                    heroTag: 'info',
                    onPressed: () {
                      // TODO: Show job details
                    },
                    backgroundColor: AppTheme.infoBlue,
                    child: const Icon(Icons.info_outline, color: AppTheme.primaryWhite),
                  ),
                  
                  // Apply button
                  FloatingActionButton(
                    heroTag: 'apply',
                    onPressed: () {
                      _swiperController.swipe(CardSwiperDirection.right);
                    },
                    backgroundColor: AppTheme.successGreen,
                    child: const Icon(Icons.favorite, color: AppTheme.primaryWhite),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(JobListing job) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company logo and basic info
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppTheme.primaryRed,
                  child: Text(
                    job.company.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      color: AppTheme.primaryWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        job.company,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Location and work type
            Row(
              children: [
                Icon(Icons.location_on_outlined, 
                     size: 16, 
                     color: AppTheme.textSecondary),
                const SizedBox(width: 4),
                Text(job.location, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: job.isRemote ? AppTheme.successGreen : AppTheme.infoBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    job.workType,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.primaryWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Salary and experience
            Row(
              children: [
                Icon(Icons.attach_money, 
                     size: 16, 
                     color: AppTheme.textSecondary),
                const SizedBox(width: 4),
                Text(job.salary, style: Theme.of(context).textTheme.bodyMedium),
                const Spacer(),
                Text(
                  job.experience,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Description
            Text(
              'İş Açıklaması:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              job.description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: 16),
            
            // Requirements
            Text(
              'Gereksinimler:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: job.requirements.map((requirement) {
                return Chip(
                  label: Text(
                    requirement,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  backgroundColor: AppTheme.lightGray,
                );
              }).toList(),
            ),
            
            const Spacer(),
            
            // Apply hint
            Center(
              child: Text(
                'Başvurmak için sağa, geçmek için sola kaydırın',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.work_off_outlined,
            size: 80,
            color: AppTheme.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Şu an için yeni iş ilanı yok',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Yeni iş ilanları için biraz sonra tekrar kontrol edin',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Refresh jobs
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Yenile'),
          ),
        ],
      ),
    );
  }
}

class JobListing {
  final String title;
  final String company;
  final String location;
  final String salary;
  final String workType;
  final String experience;
  final String description;
  final List<String> requirements;
  final bool isRemote;
  final String? companyLogo;

  JobListing({
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.workType,
    required this.experience,
    required this.description,
    required this.requirements,
    required this.isRemote,
    this.companyLogo,
  });
}
