import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends GetxService {
  static SupabaseService get to => Get.find();

  late final SupabaseClient client;

  Future<SupabaseService> init() async {
    // TODO: Replace with your actual Supabase URL and Anon Key
    const supabaseUrl = 'https://zbeyqpkdymwiwxjutzxh.supabase.co';
    const supabaseAnonKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpiZXlxcGtkeW13aXd4anV0enhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM1MTQxNjksImV4cCI6MjA3OTA5MDE2OX0._e8Rrio1bfbeiv6gGK7p6jmqlQ5w7xtUo7Awfb1IH64';

    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

    client = Supabase.instance.client;
    return this;
  }
}
