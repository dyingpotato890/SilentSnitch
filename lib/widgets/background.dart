import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2A2D3E),
            Color(0xFF1C1E2A),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Top right abstract shape
          Positioned(
            top: -80,
            right: -100,
            child: _buildBlurredCircle(
              size: 220,
              color: const Color(0xFF6C63FF).withAlpha(128),
            ),
          ),
          
          // Bottom left abstract shape
          Positioned(
            bottom: -60,
            left: -70,
            child: _buildBlurredCircle(
              size: 180,
              color: const Color(0xFF9C27B0).withAlpha(77),
            ),
          ),
          
          // Small accent circles
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            right: 40,
            child: _buildBlurredCircle(
              size: 50,
              color: const Color(0xFF03A9F4).withAlpha(77),
            ),
          ),
          
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            left: 60,
            child: _buildBlurredCircle(
              size: 70,
              color: const Color(0xFFFF9800).withAlpha(51),
            ),
          ),
          
          // Content
          child,
        ],
      ),
    );
  }
  
  Widget _buildBlurredCircle({required double size, required Color color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withAlpha(128),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
      ),
    );
  }
}