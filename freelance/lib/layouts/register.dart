import 'package:flutter/material.dart';
import 'package:freelance/controller/auth_controller.dart';
import 'package:freelance/model/register_model.dart';
import 'package:freelance/utils/auth.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../utils/app_styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Freelance",
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                ),
                const Gap(70),
                Column(
                  children: [
                    TextFormField(
                      controller: _authController.fullNameController,
                      decoration: const InputDecoration(hintText: 'Full Name'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _authController.emailController,
                      decoration: const InputDecoration(hintText: "Email"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _authController.passwordController,
                      decoration: const InputDecoration(hintText: "Password"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    (_authController.loading)
                        ? SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              color: primary,
                              strokeWidth: 3,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 90,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      side: BorderSide(color: primary),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      foregroundColor: primary),
                                  onPressed: () => {Navigator.pop(context)},
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: primary),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 90,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: primary),
                                  onPressed: register,
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                    const Gap(40),
                    (_authController.end)
                        ? Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                _authController.pesan,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )
                        : const Gap(2)
                  ],
                )
              ]),
        ),
      ),
    );
  }

  void register() async {
    setState(() {
      _authController.loading = true;
    });

    RegisterModel result = await _authController.register();

    setState(() {
      _authController.loading = true;
    });

    if (result.code == 1) {
      setState(() {
        _authController.end = true;
        _authController.pesan = result.message;
      });
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    } else {
      setState(() {
        _authController.end = true;
        _authController.pesan = result.message;
      });
    }
  }
}
