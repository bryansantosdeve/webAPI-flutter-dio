import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({required this.name, required this.image, super.key});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                boxShadow: const [
                  BoxShadow(color: Colors.grey),
                ]),
          ),
        ),
      ],
    );
  }
}
