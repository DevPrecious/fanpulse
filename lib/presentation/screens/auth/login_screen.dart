import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/core/constants/app_constants.dart';
import 'package:fanpulse/core/utils/responsive.dart';
import 'package:fanpulse/presentation/controllers/auth_controller.dart';
import 'package:fanpulse/presentation/widgets/custom_button.dart';
import 'package:fanpulse/presentation/widgets/responsive_screen.dart' as rw;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final responsive = context.responsive;

    return Scaffold(
      body: rw.ResponsiveWrapper(
        centerContent: true,
        maxWidth: 500,
        child: SingleChildScrollView(
          padding: responsive.pagePadding,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: responsive.spacing24),
                Row(
                  children: [
                    Text(
                      '⚽️',
                      style: TextStyle(fontSize: responsive.isMobile ? 40 : 48),
                    ),
                    SizedBox(width: responsive.spacing12),
                    Text(
                      AppConstants.appName,
                      style: TextStyle(
                        fontSize: responsive.displayLarge,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: responsive.spacing32 + 16),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: responsive.displayMedium,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                SizedBox(height: responsive.spacing8),
                Text(
                  'Sign in to continue your fan journey',
                  style: TextStyle(
                    fontSize: responsive.bodyLarge,
                    color: AppTheme.textSecondary,
                  ),
                ),
                SizedBox(height: responsive.spacing32 + 8),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: AppTheme.cardBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppTheme.primaryGreen,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => TextFormField(
                    controller: passwordController,
                    obscureText: !controller.isPasswordVisible.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      filled: true,
                      fillColor: AppTheme.cardBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppTheme.primaryGreen,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Row(
                        children: [
                          Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (_) => controller.toggleRememberMe(),
                            activeColor: AppTheme.primaryGreen,
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(color: AppTheme.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Get.toNamed(AppConstants.forgotPasswordRoute),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppTheme.primaryGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primaryGreen,
                          ),
                        )
                      : CustomButton(
                          text: 'Sign In',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.login(
                                emailController.text,
                                passwordController.text,
                              );
                            }
                          },
                        ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: AppTheme.textSecondary),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: AppTheme.textSecondary.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: AppTheme.textSecondary),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Continue with Google',
                  onPressed: () => controller.loginWithGoogle(),
                  isOutlined: true,
                  icon: Icons.g_mobiledata,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 12),
                CustomButton(
                  text: 'Continue with Apple',
                  onPressed: () => controller.loginWithApple(),
                  isOutlined: true,
                  icon: Icons.apple,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: AppTheme.textSecondary),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(AppConstants.signupRoute),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppTheme.primaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
