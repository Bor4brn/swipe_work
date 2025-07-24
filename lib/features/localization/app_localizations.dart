import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Turkish Translations
  static const Map<String, String> _localizedValues = {
    // App
    'app_name': 'İş Bul - Swipe to Apply',
    'welcome': 'Hoş Geldiniz',
    'get_started': 'Başlayalım',
    'continue': 'Devam Et',
    'skip': 'Geç',
    'next': 'İleri',
    'back': 'Geri',
    'done': 'Tamam',
    'cancel': 'İptal',
    'save': 'Kaydet',
    'delete': 'Sil',
    'edit': 'Düzenle',
    'search': 'Ara',
    'filter': 'Filtrele',
    'apply': 'Başvur',
    'loading': 'Yükleniyor...',
    'error': 'Hata',
    'success': 'Başarılı',
    'retry': 'Tekrar Dene',
    
    // Authentication
    'login': 'Giriş Yap',
    'register': 'Kayıt Ol',
    'logout': 'Çıkış Yap',
    'email': 'E-posta',
    'password': 'Şifre',
    'confirm_password': 'Şifreyi Onayla',
    'forgot_password': 'Şifremi Unuttum',
    'reset_password': 'Şifre Sıfırla',
    'login_with_google': 'Google ile Giriş',
    'dont_have_account': 'Hesabınız yok mu?',
    'already_have_account': 'Zaten hesabınız var mı?',
    
    // Profile
    'profile': 'Profil',
    'personal_info': 'Kişisel Bilgiler',
    'full_name': 'Ad Soyad',
    'phone': 'Telefon',
    'location': 'Konum',
    'birth_date': 'Doğum Tarihi',
    'cv_upload': 'CV Yükle',
    'upload_cv': 'CV Yükleyin',
    'skills': 'Yetenekler',
    'experience': 'Deneyim',
    'education': 'Eğitim',
    'languages': 'Diller',
    'certificates': 'Sertifikalar',
    
    // Jobs
    'jobs': 'İşler',
    'job_title': 'İş Başlığı',
    'company': 'Şirket',
    'salary': 'Maaş',
    'work_type': 'Çalışma Türü',
    'experience_level': 'Deneyim Seviyesi',
    'job_description': 'İş Açıklaması',
    'requirements': 'Gereksinimler',
    'benefits': 'Yan Haklar',
    'swipe_left_skip': 'Geçmek için sola kaydır',
    'swipe_right_apply': 'Başvurmak için sağa kaydır',
    'no_more_jobs': 'Şu an için başka iş yok',
    'refresh_jobs': 'İşleri Yenile',
    
    // Applications
    'applications': 'Başvurularım',
    'application_history': 'Başvuru Geçmişi',
    'applied_date': 'Başvuru Tarihi',
    'application_status': 'Başvuru Durumu',
    'pending': 'Beklemede',
    'viewed': 'Görüntülendi',
    'interview': 'Mülakat',
    'rejected': 'Reddedildi',
    'accepted': 'Kabul Edildi',
    'total_applications': 'Toplam Başvuru',
    'this_week': 'Bu Hafta',
    'this_month': 'Bu Ay',
    
    // Settings
    'settings': 'Ayarlar',
    'account_settings': 'Hesap Ayarları',
    'notification_settings': 'Bildirim Ayarları',
    'privacy_settings': 'Gizlilik Ayarları',
    'language': 'Dil',
    'theme': 'Tema',
    'about': 'Hakkında',
    'contact_support': 'Destek İletişim',
    'terms_of_service': 'Kullanım Şartları',
    'privacy_policy': 'Gizlilik Politikası',
    'kvkk': 'KVKK',
    
    // Onboarding
    'onboarding_title_1': 'İş Aramanın En Kolay Yolu',
    'onboarding_desc_1': 'Tinder tarzı kaydırma ile saniyeler içinde iş başvurusu yapın',
    'onboarding_title_2': 'CV\'nizi Yükleyin, AI Halleder',
    'onboarding_desc_2': 'Yapay zeka CV\'nizi analiz eder ve otomatik olarak başvuru formlarını doldurur',
    'onboarding_title_3': 'Türkiye\'nin En Büyük İş Platformları',
    'onboarding_desc_3': 'Kariyer.net, SecretCV, Yenibiris ve LinkedIn\'de binlerce iş fırsatı',
    
    // Filters
    'filters': 'Filtreler',
    'job_category': 'İş Kategorisi',
    'min_salary': 'Minimum Maaş',
    'max_salary': 'Maksimum Maaş',
    'work_location': 'Çalışma Konumu',
    'remote_work': 'Uzaktan Çalışma',
    'hybrid_work': 'Hibrit Çalışma',
    'on_site': 'Ofiste',
    'clear_filters': 'Filtreleri Temizle',
    'apply_filters': 'Filtreleri Uygula',
    
    // Notifications
    'notifications': 'Bildirimler',
    'new_job_matches': 'Yeni İş Eşleşmeleri',
    'application_updates': 'Başvuru Güncellemeleri',
    'daily_job_digest': 'Günlük İş Özeti',
    'interview_reminders': 'Mülakat Hatırlatıcıları',
    
    // Gamification
    'level': 'Seviye',
    'points': 'Puan',
    'badges': 'Rozetler',
    'streak': 'Seri',
    'first_application_badge': 'İlk Başvuru',
    'consistent_applier_badge': 'Düzenli Başvuran',
    'job_seeker_pro_badge': 'İş Arama Uzmanı',
    'application_master_badge': 'Başvuru Ustası',
    
    // Errors
    'network_error': 'İnternet bağlantısı hatası',
    'server_error': 'Sunucu hatası',
    'invalid_email': 'Geçersiz e-posta adresi',
    'weak_password': 'Şifre çok zayıf',
    'passwords_dont_match': 'Şifreler eşleşmiyor',
    'required_field': 'Bu alan zorunludur',
    'file_too_large': 'Dosya çok büyük',
    'invalid_file_type': 'Geçersiz dosya türü',
    
    // Success Messages
    'profile_updated': 'Profil güncellendi',
    'application_sent': 'Başvuru gönderildi',
    'cv_uploaded': 'CV yüklendi',
    'settings_saved': 'Ayarlar kaydedildi',
    
    // Companies
    'company_size': 'Şirket Büyüklüğü',
    'company_sector': 'Şirket Sektörü',
    'company_website': 'Şirket Web Sitesi',
    'about_company': 'Şirket Hakkında',
    
    // Turkish specific
    'turkish_lira': 'TL',
    'monthly': 'Aylık',
    'yearly': 'Yıllık',
    'net_salary': 'Net Maaş',
    'gross_salary': 'Brüt Maaş',
  };

  String translate(String key) {
    return _localizedValues[key] ?? key;
  }

  // Shorthand getter methods for common translations
  String get appName => translate('app_name');
  String get welcome => translate('welcome');
  String get getStarted => translate('get_started');
  String get login => translate('login');
  String get register => translate('register');
  String get profile => translate('profile');
  String get jobs => translate('jobs');
  String get applications => translate('applications');
  String get settings => translate('settings');
  String get apply => translate('apply');
  String get loading => translate('loading');
  String get error => translate('error');
  String get success => translate('success');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['tr', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
