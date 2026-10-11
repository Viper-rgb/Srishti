import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';
import 'package:via_vita_mobile_app/Providers/shop_register_provider.dart';
import 'package:via_vita_mobile_app/ShopKeeper/ShopKeeperLogin/shopkeeper_login_screen.dart';
import 'package:via_vita_mobile_app/Worker/WorkerLogin/worker_login_screen.dart';

class ShopkeeperRegisterScreen extends StatefulWidget {
  const ShopkeeperRegisterScreen({super.key});

  @override
  _ShopkeeperRegisterScreenState createState() =>
      _ShopkeeperRegisterScreenState();
}

class _ShopkeeperRegisterScreenState extends State<ShopkeeperRegisterScreen> {
  bool _isPasswordVisible = false;

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  // Removed _shopcategorycontroller as we will use a variable for ID
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController idProofCtrl = TextEditingController();

  // Variable to store selected category ID
  String? _selectedCategoryId;

  File? avatarFile;
  File? idProofFile;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Fetch categories when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ShopRegisterProvider>(context, listen: false).fetchCategories();
    });
  }

  Future pickIdProof() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        idProofFile = File(picked.path);
        idProofCtrl.text = picked.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShopRegisterProvider>(context);
    
    return Scaffold(
      backgroundColor: colors.background_color,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 70),
            const Center(
              child: Text(
                'Create a new account',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 30),
            _buildInputField('Name', 'Name', Icons.person_outline, _nameController),
            const SizedBox(height: 20),
            _buildInputField('Phone Number', 'Phone Number', Icons.phone_outlined, _phoneController),
            const SizedBox(height: 20),
            _buildInputField('Email ID', 'Email ID', Icons.email_outlined, _emailController),
            const SizedBox(height: 20),
            _buildInputField('State', 'State', Icons.location_on_outlined, _stateController),
            const SizedBox(height: 20),
            _buildInputField('District', 'District', Icons.location_on_outlined, _districtController),
            const SizedBox(height: 20),
            
            // --- DROPDOWN FOR CATEGORY ---
            const Text(
              'Shop Category',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
          Container(
  height: 60,
  padding: const EdgeInsets.symmetric(horizontal: 12),
  // 1. Aligns the form field vertically in the container
  alignment: Alignment.centerLeft, 
  decoration: BoxDecoration(
    color: Colors.grey[100],
    borderRadius: BorderRadius.circular(4),
  ),
  child: DropdownButtonHideUnderline(
    child: DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        border: InputBorder.none,
        // 2. 'isDense' and 'zero' padding remove default offsets so alignment works
        isDense: true,
        contentPadding: EdgeInsets.zero,
      ),
      // 3. Wrap the Text in Align or Center
      hint: const Align(
        // Change to Alignment.center if you want it horizontally centered as well
        alignment: Alignment.centerLeft, 
        child: Text(
          "Select Category", 
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
      value: _selectedCategoryId,
      items: provider.categories.map((category) {
        return DropdownMenuItem<String>(
          value: category.id,
          child: Text(
            category.categoryTitle,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedCategoryId = newValue;
        });
      },
    ),
  ),
),
            // -----------------------------

            const SizedBox(height: 20),
            _buildInputField('Address', 'Address', Icons.location_on_outlined, _addressController),
            const SizedBox(height: 20),
            const Text(
              'ID Proof',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              readOnly: true,
              controller: idProofCtrl,
              decoration: InputDecoration(
                hintText: 'ID Proof',
                suffixIcon: InkWell(
                  onTap: () => pickIdProof(),
                  child: Image.asset(
                    Appicons.upload_icon,
                    scale: 4.5,
                  ),
                ),
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 20),
            _buildPasswordField(
                'Password', 'Password', Icons.lock_outline, _isPasswordVisible,
                (bool value) {
              setState(() {
                _isPasswordVisible = value;
              });
            }, _passwordController),
            const SizedBox(height: 30),

            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [colors.app_color_1, colors.app_color_2],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: MaterialButton(
                  onPressed: provider.isLoading 
                    ? null 
                    : () async {
                    // Validation
                    if (_nameController.text.isEmpty ||
                        _phoneController.text.isEmpty ||
                        _emailController.text.isEmpty ||
                        _stateController.text.isEmpty ||
                        _districtController.text.isEmpty ||
                        _addressController.text.isEmpty ||
                        _passwordController.text.isEmpty || 
                        _selectedCategoryId == null) {
                           ToastManager.showSingle(context, title: 'Please fill all fields',type: ToastificationType.info);
                    
                      return;
                    }

                    try {
                      await provider.registerShopkeeper(
                        name: _nameController.text,
                        phoneNumber: _phoneController.text,
                        email: _emailController.text,
                        state: _stateController.text,
                        district: _districtController.text,
                        address: _addressController.text,
                        password: _passwordController.text,
                        shopcategoryid: _selectedCategoryId.toString(), // Use Selected ID
                        idProof: idProofFile,
                      );

                      if (!mounted) return;
                        ToastManager.showSingle(context, title: 'ShopKeeper Registered Successfully!',type: ToastificationType.success);
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopkeeperLoginScreen()));
                    } catch (e) {
                      if (!mounted) return;
                       ToastManager.showSingle(context, title: e.toString(),type: ToastificationType.error);
                    
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                  child: provider.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
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
                const Text(
                  "Already have an account ? ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShopkeeperLoginScreen()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
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

  Widget _buildInputField(String label, String hintText, IconData icon,
      TextEditingController controller) {
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
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            fillColor: Colors.grey[100],
            filled: true,
          ),
          style: const TextStyle(color: Colors.black87,fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label, String hintText, IconData icon,
      bool isVisible, Function(bool) onVisibilityChanged, TextEditingController controller) {
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
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
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