import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountsAndSettings extends StatefulWidget {
  const AccountsAndSettings({super.key});

  @override
  State<AccountsAndSettings> createState() => _AccountsAndSettingsState();
}

class _AccountsAndSettingsState extends State<AccountsAndSettings> {
  bool _pushNotifications = true;
  bool _emailUpdates = true;
  bool _clubActivityAlerts = true;

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
    );
    final double screenWidth = MediaQuery.of(context).size.width;

    final Color primaryTextColor = Colors.white;
    final Color secondaryTextColor = Colors.white.withOpacity(0.7);
    final Color tileBackgroundColor = const Color(0xFF143830).withOpacity(0.9);
    final Color darkTileBackgroundColor = const Color(0xFF1A2C26);
    final Color headerBackgroundColor = const Color(0xFF0A1F18).withOpacity(0.85);

    return Scaffold(
       extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/welcome_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: headerBackgroundColor,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
          
              children: [
                           Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20
                      ),
                      decoration: BoxDecoration(
                            color: Color(0xff003421),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )
                      ),
                      child: Column(
                        children: [
                          Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: Row(
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
                                icon: const Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "Account & Settings",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: screenWidth * 0.12,
                                  
                                  backgroundImage: const AssetImage('assets/images/account_settings.png'),
                                  backgroundColor: Colors.grey,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: tileBackgroundColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: headerBackgroundColor, width: 2),
                                    ),
                                    child: const Icon(Icons.edit, color: Colors.white, size: 16),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Hello, Steve!",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "steve.donovan@gmail.com",
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
                        ),
                      ),
                                   
                        ],
                      ),
                     ),
                     
                     
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          
                     
                      const SizedBox(height: 30),   
                      const _SectionHeader(title: "Notifications"),
                      _ToggleTile(
                        title: "Push notifications",
                        value: _pushNotifications,
                        onChanged: (val) => setState(() => _pushNotifications = val),
                      ),
                      _ToggleTile(
                        title: "Email updates",
                        value: _emailUpdates,
                        onChanged: (val) => setState(() => _emailUpdates = val),
                      ),
                      _ToggleTile(
                        title: "Club activity alerts",
                        value: _clubActivityAlerts,
                        onChanged: (val) => setState(() => _clubActivityAlerts = val),
                      ),
                      const SizedBox(height: 20),
                      const _SectionHeader(title: "Subscription"),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 15),
                        decoration: BoxDecoration(
                          color: tileBackgroundColor,
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(color: Colors.white.withOpacity(0.05)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Current plan: ",
                                style: TextStyle(color: secondaryTextColor, fontSize: screenWidth * 0.04),
                                children: const [
                                  TextSpan(
                                    text: "Free",
                                    style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white.withOpacity(0.2)),
                              ),
                              child: Text(
                                "Upgrade Plan",
                                style: TextStyle(color: primaryTextColor, fontSize: screenWidth * 0.035),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const _SettingsTile(title: "View benefits"),
                      const SizedBox(height: 20),
                      const _SectionHeader(title: "Privacy"),
                      const _SettingsTile(title: "Manage data sharing"),
                      _SettingsTile(
                        title: "Delete account",
                        backgroundColor: darkTileBackgroundColor,
                      ),
                      const SizedBox(height: 40),
                    ],
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

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.04,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF143830).withOpacity(0.9),
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w500,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.greenAccent,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final Color? backgroundColor;

  const _SettingsTile({required this.title, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 18),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFF143830).withOpacity(0.9),
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            Icons.arrow_outward_rounded,
            color: Colors.white.withOpacity(0.7),
            size: screenWidth * 0.06,
          ),
        ],
      ),
    );
  }
}