import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false; // Track visibility of password
  bool _isLoading = false; // Track loading state

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        final supabase = Supabase.instance.client;
        await supabase.auth.signInWithPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
        );

        // Navigate to success screen
        Navigator.pushNamed(context, "/success");
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${e.toString()}")),
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
          _buildLoginForm(screenHeight, screenWidth),
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
        padding: EdgeInsets.only(top: 60, left: 22),
        child: Text(
          "Hello\nSign in",
          style: headerText(),
        ),
      ),
    );
  }

  Widget _buildLoginForm(double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(top: 250),
      child: Container(
        decoration: loginFild(),
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildEmailField(),
                SizedBox(height: 10),
                _buildPasswordField(),
                SizedBox(height: 20),
                _buildForgotPassword(),
                SizedBox(height: 40),
                _buildLoginButton(screenWidth),
                SizedBox(height: 20),
                _buildSignUpText(),
                SizedBox(height: 70),
                _buildSocialMediaIcons(),
                SizedBox(height: 20),
                _buildSocialMediaText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      decoration: AppInptDecoration("Email", Icons.check),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        border: OutlineInputBorder(),
        labelStyle: inputTextStyle(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton(double screenWidth) {
    return Container(
      height: 55,
      width: screenWidth * 0.8, // Make button width responsive
      decoration: backgroundButtonStyle(), // Apply gradient from style.dart
      child: ElevatedButton(
        onPressed: _isLoading ? null : _login,
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text("Login", style: TextStyle(color: Colors.white, fontSize: 20)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent), // Transparent background for gradient container
          elevation: MaterialStateProperty.all(0), // Remove elevation for flat appearance
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }


  Widget _buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: TextStyle(color: Colors.grey, fontSize: 14)),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, "/registration"),
          child: Text("Sign Up", style: inputTextStyle()),
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text("Forgot Password?", style: inputTextStyle()),
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.facebook, color: Colors.blue),
        SizedBox(width: 10),
        Icon(FontAwesomeIcons.instagram, color: Colors.redAccent),
        SizedBox(width: 10),
        Icon(FontAwesomeIcons.google, color: Colors.green),
        SizedBox(width: 10),
        Icon(FontAwesomeIcons.github, color: Colors.black),
        SizedBox(width: 10),
        Icon(FontAwesomeIcons.twitter, color: Colors.blue),
        SizedBox(width: 10),
        Icon(FontAwesomeIcons.linkedin, color: Colors.orange),
      ],
    );
  }

  Widget _buildSocialMediaText() {
    return Text(
      "Sign in with Social Media",
      style: TextStyle(color: Colors.grey, fontSize: 14),
    );
  }
}
