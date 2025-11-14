import 'package:flutter/material.dart';
import 'form_field.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  String? _validateName(String? v) {
    if (v == null || v.trim().isEmpty) return 'Please enter your name';
    return null;
  }

  String? _validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Please enter an email';
    final email = v.trim();
    final emailRegex = RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$");
    if (!emailRegex.hasMatch(email)) return 'Please enter a valid email';
    return null;
  }

  String? _validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Please enter a password';
    if (v.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  String? _validateConfirm(String? v) {
    if (v == null || v.isEmpty) return 'Please confirm your password';
    if (v != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomFormField(
              controller: _nameController,
              labelText: 'Full name',
              validator: _validateName,
            ),
            const SizedBox(height: 12),
            CustomFormField(
              controller: _emailController,
              labelText: 'Email',
              validator: _validateEmail,
            ),
            const SizedBox(height: 12),
            CustomFormField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
              validator: _validatePassword,
            ),
            const SizedBox(height: 12),
            CustomFormField(
              controller: _confirmController,
              labelText: 'Confirm password',
              obscureText: true,
              validator: _validateConfirm,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
