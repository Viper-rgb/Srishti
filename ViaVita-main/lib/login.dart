
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workers_app/screens/home_dashboard_screen.dart';
import 'package:workers_app/signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "";
  String password = "";

  final _formkey = GlobalKey<FormState>();

  final TextEditingController useremailcontroller =
      TextEditingController();

  final TextEditingController userpasswordcontroller =
      TextEditingController();

  // Firebase Login
  Future<void> userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeDashboardScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = "Login failed";

      if (e.code == 'user-not-found') {
        message = "No User Found for that Email";
      } else if (e.code == 'wrong-password') {
        message = "Wrong Password Provided by User";
      } else if (e.code == 'invalid-credential') {
        message = "Invalid email or password";
      } else if (e.code == 'invalid-email') {
        message = "Please enter a valid email";
      } else if (e.code == 'user-disabled') {
        message = "This user account has been disabled";
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 18.0,
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
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    useremailcontroller.dispose();
    userpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF283793),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/above1.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.9,
                  fit: BoxFit.cover,
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Welcome\nBack",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34.0,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                // Email
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4c59a5),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: TextFormField(
                    controller: useremailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter E-Mail';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintText: 'Your Email',
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                // Password
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4c59a5),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: TextFormField(
                    controller: userpasswordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.white,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: true,
                  ),
                ),

                const SizedBox(
                  height: 15.0,
                ),

                // Forgot Password
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ForgotPassword(),
                    //   ),
                    // );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 24.0,
                    ),
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                // Login Button
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      email = useremailcontroller.text.trim();
                      password = userpasswordcontroller.text.trim();

                      userLogin();
                    }
                  },
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 55,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFf95f3b),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                // Signup
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New User?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),

                    const SizedBox(
                      width: 5.0,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                      child: const Text(
                        " Signup",
                        style: TextStyle(
                          color: Color(0xFFf95f3b),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                // Google Login Button
                Center(
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () {
                        // Google login will be added here
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google.png',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
