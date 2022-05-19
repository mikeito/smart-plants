import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;
  final double size;

  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    required this.isActive,
    this.size = 30.0,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: hasBorder ? 20.0 : size,
          backgroundColor: Colors.grey[200],
          backgroundImage: AssetImage(imageUrl),
        ),
        isActive
            ? Positioned(
                bottom: 2.0,
                right: 5.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFF4BCB1F)
                        : const Color.fromARGB(255, 207, 247, 65),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
