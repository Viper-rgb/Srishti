import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  Future<void> register() async {
    const url =
        'http://campus.sicsglobal.co.in/Project/communitygarden/api/user_registration.php';

    final body = {
      'firstname': firstnameController.text,
      'lastname': lastnameController.text,
      'email': mailController.text,
      'phone': phoneController.text,
      'password': passwordController.text,
      'state': stateController.text,
      'city': cityController.text,
    };

    try {
      final response = await http.post(Uri.parse(url), body: body);
      final jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color.fromARGB(255, 23, 77, 25),
              content: Text(
                'Registration Successful!',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: Duration(seconds: 4),
            ),
          );
          // Navigate to next screen if needed
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const Categorydesign2()));
        } else {
          _showErrorSnackBar('Registration failed: ${jsonData['message'] ?? 'Unknown error'}');
        }
      } else {
        _showErrorSnackBar('Server error: ${response.statusCode}');
      }
    } catch (error) {
      _showErrorSnackBar('An error occurred: $error');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[700],
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField("First Name", Icons.person, firstnameController),
              _buildTextField("Last Name", Icons.person, lastnameController),
              _buildTextField("Email", Icons.email, mailController, keyboardType: TextInputType.emailAddress),
              _buildTextField("Phone", Icons.phone, phoneController, keyboardType: TextInputType.phone),
              _buildTextField("Password", Icons.lock, passwordController, obscureText: true),
              _buildTextField("State", Icons.place, stateController),
              _buildTextField("City", Icons.location_city, cityController),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      register();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Register", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    IconData icon,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'Please enter your $label' : null,
      ),
    );
  }
}