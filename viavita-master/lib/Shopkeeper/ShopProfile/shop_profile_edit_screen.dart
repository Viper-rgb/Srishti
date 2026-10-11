import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
// Import your provider
import 'package:via_vita_mobile_app/Providers/shop_edit_profile_provider.dart'; 

class ShopEditProfileScreen extends StatefulWidget {
  // Pass existing data to pre-fill the form
  final String currentId;
  final String currentName;
  final String currentPhone;
  final String currentEmail;
  final String currentDistrict;
  final String currentState;
  final String currentAddress;
  final String currentShopCatId;
  final String? currentImageUrl; // URL for network image if no local file selected

  const ShopEditProfileScreen({
    Key? key,
    required this.currentId,
    required this.currentName,
    required this.currentPhone,
    required this.currentEmail,
    required this.currentDistrict,
    required this.currentState,
    required this.currentAddress,
    required this.currentShopCatId,
    this.currentImageUrl,
  }) : super(key: key);

  @override
  State<ShopEditProfileScreen> createState() => _ShopEditProfileScreenState();
}

class _ShopEditProfileScreenState extends State<ShopEditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _districtController;
  late TextEditingController _stateController;
  late TextEditingController _addressController;
  late TextEditingController _shopCatIdController;

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing data passed from the previous screen
    _nameController = TextEditingController(text: widget.currentName);
    _phoneController = TextEditingController(text: widget.currentPhone);
    _emailController = TextEditingController(text: widget.currentEmail);
    _districtController = TextEditingController(text: widget.currentDistrict);
    _stateController = TextEditingController(text: widget.currentState);
    _addressController = TextEditingController(text: widget.currentAddress);
    _shopCatIdController = TextEditingController(text: widget.currentShopCatId);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _districtController.dispose();
    _stateController.dispose();
    _addressController.dispose();
    _shopCatIdController.dispose();
    super.dispose();
  }

  // Method to pick image
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Access the provider
    final provider = Provider.of<ShopEditProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Shop Profile", style: TextStyle(color: Colors.white,fontSize: 16)),
        backgroundColor: colors.app_color_1,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Image Picker Section ---
              Center(
                child: Stack(
                  children: [
                    // Container(
                    //   width: 120,
                    //   height: 120,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     border: Border.all(color: colors.app_color_1, width: 2),
                    //     image: DecorationImage(
                    //       fit: BoxFit.cover,
                    //       image: _selectedImage != null
                    //           ? FileImage(_selectedImage!) as ImageProvider
                    //           : (widget.currentImageUrl != null && widget.currentImageUrl!.isNotEmpty)
                    //               ? NetworkImage(widget.currentImageUrl!)
                    //               : const AssetImage("assets/images/placeholder.png"), // Ensure you have a placeholder
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   bottom: 0,
                    //   right: 0,
                    //   child: GestureDetector(
                    //     onTap: _pickImage,
                    //     child: Container(
                    //       padding: const EdgeInsets.all(8),
                    //       decoration: BoxDecoration(
                    //         color: colors.app_color_1,
                    //         shape: BoxShape.circle,
                    //         border: Border.all(color: Colors.white, width: 2),
                    //       ),
                    //       child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // --- Form Fields ---
              const Text("Basic Information", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87)),
              const SizedBox(height: 15),
              
              _buildTextField("Shop Name", _nameController, Icons.store),
              _buildTextField("Phone Number", _phoneController, Icons.phone, inputType: TextInputType.phone),
              _buildTextField("Email ID", _emailController, Icons.email, inputType: TextInputType.emailAddress),
              _buildTextField("Shop Category ID", _shopCatIdController, Icons.category),
              
              const SizedBox(height: 15),
              const Text("Location Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87)),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(child: _buildTextField("District", _districtController, Icons.location_city)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildTextField("State", _stateController, Icons.map)),
                ],
              ),
              
              _buildTextField("Full Address", _addressController, Icons.location_on, maxLines: 3),

              const SizedBox(height: 30),

              // --- Update Button ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.app_color_1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                  ),
                  onPressed: provider.isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            provider.updateShopProfile(
                              context: context,
                              id: widget.currentId,
                              name: _nameController.text,
                              phoneNumber: _phoneController.text,
                              emailId: _emailController.text,
                              district: _districtController.text,
                              state: _stateController.text,
                              address: _addressController.text,
                              shopCategoryId: _shopCatIdController.text,
                              image: _selectedImage,
                            );
                          }
                        },
                  child: provider.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "SAVE CHANGES",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build consistent text fields
  Widget _buildTextField(
    String label, 
    TextEditingController controller, 
    IconData icon, 
    {TextInputType inputType = TextInputType.text, int maxLines = 1}
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        style: TextStyle(fontSize: 14),
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        decoration: InputDecoration(
          
          labelText: label,
          alignLabelWithHint: true,
          prefixIcon: Icon(icon, color: colors.app_color_1),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: colors.app_color_1, width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
      ),
    );
  }
}