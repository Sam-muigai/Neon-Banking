import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_banking/data/shared_preference/preference_repository.dart';
import 'package:neon_banking/pages/home_page/home_page.dart';
import 'package:neon_banking/pages/login_bloc.dart';
import 'package:neon_banking/pages/login_event.dart';
import 'package:neon_banking/pages/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final pinController = TextEditingController();
  final pinFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  bool obscureText = true;
  final GlobalKey<State> _dialogKey = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginBloc(preferenceRepository: PreferenceRepository()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'lib/assets/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          'lib/assets/image_logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Form(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8.0,
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              focusNode: phoneFocusNode,
                              decoration: const InputDecoration(
                                label: Text('Mobile Phone'),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: pinController,
                              focusNode: pinFocusNode,
                              decoration: InputDecoration(
                                label: const Text(
                                  'Pin',
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        obscureText = !obscureText;
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                  ),
                                ),
                              ),
                              obscureText: obscureText,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                          ],
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 48.0,
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                      return Container(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginClicked(
                                phone: phoneController.text,
                                password: pinController.text,
                              ),
                            );
                          },
                          style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Log In',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                if (state is LoginLoading) {
                  pinFocusNode.unfocus();
                  phoneFocusNode.unfocus();
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Dialog(
                          key: _dialogKey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(2)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 16.0),
                              child: Row(
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Loading..Please wait')
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  });
                }
                if (state is LoginSuccess) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                    print('login success');
                  });
                }
                if (state is LoginError) {
                  if (_dialogKey.currentContext != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).pop();
                    });
                  }
                  print('login error');
                }
                return Container();
              })
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    pinController.dispose();
    pinFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }
}
