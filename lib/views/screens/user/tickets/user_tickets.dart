import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';
import 'package:neoterra/views/base/party_card_compact.dart';

class UserTickets extends StatefulWidget {
  const UserTickets({super.key});

  @override
  State<UserTickets> createState() => _UserTicketsState();
}

class _UserTicketsState extends State<UserTickets> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Container(
                  height: 32,
                  width: 102,
                  decoration: BoxDecoration(
                    color: index == 0 ? AppColors.coral : AppColors.card,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Center(child: Text("Upcoming", style: AppTexts.tmdm)),
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Container(
                  height: 32,
                  width: 88,
                  decoration: BoxDecoration(
                    color: index == 1 ? AppColors.coral : AppColors.card,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Center(child: Text("Past", style: AppTexts.tmdm)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          for (int i = 0; i < 5; i++)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: PartyCardCompact(
                seed: i,
                joined: index == 0,
                ended: index == 1,
              ),
            ),
        ],
      ),
    );
  }
}
