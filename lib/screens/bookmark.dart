import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:nexus_news/utils/constants/colors.dart';
import 'package:nexus_news/utils/constants/responsive.dart';
import '../controllers/bookmark_controller.dart';



class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final BookmarkController controller = Get.put(BookmarkController());

    return Scaffold(
      backgroundColor: TColors.white,
      appBar: AppBar(
        backgroundColor: TColors.white,
        title: Text(
          "Bookmark Articles",
          style: TextStyle(
            fontFamily: 'Semibold',
            fontSize: Responsive.getWidth(context) * 0.05,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.bookmarks.length, // Observing length
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(controller.bookmarks[index]),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete,
                          color: TColors.iconPrimary,
                          size: Responsive.getWidth(context) * 0.05,
                        ),
                      ),
                      onDismissed: (direction) {
                        controller.removeBookmark(index); // Remove bookmark
                      },
                      child: GestureDetector(
                        onTap: () {
                          // Handle navigation to news detail
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          height: Responsive.getWidth(context) * 0.25,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                            color: TColors.lightGrey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1pWSeZ.img?w=768&h=432&m=6&x=332&y=155&s=271&d=271',
                                  fit: BoxFit.cover,
                                  height: Responsive.getWidth(context) * 0.25,
                                  width: Responsive.getWidth(context) * 0.30,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    Text(
                                      "Modi govt gives absolute powers to Delhi L-G to constitute, appoint members of boards, panels; notification issued",
                                      style: TextStyle(
                                        fontFamily: 'Semibold',
                                        fontSize: Responsive.getWidth(context) *
                                            0.030,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 3,
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0),
                                                child: Icon(
                                                  Iconsax.profile,
                                                  size: Responsive.getWidth(
                                                          context) *
                                                      0.03,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                "By Jane Smith",
                                                style: TextStyle(
                                                  fontFamily: 'Regular',
                                                  fontSize: Responsive.getWidth(
                                                          context) *
                                                      0.03,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.bookmark_fill,
                                          size: Responsive.getWidth(context) *
                                              0.03,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
