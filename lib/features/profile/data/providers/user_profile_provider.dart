import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_profile.dart';

// User Profile state provider
final userProfileProvider = StateNotifierProvider<UserProfileNotifier, UserProfile?>((ref) {
  return UserProfileNotifier();
});

class UserProfileNotifier extends StateNotifier<UserProfile?> {
  UserProfileNotifier() : super(null) {
    // Initialize with default profile
    _initializeDefaultProfile();
  }

  void _initializeDefaultProfile() {
    state = UserProfile(
      id: 'default_user',
      fullName: 'Kullanıcı Adı',
      email: 'user@example.com',
      phone: '+90 555 123 45 67',
      location: 'İstanbul, Türkiye',
      jobTitle: 'Flutter Developer',
      bio: 'Mobil uygulama geliştirme konusunda tutkulu bir geliştirici.',
      skills: ['Flutter', 'Dart', 'Firebase', 'REST API'],
      experienceYears: 3,
      educationLevel: 'Lisans',
      preferredCategories: ['Yazılım Geliştirme', 'Mobil Uygulama'],
      preferredLocations: ['İstanbul', 'Ankara', 'İzmir'],
      expectedSalaryMin: 15000,
      expectedSalaryMax: 25000,
      isRemotePreferred: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  void updateProfile({
    String? fullName,
    String? email,
    String? phone,
    String? profileImageUrl,
    String? location,
    String? jobTitle,
    String? bio,
    List<String>? skills,
    String? cvUrl,
    int? experienceYears,
    String? educationLevel,
    List<String>? preferredCategories,
    List<String>? preferredLocations,
    double? expectedSalaryMin,
    double? expectedSalaryMax,
    bool? isRemotePreferred,
  }) {
    if (state != null) {
      state = state!.copyWith(
        fullName: fullName,
        email: email,
        phone: phone,
        profileImageUrl: profileImageUrl,
        location: location,
        jobTitle: jobTitle,
        bio: bio,
        skills: skills,
        cvUrl: cvUrl,
        experienceYears: experienceYears,
        educationLevel: educationLevel,
        preferredCategories: preferredCategories,
        preferredLocations: preferredLocations,
        expectedSalaryMin: expectedSalaryMin,
        expectedSalaryMax: expectedSalaryMax,
        isRemotePreferred: isRemotePreferred,
        updatedAt: DateTime.now(),
      );
    }
  }

  void clearProfile() {
    state = null;
  }
}
