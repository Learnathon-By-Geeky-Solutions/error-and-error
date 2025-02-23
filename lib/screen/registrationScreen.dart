import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        final supabase = Supabase.instance.client;
        await supabase.auth.signUp(
          email: emailController.text.trim(),
          password: passwordController.text,
        );

        // Navigate to success screen
        Navigator.pushNamed(context, "/success");
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed: ${e.toString()}")),
        );
      }

      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(screenHeight, screenWidth),
          _buildRegistrationForm(screenHeight, screenWidth),
        ],
      ),
    );
  }

  Widget _buildBackground(double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: backgroundStyle(),
      child: Padding(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 30),
        child: Text(
          "Registration\nAnd go ahead",
          style: headerText(),
        ),
      ),
    );
  }

  Widget _buildRegistrationForm(double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(top: 200),
      child: Container(
        decoration: loginFild(),
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField("Email", emailController, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                }),
                SizedBox(height: 10),
                _buildPasswordField("Password", passwordController),
                SizedBox(height: 10),
                _buildPasswordField("Confirm Password", confirmPasswordController, isConfirm: true),
                SizedBox(height: 10),
                _buildAgeTextField("Age", ageController),
                SizedBox(height: 10),
                _buildPhoneTextField("Phone", phoneController),
                SizedBox(height: 40),
                _buildSignUpButton(screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, String? Function(String?) validator) {
    return TextFormField(
      controller: controller,
      decoration: InptDecoration(label),
      validator: validator,
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller, {bool isConfirm = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isConfirm ? !_isConfirmPasswordVisible : !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(
            (isConfirm ? _isConfirmPasswordVisible : _isPasswordVisible) ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              if (isConfirm) {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              } else {
                _isPasswordVisible = !_isPasswordVisible;
              }
            });
          },
        ),
        border: OutlineInputBorder(),
        labelStyle: inputTextStyle(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (isConfirm && value != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget _buildAgeTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InptDecoration(label),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your age';
        }
        if (int.tryParse(value) == null) {
          return 'Age must be a number';
        }
        return null;
      },
    );
  }

  Widget _buildPhoneTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InptDecoration(label),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        String pattern = r'^[0-9]{11}$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return 'Phone number must be 11 digits';
        }
        return null;
      },
    );
  }

  Widget _buildSignUpButton(double screenWidth) {
    return Container(
      height: 50,
      width: screenWidth * 0.8,
      decoration: backgroundButtonStyle(), // Apply gradient from style.dart
      child: ElevatedButton(
        onPressed: _isLoading ? null : _signUp,
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent), // Transparent background for gradient container
          elevation: MaterialStateProperty.all(0), // Remove elevation for flat appearance
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }

}
