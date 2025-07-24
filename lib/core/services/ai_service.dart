import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_constants.dart';
import '../../features/jobs/data/models/job_model.dart';

// Provider for OpenAI service
final openAIServiceProvider = Provider<OpenAIService>((ref) {
  return OpenAIService();
});

class OpenAIService {
  OpenAIService() {
    // Initialize OpenAI with API key
    OpenAI.apiKey = AppConstants.openAIApiKey;
  }

  /// Generate a personalized cover letter for a job application
  Future<String> generateCoverLetter({
    required JobModel job,
    required UserProfile userProfile,
  }) async {
    try {
      final prompt = _buildCoverLetterPrompt(job, userProfile);
      
      final completion = await OpenAI.instance.completion.create(
        model: "gpt-3.5-turbo-instruct",
        prompt: prompt,
        maxTokens: 500,
        temperature: 0.7,
      );

      return completion.choices.first.text.trim();
    } catch (e) {
      throw AIServiceException('Cover letter generation failed: $e');
    }
  }

  /// Parse CV content and extract structured information
  Future<CVData> parseCVContent(String cvText) async {
    try {
      final prompt = _buildCVParsingPrompt(cvText);
      
      final completion = await OpenAI.instance.completion.create(
        model: "gpt-3.5-turbo-instruct",
        prompt: prompt,
        maxTokens: 800,
        temperature: 0.3,
      );

      // Parse the response into structured CV data
      return _parseCVResponse(completion.choices.first.text);
    } catch (e) {
      throw AIServiceException('CV parsing failed: $e');
    }
  }

  /// Generate answers to common job application questions
  Future<Map<String, String>> answerApplicationQuestions({
    required List<String> questions,
    required JobModel job,
    required UserProfile userProfile,
  }) async {
    try {
      final answers = <String, String>{};
      
      for (final question in questions) {
        final prompt = _buildQuestionAnswerPrompt(question, job, userProfile);
        
        final completion = await OpenAI.instance.completion.create(
          model: "gpt-3.5-turbo-instruct",
          prompt: prompt,
          maxTokens: 200,
          temperature: 0.6,
        );

        answers[question] = completion.choices.first.text.trim();
      }

      return answers;
    } catch (e) {
      throw AIServiceException('Question answering failed: $e');
    }
  }

  /// Optimize CV content for ATS (Applicant Tracking Systems)
  Future<String> optimizeCVForATS({
    required String originalCV,
    required JobModel job,
  }) async {
    try {
      final prompt = _buildATSOptimizationPrompt(originalCV, job);
      
      final completion = await OpenAI.instance.completion.create(
        model: "gpt-3.5-turbo-instruct",
        prompt: prompt,
        maxTokens: 1000,
        temperature: 0.4,
      );

      return completion.choices.first.text.trim();
    } catch (e) {
      throw AIServiceException('ATS optimization failed: $e');
    }
  }

  // Private helper methods

  String _buildCoverLetterPrompt(JobModel job, UserProfile userProfile) {
    return '''
Türkçe bir kapak mektubu yazın. 

İş İlanı:
- Pozisyon: ${job.title}
- Şirket: ${job.company}
- Konum: ${job.location}
- Açıklama: ${job.description}
- Gereksinimler: ${job.requirements ?? 'Belirtilmemiş'}

Aday Profili:
- Ad: ${userProfile.fullName}
- Deneyim: ${userProfile.experience}
- Yetenekler: ${userProfile.skills.join(', ')}
- Eğitim: ${userProfile.education}

Lütfen profesyonel, kişisel ve bu iş için özel olarak yazılmış bir kapak mektubu oluşturun. Türk iş kültürüne uygun ve samimi bir ton kullanın.
''';
  }

  String _buildCVParsingPrompt(String cvText) {
    return '''
Aşağıdaki CV metnini analiz edin ve yapılandırılmış bilgileri çıkarın:

$cvText

Lütfen şu bilgileri JSON formatında döndürün:
{
  "personalInfo": {
    "fullName": "",
    "email": "",
    "phone": "",
    "location": "",
    "birthDate": ""
  },
  "experience": [
    {
      "jobTitle": "",
      "company": "",
      "startDate": "",
      "endDate": "",
      "description": ""
    }
  ],
  "education": [
    {
      "degree": "",
      "school": "",
      "startDate": "",
      "endDate": "",
      "gpa": ""
    }
  ],
  "skills": [],
  "languages": [],
  "certificates": []
}
''';
  }

  String _buildQuestionAnswerPrompt(String question, JobModel job, UserProfile userProfile) {
    return '''
Aşağıdaki iş başvuru sorusunu Türkçe olarak cevaplayın:

Soru: $question

İş Bilgileri:
- Pozisyon: ${job.title}
- Şirket: ${job.company}

Aday Profili:
- Deneyim: ${userProfile.experience}
- Yetenekler: ${userProfile.skills.join(', ')}

Kısa, profesyonel ve samimi bir cevap verin. Adayın niteliklerini bu iş için nasıl uygun olduğunu vurgulayın.
''';
  }

  String _buildATSOptimizationPrompt(String originalCV, JobModel job) {
    return '''
Bu CV'yi ATS (Applicant Tracking System) uyumlu hale getirin:

Orijinal CV:
$originalCV

Hedef İş:
- Pozisyon: ${job.title}
- Gereksinimler: ${job.requirements ?? ''}
- Yetenekler: ${job.skills.join(', ')}

Lütfen:
1. İş ilanındaki anahtar kelimeleri CV'ye entegre edin
2. ATS tarafından kolayca okunabilir formatı kullanın
3. İlgili yetenekleri öne çıkarın
4. Türkçe karakterleri koruyun

Optimize edilmiş CV'yi döndürün.
''';
  }

  CVData _parseCVResponse(String response) {
    // TODO: Implement JSON parsing of CV data
    // This is a simplified version
    return CVData(
      fullName: 'Parsed Name',
      email: 'parsed@email.com',
      phone: '+90 XXX XXX XX XX',
      skills: ['Flutter', 'Dart', 'Firebase'],
      experience: 'Parsed experience summary',
      education: 'Parsed education summary',
    );
  }
}

// Data classes

class UserProfile {
  final String fullName;
  final String experience;
  final List<String> skills;
  final String education;

  UserProfile({
    required this.fullName,
    required this.experience,
    required this.skills,
    required this.education,
  });
}

class CVData {
  final String fullName;
  final String email;
  final String phone;
  final List<String> skills;
  final String experience;
  final String education;

  CVData({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.skills,
    required this.experience,
    required this.education,
  });
}

class AIServiceException implements Exception {
  final String message;
  AIServiceException(this.message);

  @override
  String toString() => 'AIServiceException: $message';
}
