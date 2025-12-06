import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final int count;
  final Function(String)? onTapmessage;

  const CustomCard({
    super.key,
    required this.title,
    this.subtitle,
    this.count = 0,
    this.onTapmessage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 22)),

            if (subtitle != null) ...[
              const SizedBox(height: 10),
              Text(subtitle!, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),
              Text("count: $count"),
              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  if (onTapmessage != null) {
                    onTapmessage!("Button clicked!");
                  }
                },
                child: const Text("Tap Me"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}