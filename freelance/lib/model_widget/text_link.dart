import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:freelance/config/config_url.dart';

class LinkFile extends StatelessWidget {
  const LinkFile({
    super.key,
    required this.filename,
  });

  final String filename;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.normal),
          foregroundColor: Colors.black),
      onPressed: () async {
        Uri url = Uri.parse('$fileURL/$filename');
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      },
      child: Text(filename),
    );
  }
}
