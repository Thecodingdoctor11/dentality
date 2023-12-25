import 'package:dentality/src/core/routing/routes.dart';
import 'package:dentality/src/helpers/auth_helper.dart';
import 'package:dentality/src/screens/onboarding/widgets/signup_form.dart';
import 'package:dentality/src/theme/colors.dart';
import 'package:dentality/src/widgets/long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupModalSheet extends StatefulWidget {
  const SignupModalSheet({super.key});

  @override
  State<SignupModalSheet> createState() => _SignupModalSheetState();
}

bool _isLogin = false;

class _SignupModalSheetState extends State<SignupModalSheet> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void trySubmit(String email, String password) {
    if (_isLogin) {
      try {
        AuthHelper.signInWithEmailAndPassword(email: email, password: password);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.toString(),
            ),
          ),
        );
      }
    }
    try {
      AuthHelper.signUpWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Wrap(children: <Widget>[
      Container(
        height: 550.h,
        decoration: const BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        child: PageView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Create an account',
                          style: textTheme.headlineSmall
                              ?.copyWith(color: AppColors.green),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(Routes.homeScreen),
                          icon: const Icon(
                            Icons.person_add,
                            color: AppColors.teal,
                          ),
                        )
                      ],
                    ),
                  ),
                  SignupForm(
                    isLogin: _isLogin,
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                  ),
                  Flexible(
                    child: LongButton(
                      textTheme: textTheme,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(!_isLogin
                                    ? 'Registration Successful.'
                                    : 'Welcome Back.'),
                                backgroundColor: AppColors.teal),
                          );
                          _formKey.currentState?.save();
                          trySubmit(
                              _emailController.text, _passwordController.text);

                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.homeScreen,
                            (route) => false,
                          );
                        }
                      },
                      title: _isLogin ? 'Login' : 'Sign Up',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin ? 'Sign Up Instead' : 'Login Instead',
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
            )
          ],
        ),
      )
    ]);
  }
}
