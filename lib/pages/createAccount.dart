import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trek_mate/pages/email_verification_page.dart'; // Import the new EmailVerificationPage

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool _showCheckboxError = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (!_isChecked) {
        setState(() {
          _showCheckboxError = true;
        });
        return;
      }

      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Send verification email
        await userCredential.user!.sendEmailVerification();

        // Navigate to EmailVerificationPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EmailVerificationPage(user: userCredential.user!),
          ),
        );

      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email.';
        } else {
          errorMessage = e.message ?? 'An error occurred. Please try again.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/createAccount.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _firstNameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(255, 255, 255, 0.7),
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty ? "First Name is required" : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _lastNameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(255, 255, 255, 0.7),
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty ? "Last Name is required" : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(255, 255, 255, 0.7),
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty ? "Email is required" : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(255, 255, 255, 0.7),
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty ? "Password is required" : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(255, 255, 255, 0.7),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Confirm Password is required";
                            } else if (value != _passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                  _showCheckboxError = false;
                                });
                              },
                            ),
                            const Expanded(
                              child: Text(
                                "I agree to the Terms and Conditions",
                                style: TextStyle(fontSize: 14, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        if (_showCheckboxError)
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "You must agree to the Terms and Conditions",
                                style: TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: _submitForm,
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}