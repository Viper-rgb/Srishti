import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:via_vita_mobile_app/API/regsiter_provider.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/color/colors.dart';
import 'package:via_vita_mobile_app/screens/LoginScreen/login_screen.dart';



class SkRegisterscreen extends StatefulWidget {
 //  final Map<String, dynamic> registrationData;
  const SkRegisterscreen({super.key, });

  @override
  _SkRegisterscreenState createState() => _SkRegisterscreenState();
}

class _SkRegisterscreenState extends State<SkRegisterscreen> {
  
  String? _selectedGender;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController=TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
 
//focus while enter
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus=FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

//checkbox status
  bool current = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
 
    FocusNode().dispose();
    super.dispose();
  }

 void validateAndSubmit(BuildContext context) {
    // Basic validation example (you'll want more comprehensive validation)
    if (_nameController.text.isEmpty ||
        _selectedGender == null ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all required fields.')),
      );
      return; // Stop if validation fails
    }

    // Create registration data map
    final Map<String, dynamic> registrationData = {
      'name': _nameController.text,
      'gender': _selectedGender, // Now correctly uses _selectedGender
      'phone_number': _phoneController.text,
      'email': _emailController.text,
      'address': _addressController.text,
      'password': _passwordController.text,
      'avatar': _profileImage, // Pass the File object directly
    };

    // Navigate and pass data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (_) => UserRegistrationProvider(),
        //   child: CreateAccountScreen(
        // //    registrationData: registrationData, // Pass the data here
        //   ),
        ),
      ),
    );
  }

//store image & file path
  File? _profileImage;

//select image
  final ImagePicker _picker = ImagePicker();
  void _showImageSourceSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ImageSourceSheet(
        onImagePicked: (source) async {
          final pickedFile = await _picker.pickImage(source: source);
          if (pickedFile != null) {
            setState(() {
              _profileImage = File(pickedFile.path);
            });
          }
          Navigator.of(context).pop();
        },
      ),
    );
  }



      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: colors.background_color,
    
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70),
            Center(
              child: const Text(
                'Create a new account',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                 CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(Images.profile_image),
                 ),
                  const SizedBox(height: 8),
                  Text(
                    '+ Add Image',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
           // _buildInputField('Name', 'Name', Icons.person_outline,_nameController),
            const SizedBox(height: 20),
          
           
            const SizedBox(height: 20),
            _buildInputField('Phone Number', 'Phone Number', Icons.phone_outlined,_phoneController),
            const SizedBox(height: 20),
            _buildInputField('Email ID', 'Email ID', Icons.email_outlined,_emailController),
            const SizedBox(height: 20),
            _buildInputField('Address', 'Address', Icons.location_on_outlined,_addressController),
            const SizedBox(height: 20),
            _buildPasswordField('Password', 'Password', Icons.lock_outline, _isPasswordVisible, (bool value) {
              setState(() {
                _isPasswordVisible = value;
              });
            },_passwordController),
            const SizedBox(height: 20),
            _buildPasswordField('Confirm Password', 'Confirm Password', Icons.lock_outline, _isConfirmPasswordVisible, (bool value) {
              setState(() {
                _isConfirmPasswordVisible = value;
              });
            },_passwordController),
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      colors.app_color_1,colors.app_color_2
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {
                    validateAndSubmit(context);
                    
                    // Handle sign up logic
                    print('Sign up button pressed');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Text(
                    "Already have an account ? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                      // Handle navigation to the sign-up screen
                      debugPrint('Sign Up Pressed');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,decoration: TextDecoration.underline,
                        color: Colors.black87,
                        
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hintText, IconData icon,TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            
            fillColor: Colors.grey[100],
            filled: true
           
          ),
          style: const TextStyle(color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label, String hintText, IconData icon, bool isVisible, Function(bool) onVisibilityChanged,TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: !isVisible,
          decoration: InputDecoration(
            
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            fillColor: colors.form_field_color,
            filled: true,
          suffixIcon: Image.asset(Appicons.eye_icon,scale: 4.5,)
            // suffixIcon: IconButton(
            //   icon: Icon(
            //     isVisible ? Icons.visibility : Icons.visibility_off,
            //     color: Colors.grey[500],
            //   ),
            //   onPressed: () {
            //     onVisibilityChanged(!isVisible);
            //   },
            // ),
          ),
          style: const TextStyle(color: Colors.black87),
        ),
      ],
    );
  }
  }
class ImageSourceSheet extends StatelessWidget {
  final Function(ImageSource) onImagePicked;

  const ImageSourceSheet({Key? key, required this.onImagePicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.camera_alt),
          title: Text('Camera'),
          onTap: () {
            onImagePicked(ImageSource.camera);
          },
        ),
        ListTile(
          leading: Icon(Icons.photo_library),
          title: Text('Gallery'),
          onTap: () {
            onImagePicked(ImageSource.gallery);
          },
        ),
      ],
    );
  }
}