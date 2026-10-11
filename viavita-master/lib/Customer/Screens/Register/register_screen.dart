import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Login/login_screen.dart';
import 'package:via_vita_mobile_app/Providers/register_provider.dart';

class CustomerRegisterScreen extends StatefulWidget {

  const CustomerRegisterScreen({super.key, });

  @override
  _CustomerRegisterScreenState createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {

  
  String? _selectedGender;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
     XFile? file;
  String? base64Image;
  final ImagePicker _picker = ImagePicker();
   Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
       Navigator.pop(context);
      setState(() {
        file = pickedFile;
      });

      // Convert image to base64
      File imageFile = File(pickedFile.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }
  }
//controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController=TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final TextEditingController _confirmPasswordController =TextEditingController();
 
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


      

  @override
  Widget build(BuildContext context) {
     final registerProvider = Provider.of<RegisterProvider>(context);
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
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                 CircleAvatar(
                  radius: 60,
                  backgroundImage: file != null ? FileImage(File(file!.path)) : null,
               child: file == null ? Icon(Icons.camera_alt,size: 50,): null,
                 ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                       showModalBottomSheet(
                                      context: context,
                                      builder: (builder) => bottomSheet());
                      
                    },
                    child: Text(
                      '+ Add Image',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildInputField('Name', 'Name', Icons.person_outline,_nameController,_nameFocus,TextInputType.text),
            const SizedBox(height: 20),
            const Text(
              'Gender',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RadioListTile<String>(
                    activeColor: colors.app_color_1,
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                       activeColor: colors.app_color_1,
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                       activeColor: colors.app_color_1,
                    title: const Text('Other'),
                    value: 'Other',
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildInputField('Phone Number', 'Phone Number', Icons.phone_outlined,_phoneController,_phoneFocus,TextInputType.number),
            const SizedBox(height: 20),
            _buildInputField('Email ID', 'Email ID', Icons.email_outlined,_emailController,_emailFocus,TextInputType.emailAddress),
            const SizedBox(height: 20),
            _buildInputField('Address', 'Address', Icons.location_on_outlined,_addressController,_addressFocus,TextInputType.streetAddress),
            const SizedBox(height: 20),
            _buildPasswordField('Password', 'Password', Icons.lock_outline, _isPasswordVisible, (bool value) {
              setState(() {
                _isPasswordVisible = value;
              });
            },_passwordController,_passwordFocus),
            const SizedBox(height: 20),
            _buildPasswordField('Confirm Password', 'Confirm Password', Icons.lock_outline, _isConfirmPasswordVisible, (bool value) {
              setState(() {
                _isConfirmPasswordVisible = value;
              });
            },_confirmPasswordController,_passwordFocus),
            const SizedBox(height: 30),
            // Center(
            //   child: Container(
            //     width: double.infinity,
            //     height: 50,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8),
            //       gradient: const LinearGradient(
            //         colors: [
            //           colors.app_color_1,colors.app_color_2
            //         ],
            //         begin: Alignment.centerLeft,
            //         end: Alignment.centerRight,
            //       ),
            //     ),
            //     child: MaterialButton(
            //       onPressed: () {
                  
                    
            //   // registerButton();
            //         print('Sign up button pressed');
            //       },
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       padding: EdgeInsets.zero,
            //       child: const Text(
            //         'Sign ',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 16,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            GestureDetector(
  onTap: _isLoading ? null : () async {
    
    // --- 1. VALIDATIONS ---

    // Check Image
    if (file == null) {
         ToastManager.showSingle(context, title: 'Please select an image',type: ToastificationType.info);
     
      return; 
    }

    // Check Name
    if (_nameController.text.trim().isEmpty ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(_nameController.text.trim())) {
             ToastManager.showSingle(context, title: 'Please enter a valid Name (letters only)',type: ToastificationType.info);
    
      return;
    }

    // Check Gender
    if (_selectedGender == null || _selectedGender.toString().trim().isEmpty) {
         ToastManager.showSingle(context, title: 'Please select Gender',type: ToastificationType.info);
     
      return;
    }

    // Check Phone
    if (_phoneController.text.trim().isEmpty ||
        !RegExp(r'^[1-9][0-9]{9}$').hasMatch(_phoneController.text.trim())) {
             ToastManager.showSingle(context, title: 'Invalid phone number! Enter 10 digits.',type: ToastificationType.info);
     
      return;
    }

    // Check Email
    if (_emailController.text.trim().isEmpty) {
         ToastManager.showSingle(context, title: 'Please enter Email',type: ToastificationType.info);
      
      return;
    }

    // Check Address
    if (_addressController.text.trim().isEmpty) {
         ToastManager.showSingle(context, title: 'Please enter Address',type: ToastificationType.info);
     
      return;
    }

    // Check Password
    if (_passwordController.text.trim().isEmpty) {
         ToastManager.showSingle(context, title: 'Please enter Password',type: ToastificationType.info);
     
      return;
    }

    // --- 2. START LOADING ---
    setState(() {
      _isLoading = true;
    });

    // --- 3. CALL PROVIDER ---
    // Make sure you have the provider at the top of build or here
    
    bool isSuccess = await registerProvider.registerCustomer(
      imageFile: file != null ? File(file!.path) : null,
      name: _nameController.text,
      gender: _selectedGender.toString(),
      phonenumber: _phoneController.text,
      email: _emailController.text,
      address: _addressController.text,
      password: _passwordController.text,
    );

    // --- 4. STOP LOADING ---
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }

    // --- 5. NAVIGATE ---
    if (isSuccess && mounted) {
         ToastManager.showSingle(context, title: 'Customer Registration Successful!',type: ToastificationType.success);
     
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomerLoginScreen()),
      );
    }
  },
  child: Container(
    height: 55,
    width: 390,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [colors.app_color_1, colors.app_color_2]),
        borderRadius: BorderRadius.circular(10)),
    child: Center(
      child: _isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : const Text(
              'Register',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
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
                      fontWeight: FontWeight.w500

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CustomerLoginScreen()));
                      // Handle navigation to the sign-up screen
                      debugPrint('Sign Up Pressed');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,decoration: TextDecoration.underline,
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
   Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              "Choose Profile photo",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                  icon: Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Camera",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: colors.app_color_1),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                  pickImage(ImageSource.gallery);
                  },
                  icon: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Gallery",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: colors.app_color_1),
                ),
              ],
            )
          ],
        ));
  }

  Widget _buildInputField(String label, String hintText, IconData icon,TextEditingController controller,FocusNode focusnode,TextInputType? keyboardType,) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: keyboardType,
          focusNode: focusnode,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            
            fillColor: Colors.grey[100],
            filled: true
           
          ),
          style: const TextStyle(color: Colors.black87,fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label, String hintText, IconData icon, bool isVisible, Function(bool) onVisibilityChanged,TextEditingController controller,FocusNode focusnode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isVisible,
          decoration: InputDecoration(
            
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            fillColor: colors.form_field_color,
            filled: true,
            suffixIcon: GestureDetector(
              onTap: () {
                onVisibilityChanged(!isVisible);
              },
              child: isVisible?Image.asset(Appicons.eye_icon,scale: 4.5,):Image.asset(Appicons.remove_eye_icon,scale: 4.5,),
            )
            
          ),
          style: const TextStyle(color: Colors.black87),
        ),
      ],
    );
  }
  }
  
