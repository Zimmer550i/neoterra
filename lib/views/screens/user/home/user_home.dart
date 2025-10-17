import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_constants.dart';
import 'package:neoterra/views/base/party_card.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 1));
      },
      color: AppColors.mint,
      backgroundColor: AppColors.card,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i in AppConstants.vibes)
                      SizedBox(
                        width: 76,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.mint),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(99),
                                child: Image.asset(i.iconImage),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              i.name,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Curated for you",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 12),
              for (int i = 0; i < 20; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: PartyCard(seed: i),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
