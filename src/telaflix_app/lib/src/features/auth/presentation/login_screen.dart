import 'dart:ui';

import 'package:flutter/material.dart';

import '../../home/presentation/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  void _openHomeScreen() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFF07070A)),
        child: Stack(
          children: [
            const Positioned.fill(child: _BackgroundAtmosphere()),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 48),
                          Image.asset(
                            'assets/images/logo.png',
                            width: constraints.maxWidth < 380 ? 220 : 256,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 42),
                          const Text(
                            'Acesse sua conta',
                            style: TextStyle(
                              color: Color(0xFF777785),
                              fontSize: 14,
                              height: 20 / 14,
                            ),
                          ),
                          const SizedBox(height: 32),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 384),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 12,
                                  sigmaY: 12,
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: const Color(0xB3181820),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white.withValues(
                                        alpha: 0.08,
                                      ),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x66000000),
                                        blurRadius: 24,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      const Positioned(
                                        top: 0,
                                        left: 96,
                                        right: 96,
                                        child: _AccentLine(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const _LoginField(),
                                            const SizedBox(height: 16),
                                            _PasswordField(
                                              isPasswordVisible:
                                                  _isPasswordVisible,
                                              onToggle: () {
                                                setState(() {
                                                  _isPasswordVisible =
                                                      !_isPasswordVisible;
                                                });
                                              },
                                            ),
                                            const SizedBox(height: 24),
                                            _LoginButton(
                                              onPressed: _openHomeScreen,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 48),
                          const Text(
                            '© 2024 Telaflix Entertainment',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0x66777785),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              height: 12 / 10,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundAtmosphere extends StatelessWidget {
  const _BackgroundAtmosphere();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            const Color(0xFFFFB3AE).withValues(alpha: 0.05),
            Colors.transparent,
          ],
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.9,
            colors: [Colors.transparent, const Color(0xFF0E0E11)],
          ),
        ),
      ),
    );
  }
}

class _AccentLine extends StatelessWidget {
  const _AccentLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Color(0xFFC2272D), Colors.transparent],
        ),
      ),
    );
  }
}

class _LoginField extends StatelessWidget {
  const _LoginField();

  @override
  Widget build(BuildContext context) {
    return const _LabeledTextField(
      key: Key('login-field'),
      label: 'LOGIN OU EMAIL',
      hintText: 'exemplo@email.com',
      icon: Icons.person_outline,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.isPasswordVisible,
    required this.onToggle,
  });

  final bool isPasswordVisible;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return _LabeledTextField(
      key: const Key('password-field'),
      label: 'SENHA',
      hintText: '••••••••',
      icon: Icons.lock_outline,
      obscureText: !isPasswordVisible,
      suffix: IconButton(
        key: const Key('toggle-password-visibility'),
        onPressed: onToggle,
        icon: Icon(
          isPasswordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: const Color(0xFF777785),
          size: 20,
        ),
      ),
    );
  }
}

class _LabeledTextField extends StatelessWidget {
  const _LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.suffix,
  });

  final String label;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF777785),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
              height: 12 / 10,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color(0xFF777785).withValues(alpha: 0.5),
            ),
            prefixIcon: Icon(icon, color: const Color(0xFF777785)),
            suffixIcon: suffix,
            filled: true,
            fillColor: const Color(0xFF111116),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF2C2C36)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFFFB3AE)),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFF47A19), Color(0xFFC2272D), Color(0xFF7B0F12)],
          stops: [0, 0.55, 1],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.8,
                  height: 16 / 12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
