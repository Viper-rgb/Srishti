import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workers_app/provider/worker_profile_provider.dart';

import 'edit_profile_screen.dart';
import 'logout_dialog.dart';
import 'workaccess_bottom_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final int _currentIndex = 3;

  String _name = '';
  String _gender = '';
  String _phone = '';
  String _email = '';
  String _address = '';
  String _imageUrl = '';
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadProfileData());
  }

  bool _isValidAvatarUrl(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return false;

    final uri = Uri.tryParse(trimmed);
    if (uri == null || uri.host.isEmpty) return false;

    final path = uri.path.toLowerCase();
    if (path == '/' || path.isEmpty) return false;

    return path.endsWith('.jpg') ||
        path.endsWith('.jpeg') ||
        path.endsWith('.png') ||
        path.endsWith('.webp') ||
        path.endsWith('.gif') ||
        path.contains('/uploads/') ||
        path.contains('/images/');
  }

  Future<void> _loadProfileData() async {
    final provider = Provider.of<WorkerProfileProvider>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('name');
    final workerId = prefs.getString('id') ?? prefs.getString('worker_id') ?? prefs.getString('user_id');

    if (savedName != null && savedName.isNotEmpty) {
      if (mounted) {
        setState(() {
          _name = savedName;
        });
      }
    }

    if (workerId != null && workerId.isNotEmpty) {
      final success = await provider.fetchWorkerProfile(workerId);

      if (!mounted) return;

      if (success && provider.profile != null) {
        final profile = provider.profile!;
        setState(() {
          _name = profile.name.isNotEmpty ? profile.name : (_name.isNotEmpty ? _name : 'User');
          _gender = profile.gender.isNotEmpty ? profile.gender : _gender;
          _phone = profile.phoneNumber.isNotEmpty ? profile.phoneNumber : _phone;
          _email = profile.email.isNotEmpty ? profile.email : _email;
          _address = profile.address.isNotEmpty ? profile.address : _address;
          _imageUrl = _isValidAvatarUrl(profile.avatar) ? profile.avatar : '';
        });
      } else if (provider.errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(provider.errorMessage)),
        );
      }
    }
  }

  Future<void> _openEditProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          currentName: _name,
          currentPhone: _phone,
          currentEmail: _email,
          currentAddress: _address,
          currentGender: _gender,
          currentImage: _imageUrl,
        ),
      ),
    );

    if (result is Map<String, dynamic>) {
      setState(() {
        _name = (result['name'] ?? _name).toString();
        _gender = (result['gender'] ?? _gender).toString();
        _phone = (result['phone'] ?? _phone).toString();
        _email = (result['email'] ?? _email).toString();
        _address = (result['address'] ?? _address).toString();

        final updatedImage = result['imageFile'];
        if (updatedImage is File) {
          _selectedImage = updatedImage;
          _imageUrl = '';
        } else if (result['imagePath'] is String && (result['imagePath'] as String).isNotEmpty) {
          _imageUrl = result['imagePath'] as String;
          _selectedImage = null;
        }
      });
    }
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE5D8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: const Color(0xFFD32F2F), size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider<Object>? avatarImage = _selectedImage != null
        ? FileImage(_selectedImage!)
        : (_imageUrl.isNotEmpty ? NetworkImage(_imageUrl) : null);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 140,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFD32F2F),
                                    Color(0xFFFB8C00),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (_) => const WorkerBottomscreen()),
                                          (route) => false,
                                        );
                                      },
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.exit_to_app, color: Colors.white, size: 22),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => const LogoutDialog(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 85,
                              child: CircleAvatar(
                                radius: 48,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 44,
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: avatarImage,
                                  child: avatarImage == null
                                      ? const Icon(
                                          Icons.person,
                                          size: 55,
                                          color: Colors.grey,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: _openEditProfile,
                              child: const Icon(
                                Icons.edit_outlined,
                                size: 20,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              _buildInfoCard(
                                icon: Icons.water_drop_outlined,
                                label: 'Gender',
                                value: _gender,
                              ),
                              _buildInfoCard(
                                icon: Icons.phone_outlined,
                                label: 'Phone Number',
                                value: _phone,
                              ),
                              _buildInfoCard(
                                icon: Icons.mail_outline,
                                label: 'Email ID',
                                value: _email,
                              ),
                              _buildInfoCard(
                                icon: Icons.location_on_outlined,
                                label: 'Address',
                                value: _address,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

