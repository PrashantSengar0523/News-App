// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import '../widgets/breaking_news_image.dart';

// class CarouselPageSlider extends StatelessWidget {
//   const CarouselPageSlider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         width: double.infinity, 
//         child: Column(
//           children: [
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: 172.0,
//                 autoPlay: false, // Set to true for autoplay
//                 aspectRatio: 16/9,
//                 viewportFraction: 0.95, // Adjust this to add spacing between images
//                 enlargeCenterPage: true, // Optional: To enlarge the center page
//                 enableInfiniteScroll: true, // Optional: To enable infinite scroll
//                 onPageChanged: (index, reason) {
//                   // Update the page index if you want to use it elsewhere
//                 },
//               ),
//               items: const [
//                 BreakingNews(),
//                 BreakingNews(),
//               ]
//             ),
//             // Add indicators below the carousel
            
//           ],
//         ),
//       );
//   }
// }
