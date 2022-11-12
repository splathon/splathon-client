import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splathon_app/domains/user_provider.dart';
import 'package:splathon_app/utils/config.dart';
import 'package:splathon_app/utils/preference.dart';
import 'package:splathon_app/views/login/login.dart';
import 'package:splathon_app/views/tabs/admin_tabbed_bar.dart';
import 'package:splathon_app/views/tabs/home_tabbed_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Configuration
  await Config.loadFlavor();
  await Preference.setup();

  // Setup Firebase
  await Firebase.initializeApp(
    options: Config.firebaseOptions,
  );

  // Load User
  final container = ProviderContainer();
  final _ = container.read(userStateProvider);
  await Future.delayed(const Duration(milliseconds: 100));
  final user = container.read(userStateProvider);

  final isLogin = user == null;
  final isAdmin = user?.isAdmin ?? false;

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Splathon App',
        home: isLogin
            ? Login()
            : (isAdmin ? const AdminTabbedBar() : const HomeTabbedBar()),
      ),
    ),
  );
}
