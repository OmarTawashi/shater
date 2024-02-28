import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/html_viewer_screen.dart';

class PrivcyPolicyScreen extends StatelessWidget {
  const PrivcyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HtmlView(isPrivcy: true);
  }
}