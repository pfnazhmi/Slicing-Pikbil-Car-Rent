import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pikbil_rentcar/config/app_color.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key? key,
    required this.label,
    required this.onTap,
    required this.isExpand,
  }) : super(key: key);

  final String label;
  final Function onTap;
  final bool isExpand;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Align(
        child: Material(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => onTap(),
            child: Container(
              width: isExpand == null
                  ? null
                  : isExpand
                      ? double.infinity
                      : null,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
