import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  // Method to build background
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

  // Method to build the login form (email, password, and login button)
  Widget _buildLoginForm(double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(top: 250),
      child: Container(
        decoration: loginFild(),
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Padding(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
      ),
    );
  }

  // Method to build the email field with validation
  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      decoration: AppInptDecoration("Email", Icons.check),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email';
        }
        // TO DO Auth using Supabase
        return null;
      },
    );
  }

  // Method to build the password field with visibility toggle
  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: !_isPasswordVisible, // Toggle the visibility based on _isPasswordVisible
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible; // Toggle the password visibility
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
          return 'Please enter a password';
        }
        return null;
      },
    );
  }

  // Method to build the 'Forgot Password?' button
  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          /// TO DO FORGOT FUNCTION
        },
        child: Text(
          "Forgot Password?",
          style: inputTextStyle(),
        ),
      ),
    );
  }

  // Method to build the Login button
  Widget _buildLoginButton(double screenWidth) {
    return Container(
      height: 55,
      width: screenWidth * 0.8, // Responsive width
      decoration: backgroundButtonStyle(),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Proceed with login action
          }
        },
        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20)),
        style: elevetedButtonStyle(),
      ),
    );
  }

  // Method to build the 'Don't have an account?' text and sign-up link
  Widget _buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: TextStyle(color: Colors.grey, fontSize: 14)),
        SizedBox(height: 10),
        TextButton(onPressed: (){
          Navigator.pushNamed(context, "/registration");
        }, child: Text("Sing Up",style: inputTextStyle(),))
        // Text("Sign up", style: inputTextStyle()),
      ],
    );
  }

  // Method to build the social media icons
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

  // Method to build the "Sign in with Social Media" text
  Widget _buildSocialMediaText() {
    return Text(
      "Sign in with Social Media",
      style: TextStyle(color: Colors.grey, fontSize: 14),
    );
  }
}
