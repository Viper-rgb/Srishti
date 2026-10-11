import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/Providers/forget_password_provider.dart';




class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final forgotProvider = Provider.of<ForgotPasswordProvider>(context);

    return Scaffold(
      backgroundColor: colors.background_color,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'Forget Password?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Enter your E-Mail to get reset instructions',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 40),

              // EMAIL FIELD
              const Text(
                'Email ID',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  style: TextStyle(fontSize: 14),
                  controller: emailController,
                  validator: (v) => v!.isEmpty ? "Enter email" : null,
                  decoration: const InputDecoration(
                    hintText: 'Email ID',
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // BUTTON
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [colors.app_color_1, colors.app_color_2],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: forgotProvider.isLoading
                    ? const Center(child: CircularProgressIndicator(color: Colors.white))
                    : InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            bool ok = await forgotProvider.sendResetRequest(
                                emailController.text.trim(), context);

                            if (ok) {
                            
                            }
                          }
                        },
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
