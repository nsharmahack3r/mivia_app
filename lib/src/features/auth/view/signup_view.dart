import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mivia/src/features/auth/view/login_view.dart';
import 'package:mivia/src/resources/assets.gen.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  static const routePath = "/signup";

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D1B2A), Color(0xFF1B2D45), Color(0xFF253A56)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.04),
                Assets.icons.icon.image(width: 64, height: 64),
                const SizedBox(height: 12),
                Text(
                  'Create Account',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Join the driving community',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white60,
                    letterSpacing: 0.8,
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                _buildTextField(
                  controller: _nameController,
                  hint: 'Full Name',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  hint: 'Email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _passwordController,
                  hint: 'Password',
                  icon: Icons.lock_outline,
                  obscure: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white38,
                      size: 20,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _confirmPasswordController,
                  hint: 'Confirm Password',
                  icon: Icons.lock_outline,
                  obscure: _obscureConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white38,
                      size: 20,
                    ),
                    onPressed: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _agreedToTerms,
                        onChanged: (v) =>
                            setState(() => _agreedToTerms = v ?? false),
                        activeColor: const Color(0xFF2979FF),
                        checkColor: Colors.white,
                        side: const BorderSide(color: Colors.white38),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            setState(() => _agreedToTerms = !_agreedToTerms),
                        child: RichText(
                          text: const TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color: Color(0xFF64B5F6),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Color(0xFF64B5F6),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _agreedToTerms ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2979FF),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: const Color(
                        0xFF2979FF,
                      ).withValues(alpha: 0.3),
                      disabledForegroundColor: Colors.white38,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: _agreedToTerms ? 4 : 0,
                      shadowColor: const Color(
                        0xFF2979FF,
                      ).withValues(alpha: 0.4),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                Row(
                  children: [
                    Expanded(
                      child: Container(height: 1, color: Colors.white12),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        'or sign up with',
                        style: TextStyle(color: Colors.white38, fontSize: 13),
                      ),
                    ),
                    Expanded(
                      child: Container(height: 1, color: Colors.white12),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SocialButton(
                      onTap: () {},
                      backgroundColor: Colors.white,
                      child: Assets.icons.google.image(width: 24, height: 24),
                    ),
                    const SizedBox(width: 20),
                    _SocialButton(
                      onTap: () {},
                      backgroundColor: Colors.black,
                      child: const Icon(
                        Icons.apple,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 20),
                    _SocialButton(
                      onTap: () {},
                      backgroundColor: const Color(0xFF1877F2),
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushReplacement(LoginView.routePath);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF64B5F6),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      cursorColor: const Color(0xFF64B5F6),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white30, fontSize: 15),
        prefixIcon: Icon(icon, color: Colors.white38, size: 20),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.07),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF2979FF), width: 1.5),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.onTap,
    required this.backgroundColor,
    required this.child,
  });

  final VoidCallback onTap;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
