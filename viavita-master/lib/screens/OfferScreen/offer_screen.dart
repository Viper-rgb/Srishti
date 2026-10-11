import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/color/colors.dart';




class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  int _selectedIndex = 0; // 0 for All Offers, 1 for Accepted Offers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.background_color,
      appBar: AppBar(
        backgroundColor: colors.background_color,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,size: 16,),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text(
          'Offers',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 16),
        ),
      
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                _buildOfferTab(
                  label: 'All Offers',
                  index: 0,
                  isSelected: _selectedIndex == 0,
                ),
                const SizedBox(width: 10),
                _buildOfferTab(
                  label: 'Accepted Offers',
                  index: 1,
                  isSelected: _selectedIndex == 1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: 
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search here...',
                      prefixIcon: Image.asset(Appicons.search_icon,scale: 4),
                      suffixIcon: Image.asset(Appicons.filter_icon,scale: 4,),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
              
               
              
            
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6, // Assuming two offer cards for the example
              itemBuilder: (context, index) {
                return  OfferCard(
                  painterName: 'Suresh Kumar',
                  painterProfession: 'Painter',
                  offerType: 'Painting',
                  price: '12,000',
                  startDate: 'Oct 15 2025',
                  expectedDeadline: 'Oct 30 2025',
                  // You can replace the image with an actual asset or network image
                  imageUrl: 'https://via.placeholder.com/150',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferTab({
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? colors.task_progress_color : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ?  colors.progress_bar_text_color : colors.task_text_color,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,fontSize: 13
          ),
        ),
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String painterName;
  final String painterProfession;
  final String offerType;
  final String price;
  final String startDate;
  final String expectedDeadline;
  final String imageUrl;

  const OfferCard({
    super.key,
    required this.painterName,
    required this.painterProfession,
    required this.offerType,
    required this.price,
    required this.startDate,
    required this.expectedDeadline,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      
      },
      child: Card(
        color: Color(0xffFFF8F6),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colors.offer_card_color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(5),image: DecorationImage(image: AssetImage(Images.offer_profile),fit: BoxFit.cover)),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          painterName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          painterProfession,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    offerType,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '₹ $price/-',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Date',
                        style: TextStyle(color:Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        startDate,
                        style: TextStyle(
                          color:  Colors.grey[600],
                          fontWeight: FontWeight.bold,fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expected Deadline',
                        style: TextStyle(color:Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        expectedDeadline,
                        style: TextStyle(
                          color:  Colors.grey[600],
                          fontWeight: FontWeight.bold,fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}