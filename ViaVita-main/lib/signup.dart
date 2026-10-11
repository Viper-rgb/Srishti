
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = "";
  String email = "";
  String password = "";

  final _formkey = GlobalKey<FormState>();

  final TextEditingController usernamecontroller =
      TextEditingController();

  final TextEditingController useremailcontroller =
      TextEditingController();

  final TextEditingController userpasswordcontroller =
      TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Firebase Signup
  Future<void> userSignup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Account created successfully",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      );

      // Go back to Login screen
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String message = "Signup failed";

      if (e.code == 'weak-password') {
        message = "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        message = "An account already exists for this email";
      } else if (e.code == 'invalid-email') {
        message = "Please enter a valid email";
      } else if (e.code == 'operation-not-allowed') {
        message = "Email/password authentication is not enabled";
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong. Please try again.",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    useremailcontroller.dispose();
    userpasswordcontroller.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF283793),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image
              Image.asset(
                "assets/above1.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.2,
                fit: BoxFit.cover,
              ),

              // Heading
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Create\nAccount",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontFamily: 'Pacifico',
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Name
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextFormField(
                  controller: usernamecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Name";
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    hintText: "Your Name",
                    hintStyle: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Email
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextFormField(
                  controller: useremailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter E-Mail";
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: "Your Email",
                    hintStyle: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Password
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextFormField(
                  controller: userpasswordcontroller,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Password";
                    }

                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Confirm Password
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Confirm Password";
                    }

                    if (value != userpasswordcontroller.text) {
                      return "Passwords do not match";
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                    ),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Signup Button
              GestureDetector(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    name = usernamecontroller.text.trim();
                    email = useremailcontroller.text.trim();
                    password = userpasswordcontroller.text.trim();

                    userSignup();
                  }
                },
                child: Center(
                  child: Container(
                    width: 160,
                    height: 55,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFf95f3b),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFFf95f3b),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
