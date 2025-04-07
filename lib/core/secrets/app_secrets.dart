import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSecrets {
  static String env(String key) =>
      dotenv.env[key] ??
      (throw Exception('$key not found in environment variables'));

  static String get supabaseUrl => env('SUPABASE_URL');
  static String get supabaseAnnonKey => env('SUPABASE_ANON_KEY');
}
