import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visa/utils/text.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -150,
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
        Positioned(
          left: 200,
          bottom: -470,
          child: Container(
            height: 600,
            width: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
        Positioned(
          top: 25,
          left: 15,
          child: SizedBox(height: 30, child: Image.asset('assets/visa.png')),
        ),
        Positioned(
          top: 60,
          left: 25,
          child: Modifiedtext(
            text: "it's where you want to be",
            color: Colors.grey.shade900,
            size: 16,
          ),
        ),
        Positioned(
          bottom: 30,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '0123 4567 8910 1112',
                style: GoogleFonts.sourceCodePro(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700,
                ),
              ),
              Text(
                'SUBASH GURUNG',
                style: GoogleFonts.sourceCodePro(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 14,
          child: Container(
            height: 50,
            width: 50,
            child: Image.asset('assets/chip.png'),
          ),
        ),
      ],
    );
  }
}
