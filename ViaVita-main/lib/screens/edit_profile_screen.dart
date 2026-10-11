import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  final String? currentName;
  final String? currentPhone;
  final String? currentEmail;
  final String? currentAddress;
  final String? currentGender;
  final String? currentSubscriptionExpiry;
  final String? customerId;
  final String currentImage;

  const EditProfileScreen({
    super.key,
    this.currentName,
    this.currentPhone,
    this.currentEmail,
    this.currentAddress,
    this.currentGender,
    this.currentSubscriptionExpiry,
    this.customerId,
    this.currentImage = '',
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class WokereditProfileScreen extends EditProfileScreen {
  const WokereditProfileScreen({
    super.key,
    super.currentName,
    super.currentPhone,
    super.currentEmail,
    super.currentAddress,
    super.currentGender,
    super.currentSubscriptionExpiry,
    super.customerId,
    super.currentImage,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  late final TextEditingController _expiryController;

  String? _selectedGender;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName ?? '');
    _phoneController = TextEditingController(text: widget.currentPhone ?? '');
    _emailController = TextEditingController(text: widget.currentEmail ?? '');
    _addressController = TextEditingController(text: widget.currentAddress ?? '');
    _expiryController = TextEditingController(text: widget.currentSubscriptionExpiry ?? '');
    _selectedGender = widget.currentGender ?? 'Female';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _expiryController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    try {
      if (_expiryController.text.isNotEmpty) {
        initialDate = DateTime.parse(_expiryController.text);
      }
    } catch (_) {
      initialDate = DateTime.now();
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _expiryController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  ImageProvider<Object>? _buildAvatarImage() {
    if (_selectedImage != null) {
      return FileImage(_selectedImage!);
    }

    final imageUrl = widget.currentImage.trim();
    if (imageUrl.isEmpty) {
      return null;
    }

    final uri = Uri.tryParse(imageUrl);
    final hasValidImageExt = uri != null &&
        (uri.path.toLowerCase().endsWith('.jpg') ||
            uri.path.toLowerCase().endsWith('.jpeg') ||
            uri.path.toLowerCase().endsWith('.png') ||
            uri.path.toLowerCase().endsWith('.webp') ||
            uri.path.toLowerCase().endsWith('.gif'));

    if (uri != null && uri.host.isNotEmpty && (hasValidImageExt || uri.path.isNotEmpty && uri.path != '/')) {
      return NetworkImage(imageUrl);
    }

    return null;
  }

  void _saveProfile() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name and Phone are required')),
      );
      return;
    }

    Navigator.pop(context, {
      'name': name,
      'phone': phone,
      'email': _emailController.text.trim(),
      'address': _addressController.text.trim(),
      'gender': _selectedGender ?? 'Female',
      'imageFile': _selectedImage,
      'imagePath': _selectedImage?.path ?? widget.currentImage,
      'subscriptionExpiry': _expiryController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider<Object>? backgroundImage = _buildAvatarImage();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: backgroundImage,
                    child: backgroundImage == null
                        ? const Icon(Icons.person, size: 60, color: Colors.grey)
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: InkWell(
                      onTap: _pickImage,
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFFD32F2F),
                        radius: 23,
                        child: Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text('Name', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _nameController,
              decoration: _inputDecoration('Full Name'),
            ),
            const SizedBox(height: 20),
            const Text('Gender', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            Row(
              children: <Widget>[
                _buildRadioTile('Male'),
                _buildRadioTile('Female'),
                _buildRadioTile('Other'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Phone Number', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: _inputDecoration('Phone Number'),
            ),
            const SizedBox(height: 20),
            const Text('Email ID', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: _inputDecoration('Email ID'),
            ),
            const SizedBox(height: 20),
            const Text('Address', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _addressController,
              decoration: _inputDecoration('Address'),
            ),
            const SizedBox(height: 20),
            const Text('Subscription Expiry', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _expiryController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: _inputDecoration('YYYY-MM-DD').copyWith(
                suffixIcon: const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: InkWell(
                onTap: _saveProfile,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [Color(0xFFD32F2F), Color(0xFFFB8C00)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioTile(String value) {
    return Expanded(
      child: RadioListTile<String>(
        activeColor: const Color(0xFFD32F2F),
        title: Text(value, style: const TextStyle(fontSize: 13)),
        value: value,
        groupValue: _selectedGender,
        onChanged: (String? newValue) {
          setState(() {
            _selectedGender = newValue;
          });
        },
        contentPadding: EdgeInsets.zero,
        dense: true,
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
