import 'package:dynamic_background/domain/models/painter_data/lava_painter_data.dart';
import 'package:dynamic_background/widgets/views/dynamic_bg.dart';
import 'package:flutter/material.dart';
import 'package:silent_snitch/widgets/file_selector.dart';

class OperationPage extends StatelessWidget {
  const OperationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          DynamicBg(
            duration: const Duration(seconds: 35),
            painterData: LavaPainterData(
              width: 250.0,
              widthTolerance: 75.0,
              growAndShrink: true,
              growthRate: 10.0,
              growthRateTolerance: 5.0,
              blurLevel: 25.0,
              numBlobs: 5,
              backgroundColor: Color.fromRGBO(88, 81, 219, 1),
              colors: [
                Color.fromRGBO(88, 81, 219, 1),
                Color.fromRGBO(131, 58, 180, 1),
                Color.fromRGBO(193, 53, 132, 1),
                Color.fromRGBO(225, 48, 108, 1),
                Color.fromRGBO(253, 29, 29, 1),
                Color.fromRGBO(245, 96, 64, 1),
                Color.fromRGBO(247, 119, 55, 1),
                Color.fromRGBO(252, 175, 69, 1),
                Color.fromRGBO(255, 220, 128, 1),
              ],
              allSameColor: false,
              fadeBetweenColors: true,
              changeColorsTogether: false,
              speed: 20.0,
              speedTolerance: 5.0,
            ),
            child: Container(),
          ),

          // Main
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Unfollower Detector',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Find out who unfollowed you',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 60),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(51),
                        borderRadius: BorderRadius.circular(24),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Following
                          FileSelector(
                            icon: Icons.people_outline,
                            label: 'Select Following List',
                            filename: 'following_1.json',
                            onTap: () {
                              print('button 1 pressed');
                            },
                          ),

                          const SizedBox(height: 40),

                          // Followers
                          FileSelector(
                            icon: Icons.person_add_outlined,
                            label: 'Select Followers List',
                            filename: 'followers_1.json',
                            onTap: () {
                              print('button 2 pressed');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      print('find the SOB');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromRGBO(88, 81, 219, 1),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'FIND UNFOLLOWERS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
