import 'package:flutter/cupertino.dart';

class DestinationsList extends StatelessWidget {
  final String text;
  final String image;
  const DestinationsList({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text(text)),
    );
  }
}