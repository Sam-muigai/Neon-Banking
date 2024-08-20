
import  'dart:convert';


AuthResponse responseFromJson(String strJson) => AuthResponse.fromMap(json.decode(strJson));

class AuthResponse {
  final String refresh;
  final String access;
  final int userId;
  final bool isMember;
  final bool isActive;
  final bool isWithdrawn;
  final bool hasAcceptedTerms;
  final String profitsStatus;

  AuthResponse({
    required this.refresh,
    required this.access,
    required this.userId,
    required this.isMember,
    required this.isActive,
    required this.isWithdrawn,
    required this.hasAcceptedTerms,
    required this.profitsStatus,
  });

  // Factory constructor to create an instance from a map
  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      refresh: map['refresh'] ?? '',
      access: map['access'] ?? '',
      userId: map['user_id'] ?? 0,
      isMember: map['is_member'] ?? false,
      isActive: map['is_active'] ?? false,
      isWithdrawn: map['is_withdrawn'] ?? false,
      hasAcceptedTerms: map['has_accepted_terms'] ?? false,
      profitsStatus: map['profits_status'] ?? '',
    );
  }

  // Method to convert the instance to a map
  Map<String, dynamic> toMap() {
    return {
      'refresh': refresh,
      'access': access,
      'user_id': userId,
      'is_member': isMember,
      'is_active': isActive,
      'is_withdrawn': isWithdrawn,
      'has_accepted_terms': hasAcceptedTerms,
      'profits_status': profitsStatus,
    };
  }

  // Method to convert the instance to a JSON string
  String toJson() => json.encode(toMap());

  // Factory constructor to create an instance from a JSON string
  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source));
}
abstract class LoginResult {
  final String? errorMessage;
  final AuthResponse? response;

  LoginResult({this.errorMessage, required this.response});
}

class Success extends LoginResult {
  Success({required super.response});
}

class Error extends LoginResult {
  final String error;
  Error({required this.error}) : super(errorMessage: error, response: null);
}

