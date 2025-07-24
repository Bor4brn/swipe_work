import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/themes/app_theme.dart';

// Settings state providers
final notificationsEnabledProvider = StateProvider<bool>((ref) => true);
final darkModeProvider = StateProvider<bool>((ref) => false);
final autoApplyProvider = StateProvider<bool>((ref) => false);
final locationTrackingProvider = StateProvider<bool>((ref) => true);

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
        backgroundColor: AppTheme.backgroundLight,
        foregroundColor: AppTheme.textPrimary,
        elevation: 0,
      ),
      backgroundColor: AppTheme.backgroundLight,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsSection(
            title: 'Uygulama Ayarları',
            children: [
              _buildSwitchTile(
                title: 'Bildirimler',
                subtitle: 'Yeni iş fırsatları için bildirim al',
                icon: Icons.notifications_outlined,
                provider: notificationsEnabledProvider,
              ),
              _buildSwitchTile(
                title: 'Koyu Tema',
                subtitle: 'Karanlık mod kullan',
                icon: Icons.dark_mode_outlined,
                provider: darkModeProvider,
              ),
              _buildSwitchTile(
                title: 'Otomatik Başvuru',
                subtitle: 'Uygun işlere otomatik başvur',
                icon: Icons.auto_awesome_outlined,
                provider: autoApplyProvider,
              ),
              _buildSwitchTile(
                title: 'Konum Takibi',
                subtitle: 'Yakınımdaki işleri göster',
                icon: Icons.location_on_outlined,
                provider: locationTrackingProvider,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSettingsSection(
            title: 'Hesap',
            children: [
              _buildActionTile(
                title: 'Profil Ayarları',
                subtitle: 'Kişisel bilgilerini düzenle',
                icon: Icons.person_outline,
                onTap: () {
                  // TODO: Navigate to profile settings
                  _showComingSoonDialog(context, 'Profil Ayarları');
                },
              ),
              _buildActionTile(
                title: 'CV Yönetimi',
                subtitle: 'CV dosyalarını yönet',
                icon: Icons.description_outlined,
                onTap: () {
                  _showComingSoonDialog(context, 'CV Yönetimi');
                },
              ),
              _buildActionTile(
                title: 'Başvuru Geçmişi',
                subtitle: 'Geçmiş başvurularını görüntüle',
                icon: Icons.history,
                onTap: () {
                  // TODO: Navigate to applications
                  _showComingSoonDialog(context, 'Başvuru Geçmişi');
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSettingsSection(
            title: 'Gizlilik ve Güvenlik',
            children: [
              _buildActionTile(
                title: 'Gizlilik Ayarları',
                subtitle: 'Verilerin nasıl kullanıldığını kontrol et',
                icon: Icons.privacy_tip_outlined,
                onTap: () {
                  _showPrivacyDialog(context);
                },
              ),
              _buildActionTile(
                title: 'KVKK Bildirimi',
                subtitle: 'Kişisel verilerin korunması',
                icon: Icons.security_outlined,
                onTap: () {
                  _showKVKKDialog(context);
                },
              ),
              _buildActionTile(
                title: 'Veri Dışa Aktarma',
                subtitle: 'Verilerini indir',
                icon: Icons.download_outlined,
                onTap: () {
                  _showDataExportDialog(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSettingsSection(
            title: 'Destek',
            children: [
              _buildActionTile(
                title: 'Yardım & Destek',
                subtitle: 'SSS ve iletişim bilgileri',
                icon: Icons.help_outline,
                onTap: () {
                  _showHelpDialog(context);
                },
              ),
              _buildActionTile(
                title: 'Geri Bildirim Gönder',
                subtitle: 'Uygulamayı değerlendir',
                icon: Icons.feedback_outlined,
                onTap: () {
                  _showFeedbackDialog(context);
                },
              ),
              _buildActionTile(
                title: 'Hakkında',
                subtitle: 'Uygulama sürümü ve bilgileri',
                icon: Icons.info_outline,
                onTap: () {
                  _showAboutDialog(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildDangerZone(),
        ],
      ),
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.textSecondary,
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required StateProvider<bool> provider,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final value = ref.watch(provider);
        return ListTile(
          leading: Icon(icon, color: AppTheme.primaryRed),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Switch(
            value: value,
            onChanged: (newValue) {
              ref.read(provider.notifier).state = newValue;
              _showSettingChanged(context, title, newValue);
            },
            activeColor: AppTheme.primaryRed,
          ),
        );
      },
    );
  }

  Widget _buildActionTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryRed),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildDangerZone() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.warning_outlined, color: AppTheme.errorRed),
                SizedBox(width: 8),
                Text(
                  'Tehlikeli Bölge',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.errorRed,
                  ),
                ),
              ],
            ),
          ),
          _buildActionTile(
            title: 'Hesabı Sil',
            subtitle: 'Tüm verilerini kalıcı olarak sil',
            icon: Icons.delete_forever_outlined,
            onTap: () {
              _showDeleteAccountDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showSettingChanged(BuildContext context, String setting, bool enabled) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$setting ${enabled ? "açıldı" : "kapatıldı"}',
        ),
        backgroundColor: enabled ? AppTheme.successGreen : AppTheme.errorRed,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _showComingSoonDialog(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(feature),
        content: Text('$feature özelliği yakında gelecek!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Gizlilik Ayarları'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Gizlilik Kontrolleriniz:'),
              SizedBox(height: 16),
              Text('• Profil görünürlüğü'),
              Text('• Arama geçmişi'),
              Text('• Konum paylaşımı'),
              Text('• Analitik veriler'),
              SizedBox(height: 16),
              Text(
                'Bu ayarlar ile hangi verilerinizin paylaşılacağını kontrol edebilirsiniz.',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Kapat'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ayarları Düzenle'),
          ),
        ],
      ),
    );
  }

  void _showKVKKDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('KVKK Bildirimi'),
        content: const SingleChildScrollView(
          child: Text(
            'Kişisel Verilerin Korunması Kanunu (KVKK) kapsamında:\n\n'
            '• Verileriniz güvenli şekilde saklanır\n'
            '• Üçüncü taraflarla paylaşılmaz\n'
            '• İstediğiniz zaman silebilirsiniz\n'
            '• Verilerin kullanımı konusunda bilgilendirilirsiniz\n\n'
            'Daha fazla bilgi için gizlilik politikamızı inceleyebilirsiniz.',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Kapat'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Gizlilik Politikası'),
          ),
        ],
      ),
    );
  }

  void _showDataExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Veri Dışa Aktarma'),
        content: const Text(
          'Tüm kişisel verilerinizi JSON formatında indirebilirsiniz. '
          'Bu işlem birkaç dakika sürebilir.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Verileriniz hazırlanıyor...'),
                  backgroundColor: AppTheme.infoBlue,
                ),
              );
            },
            child: const Text('İndir'),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Yardım & Destek'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Sık Sorulan Sorular:'),
              SizedBox(height: 12),
              Text('• Nasıl başvuru yaparım?'),
              Text('• Profilimi nasıl düzenlerim?'),
              Text('• Bildirimler nasıl çalışır?'),
              SizedBox(height: 16),
              Text('İletişim:'),
              SizedBox(height: 8),
              Text('Email: destek@isbul.com'),
              Text('Telefon: +90 212 555 0123'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Kapat'),
          ),
        ],
      ),
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    final controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Geri Bildirim'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Uygulamayı nasıl buluyorsunuz? Önerilerinizi bizimle paylaşın.'),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Yorumunuz',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Geri bildiriminiz gönderildi!'),
                  backgroundColor: AppTheme.successGreen,
                ),
              );
            },
            child: const Text('Gönder'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'İş Bul',
      applicationVersion: '1.0.0',
      applicationIcon: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: AppTheme.primaryRed,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.work_outline_rounded,
          color: AppTheme.primaryWhite,
          size: 30,
        ),
      ),
      children: const [
        Text(
          'Türkiye\'nin en akıllı iş arama uygulaması. '
          'Sağa kaydır, başvur, işini bul!',
        ),
        SizedBox(height: 16),
        Text('© 2024 İş Bul Uygulaması'),
      ],
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hesabı Sil'),
        content: const Text(
          'Bu işlem geri alınamaz! Tüm verileriniz kalıcı olarak silinecek. '
          'Devam etmek istediğinizden emin misiniz?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Hesap silme isteği alındı.'),
                  backgroundColor: AppTheme.errorRed,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorRed,
              foregroundColor: AppTheme.primaryWhite,
            ),
            child: const Text('Sil'),
          ),
        ],
      ),
    );
  }
}
