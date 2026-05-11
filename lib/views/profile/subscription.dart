import 'package:flutter/material.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  bool _tryFree = true;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Color Palette
    final Color primaryGreen = const Color(0xFF00E676); // Bright green for buttons/toggles
    final Color darkBackgroundOverlay = const Color(0xFF0A1F18).withOpacity(0.95);
    final Color cardFillColor = const Color(0xFF0E231F);
    final Color borderColor = Colors.white.withOpacity(0.15);
    final Color secondaryTextColor = Colors.white.withOpacity(0.6);

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/welcome_background.png',
              fit: BoxFit.cover,
            ),
          ),
          // Dark Overlay
          Positioned.fill(
            child: Container(
              color: darkBackgroundOverlay,
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, 
                    vertical: screenHeight * 0.02
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Subscription",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40), // Balancer for the back button
                    ],
                  ),
                ),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        // Top Feature Card
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(screenWidth * 0.06),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Unlock Your Full Learning\nExperience",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              
                              const _FeatureRow(text: "Team activity alerts"),
                              const _FeatureRow(text: "Access All Lessons & Programs"),
                              const _FeatureRow(text: "Real-Time Feedback & Mistake Review"),
                              const _FeatureRow(text: "Join Premium Teams & Leaderboards"),
                              const _FeatureRow(text: "Adaptive Learning Mode"),
                              const _FeatureRow(text: "Priority Support"),

                              SizedBox(height: screenHeight * 0.03),

                              // Toggle Row
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "I want to try CodeU for Free",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.035,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Transform.scale(
                                      scale: 0.8,
                                      child: Switch(
                                        value: _tryFree,
                                        onChanged: (val) => setState(() => _tryFree = val),
                                        activeColor: Colors.white,
                                        activeTrackColor: primaryGreen,
                                        inactiveThumbColor: Colors.white,
                                        inactiveTrackColor: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.04),

                        // Section Title
                        Text(
                          "Choose Your Plan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Flexible options to match your learning goals",
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        // Monthly Plan
                        _PlanCard(
                          title: "Monthly Plan",
                          price: "\$9.99 / month",
                          bullets: const [
                            "Full access to all lessons and practice",
                            "Cancel anytime",
                            "Ideal for short-term goals or trial period"
                          ],
                          fillColor: cardFillColor,
                          screenWidth: screenWidth,
                        ),

                        SizedBox(height: screenHeight * 0.02),

                        // Annual Plan
                        _PlanCard(
                          title: "Annual Plan",
                          price: "\$79.99 / year",
                          bullets: const [
                            "Unlimited access to all features",
                            "Includes teams, adaptive mode & support",
                            "Best value for long-term learners"
                          ],
                          fillColor: cardFillColor,
                          screenWidth: screenWidth,
                        ),

                        SizedBox(height: screenHeight * 0.04),

                        // Bottom Free Trial Card
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(screenWidth * 0.06),
                          margin: EdgeInsets.only(bottom: screenHeight * 0.05),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "3-Day Free Trial",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Try everything now, no payment required",
                                style: TextStyle(
                                  color: secondaryTextColor,
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryGreen,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    "Start Free Trial",
                                    style: TextStyle(
                                      color: Colors.black, // Dark text on bright button
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final String text;

  const _FeatureRow({required this.text});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.verified_user_outlined, // Using a similar shield/check icon
            color: Colors.white.withOpacity(0.7),
            size: screenWidth * 0.05,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.035,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> bullets;
  final Color fillColor;
  final double screenWidth;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.bullets,
    required this.fillColor,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.06),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          ...bullets.map((text) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: screenWidth * 0.032,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}