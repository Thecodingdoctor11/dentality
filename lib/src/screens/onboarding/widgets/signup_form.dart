import 'package:dentality/src/screens/onboarding/widgets/signup_textfield.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm(
      {super.key,
      required this.isLogin,
      required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.firstNameController,
      required this.lastNameController});

  final bool isLogin;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SignupTextField(
            hint: 'Email',
            keyboardType: TextInputType.emailAddress,
            controller: widget.emailController,
            validator: (value) {
              final input = value.toString().trim();
              if (input.isEmpty || !input.contains('@')) {
                return 'Please enter a valid Email address.';
              }
              return null;
            },
            // onSaved: (value) => print(value),
          ),
          SignupTextField(
            icon: GestureDetector(
              onTap: () {
                setState(() {
                  obsecure = !obsecure;
                });
              },
              child: Icon(obsecure ? Icons.visibility_off : Icons.visibility),
            ),
            hint: 'Password',
            controller: widget.passwordController,
            obsecureText: obsecure,
            validator: (value) {
              final input = value.toString().trim();

              if (input.length < 7) {
                return 'Please enter a password of 7 characters or more.';
              }
              return null;
            },
          ),
          if (!widget.isLogin)
            SignupTextField(
              hint: 'First name',
              controller: widget.firstNameController,
              validator: (value) {
                final input = value.toString().trim();

                if (input.isEmpty) {
                  return 'Please enter a valid first name.';
                }
                return null;
              },
            ),
          if (!widget.isLogin)
            SignupTextField(
              hint: 'Last name',
              controller: widget.lastNameController,
              validator: (value) {
                final input = value.toString().trim();

                if (input.isEmpty) {
                  return 'Please enter a valid last name.';
                }
                return null;
              },
            ),
        ],
      ),
    );
  }
}
