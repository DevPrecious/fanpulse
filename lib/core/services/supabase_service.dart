import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends GetxService {
  static SupabaseService get to => Get.find();

  late final SupabaseClient client;

  Future<SupabaseService> init() async {
    // TODO: Replace with your actual Supabase URL and Anon Key
    const supabaseUrl = '';
    const supabaseAnonKey = '';

    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

    client = Supabase.instance.client;
    return this;
  }
}
