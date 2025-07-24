class AppConstants {
  // App Information
  static const String appName = 'İş Bul - Swipe to Apply';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Türkiye\'nin en hızlı iş bulma uygulaması';
  
  // API Configuration
  static const String baseUrl = 'https://api.swipe-apply-tr.com';
  static const String apiVersion = 'v1';
  
  // OpenAI Configuration
  static const String openAIApiKey = 'YOUR_OPENAI_API_KEY'; // Replace with actual key
  
  // Turkish Job Board APIs
  static const String kariyerNetApi = 'https://www.kariyer.net/api';
  static const String secretCVApi = 'https://www.secretcv.com/api';
  static const String yenibirisCom = 'https://www.yenibiris.com/api';
  
  // International Job Boards
  static const String linkedInApi = 'https://api.linkedin.com';
  static const String indeedApi = 'https://indeed.com/api';
  
  // Company Enrichment APIs
  static const String clearbitApi = 'https://api.clearbit.com';
  static const String zoomInfoApi = 'https://api.zoominfo.com';
  
  // Storage Keys
  static const String userProfileKey = 'user_profile';
  static const String cvDataKey = 'cv_data';
  static const String applicationHistoryKey = 'application_history';
  static const String settingsKey = 'app_settings';
  static const String onboardingKey = 'onboarding_completed';
  
  // Application Limits
  static const int maxApplicationsPerDay = 50;
  static const int maxApplicationsPerHour = 10;
  
  // File Upload
  static const int maxFileSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedFileTypes = ['pdf', 'doc', 'docx'];
  
  // Gamification
  static const int pointsPerApplication = 10;
  static const int streakBonusPoints = 5;
  static const Map<String, int> badgeRequirements = {
    'first_application': 1,
    'consistent_applier': 10,
    'job_seeker_pro': 50,
    'application_master': 100,
  };
  
  // Turkish Cities for Location Filter
  static const List<String> turkishCities = [
    'İstanbul',
    'Ankara',
    'İzmir',
    'Bursa',
    'Antalya',
    'Adana',
    'Konya',
    'Şanlıurfa',
    'Gaziantep',
    'Kocaeli',
    'Mersin',
    'Diyarbakır',
    'Hatay',
    'Manisa',
    'Kayseri',
    'Samsun',
    'Balıkesir',
    'Kahramanmaraş',
    'Van',
    'Aydın',
    'Tekirdağ',
    'Sakarya',
    'Denizli',
    'Muğla',
    'Eskişehir',
  ];
  
  // Job Categories (Turkish)
  static const List<String> jobCategories = [
    'Bilişim Teknolojileri',
    'Mühendislik',
    'Pazarlama ve Satış',
    'Finans ve Muhasebe',
    'İnsan Kaynakları',
    'Sağlık',
    'Eğitim',
    'Hukuk',
    'Turizm ve Otelcilik',
    'Lojistik ve Nakliye',
    'Üretim ve İmalat',
    'Medya ve İletişim',
    'Bankacılık ve Sigortacılık',
    'Gayrimenkul',
    'Perakende',
    'Danışmanlık',
    'Gıda ve İçecek',
    'Tekstil',
    'Otomotiv',
    'İnşaat',
  ];
  
  // Experience Levels (Turkish)
  static const List<String> experienceLevels = [
    'Stajyer',
    '0-1 yıl',
    '1-3 yıl',
    '3-5 yıl',
    '5-8 yıl',
    '8-10 yıl',
    '10+ yıl',
    'Üst Düzey Yönetici',
  ];
  
  // Work Types (Turkish)
  static const List<String> workTypes = [
    'Tam Zamanlı',
    'Yarı Zamanlı',
    'Sözleşmeli',
    'Staj',
    'Freelance',
    'Uzaktan Çalışma',
    'Hibrit',
  ];
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Network Timeouts
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  
  // Privacy & Security
  static const String privacyPolicyUrl = 'https://swipe-apply-tr.com/privacy';
  static const String termsOfServiceUrl = 'https://swipe-apply-tr.com/terms';
  static const String kvkkUrl = 'https://swipe-apply-tr.com/kvkk';
  
  // Support
  static const String supportEmail = 'destek@swipe-apply-tr.com';
  static const String supportPhone = '+90 555 123 45 67';
  
  // Social Media
  static const String instagramUrl = 'https://instagram.com/swipeapplytr';
  static const String twitterUrl = 'https://twitter.com/swipeapplytr';
  static const String linkedInUrl = 'https://linkedin.com/company/swipeapplytr';
}
