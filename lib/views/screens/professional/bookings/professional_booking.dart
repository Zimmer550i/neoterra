import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/profile_picture.dart';
import 'package:neoterra/views/screens/professional/bookings/professional_booking_details.dart';
import 'package:neoterra/views/screens/professional/bookings/professional_offer_accepted.dart';

class ProfessionalBooking extends StatefulWidget {
  const ProfessionalBooking({super.key});

  @override
  State<ProfessionalBooking> createState() => _ProfessionalBookingState();
}

class _ProfessionalBookingState extends State<ProfessionalBooking> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      tab = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: tab == 0 ? AppColors.mint : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Booking I’ve Made",
                        style: AppTexts.tsms.copyWith(
                          color: tab == 0
                              ? Colors.white
                              : AppColors.gray.shade400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      tab = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: tab == 1 ? AppColors.mint : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Booking I’ve Requested",
                        style: AppTexts.tsms.copyWith(
                          color: tab == 1
                              ? Colors.white
                              : AppColors.gray.shade400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 20,
                children: [
                  const SizedBox(height: 0),
                  for (int i = 0; i < 10; i++)
                    tab == 0 ? myBookings() : bookingsRequested(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myBookings() {
    return InkWell(
      onTap: () {
        Get.to(() => ProfessionalOfferAccepted());
      },
      child: Row(
        children: [
          ProfilePicture(
            image: "https://thispersondoesnotexist.com",
            size: 60,
            borderColor: AppColors.mint,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Professional Name", style: AppTexts.txls),
                Text(
                  "DF",
                  style: AppTexts.txss.copyWith(color: AppColors.secondaryText),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pending", style: AppTexts.txsr),
              Text("\$500", style: AppTexts.tlgs),
            ],
          ),
        ],
      ),
    );
  }

  Widget bookingsRequested() {
    var isConfirmed = Random().nextBool();
    return InkWell(
      onTap: () {
        Get.to(() => ProfessionalBookingDetails(isAccepted: isConfirmed));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePicture(
            image: "https://thispersondoesnotexist.com",
            size: 60,
            borderColor: AppColors.mint,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Professional Name", style: AppTexts.txls),
                Text(
                  "May 18, 2024 · 7:30 PM",
                  style: AppTexts.tsmr.copyWith(color: AppColors.secondaryText),
                ),
                Text(
                  "Wedding reception",
                  style: AppTexts.tsmr.copyWith(color: AppColors.secondaryText),
                ),
              ],
            ),
          ),
          if (isConfirmed)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.coral,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text("Confirmed", style: AppTexts.txsm),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
