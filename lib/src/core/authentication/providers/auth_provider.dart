import 'package:dentality/src/core/authentication/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider =
    Provider<AuthRepo>((ref) => AuthRepo(FirebaseAuth.instance));
final authStateProvider =
    StreamProvider<User?>((ref) => ref.watch(authRepoProvider).authStateChange);
