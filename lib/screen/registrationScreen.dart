import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool _isPasswordVisible = false; // Track visibility for password field
  bool _isConfirmPasswordVisible = false; // Track visibility for confirm password field

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

  // Method to build background
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

  // Method to build the registration form (with validation)
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
                _buildTextField("Full Name", fullNameController, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
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

  // Method to build a single text field with validation
  Widget _buildTextField(String label, TextEditingController controller, String? Function(String?) validator) {
    return TextFormField(
      controller: controller,
      decoration: InptDecoration(label),
      validator: validator,
    );
  }

  // Method to build the password field with visibility toggle
  Widget _buildPasswordField(String label, TextEditingController controller, {bool isConfirm = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isConfirm ? !_isConfirmPasswordVisible : !_isPasswordVisible, // Toggle visibility for password or confirm password
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
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        fillColor: Colors.white12,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2),
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

  // Method to build the age field with numeric validation
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

  // Method to build the phone field with additional validation for 11 digits
  Widget _buildPhoneTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InptDecoration(label),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        // Check if phone number is exactly 11 digits
        String pattern = r'^[0-9]{11}$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return 'Phone number must be 11 digits';
        }
        return null;
      },
    );
  }

  // Method to build the Sign Up button
  Widget _buildSignUpButton(double screenWidth) {
    return Container(
      height: 50,
      width: screenWidth * 0.8, // Make button width responsive
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // If the form is valid, navigate to the login screen
            Navigator.pushNamed(context, "/login");
          }
        },
        child: SuccessButtonChild("Sign up"),
      ),
    );
  }
}
