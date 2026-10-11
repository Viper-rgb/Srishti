import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/color/colors.dart';

// --- Main Application Setup ---



class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.background_color,
      // 1. App Bar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text(
          'Add Tasks',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        backgroundColor: colors.background_color,
        elevation: 0,
        centerTitle: false,
      ),
      
      // 2. Body with Scrollable Form
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Job Category
            _buildLabel('Job Category'),
            _buildJobCategoryField(),
            const SizedBox(height: 20),

            // Description
            _buildLabel('Description'),
            _buildDescriptionField(),
            const SizedBox(height: 20),

            // Location
            _buildLabel('Location'),
            _buildInputField(hintText: 'Location'),
            const SizedBox(height: 20),

            // Estimated Budget
            _buildLabel('Estimated Budget'),
            _buildBudgetField(),
            const SizedBox(height: 20),

            // Expected days for completion
            _buildLabel('Expected days for completion'),
            _buildDateField(context),
            const SizedBox(height: 40),
            
            // Confirm Button
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Field Labels
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }

  // Helper for generic text input fields
  Widget _buildInputField({
    required String hintText,
    int maxLines = 1,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black87,fontSize: 14),
        fillColor: Colors.grey.shade100,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none, // Hide default border
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 18.0, horizontal: 15.0),
      ),
    );
  }

  // Job Category Field (Dropdown)
  Widget _buildJobCategoryField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Job Category',
        hintStyle: const TextStyle(color: Colors.grey,fontSize: 14),
        fillColor: Colors.grey.shade100,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
      ),
      items: const [
        DropdownMenuItem(value: '1', child: Text('Job Category',style: TextStyle(fontSize: 14),)),
        // Add more items here
      ],
      onChanged: (String? newValue) {
        // Handle dropdown selection
      },
      // Set an initial value that matches the hint text
      value: '1', 
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
    );
  }

  // Description Field
  Widget _buildDescriptionField() {
    return _buildInputField(
      hintText: 'Description',
      
      maxLines: 4,
    );
  }

  // Budget Field
  Widget _buildBudgetField() {
    return _buildInputField(
      hintText: '₹ 0/-',
    
    );
  }

  // Date Field
  Widget _buildDateField(BuildContext context) {
    return _buildInputField(
      hintText: 'DD/MM/YYYY',
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          icon: const Icon(Icons.calendar_today, size: 20, color: Colors.black54),
          onPressed: () async {
            // Simulate date picker interaction
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2030),
            );
          },
        ),
      ),
    );
  }

  // Confirm Button with Gradient
  Widget _buildConfirmButton() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // Apply the gradient color from dark red to orange
        gradient: const LinearGradient(
          colors: [
           colors.app_color_1,colors.app_color_2
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
           
          },
          borderRadius: BorderRadius.circular(10),
          child: const Center(
            child: Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}