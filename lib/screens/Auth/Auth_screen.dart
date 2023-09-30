import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikeshop/data/repositroy/auth_repositroy.dart';
import 'package:nikeshop/screens/Auth/bloc/auth_bloc.dart';

class AuthScreens extends StatefulWidget {
  const AuthScreens({super.key});

  @override
  State<AuthScreens> createState() => _AuthScreensState();
}

class _AuthScreensState extends State<AuthScreens> {
  final TextEditingController userNameController =
      TextEditingController(text: 'test@gmail.com');

  final TextEditingController passwordController =
      TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    const Color onbackground = Colors.white;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Theme(
        data: themeData.copyWith(
          snackBarTheme: SnackBarThemeData(
            backgroundColor: themeData.colorScheme.primary,
            contentTextStyle: const TextStyle(fontFamily: 'Iran'),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              minimumSize: const MaterialStatePropertyAll(
                Size.fromHeight(56),
              ),
              backgroundColor: MaterialStateProperty.all(
                onbackground,
              ),
              foregroundColor:
                  MaterialStateProperty.all(themeData.colorScheme.secondary),
            ),
          ),
          colorScheme: themeData.colorScheme.copyWith(onSurface: onbackground),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: const TextStyle(
              color: onbackground,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: themeData.colorScheme.secondary,
          body: BlocProvider<AuthBloc>(
            create: (context) {
              final authBloc = AuthBloc(authRepositroy);
              authBloc.stream.forEach((state) {
                if (state is AuthSuccses) {
                  Navigator.of(context).pop();
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.exption.message),
                    ),
                  );
                }
              });
              authBloc.add(AuthStartedEvent());
              return authBloc;
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) {
                  return current is AuthLoading ||
                      current is AuthInitial ||
                      current is AuthError;
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/nike_logo.png',
                        color: onbackground,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        state.isLoginMode ? 'خوش امدید' : 'ثبت نام',
                        style: const TextStyle(
                          color: onbackground,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        state.isLoginMode
                            ? 'لطفا وارد حساب کاربری خود شوید'
                            : 'ایمیل و رمز عبور خود را تعین کنید',
                        style: const TextStyle(
                          color: onbackground,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                          label: Text('آدرس ایمیل'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _TextFieldPasswords(password: passwordController),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                              AuthBottomIsClickedEvent(userNameController.text,
                                  passwordController.text));
                        },
                        child: state is AuthLoading
                            ? const CircularProgressIndicator()
                            : Text(state.isLoginMode ? 'ورود ' : 'ثبت نام'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(AuthChangedClickedEvnet());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.isLoginMode
                                  ? 'حساب کاربری ندارید'
                                  : 'حساب کاربری دارید',
                              style: const TextStyle(
                                color: onbackground,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              state.isLoginMode ? 'ثبت نام' : 'ورود',
                              style: TextStyle(
                                color: themeData.colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextFieldPasswords extends StatefulWidget {
  final TextEditingController password;
  const _TextFieldPasswords({required this.password});

  @override
  State<_TextFieldPasswords> createState() => _TextFieldPasswordsState();
}

class _TextFieldPasswordsState extends State<_TextFieldPasswords> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.password,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
          icon: obscure
              ? Icon(
                  Icons.visibility_outlined,
                  color: Colors.white.withOpacity(0.8),
                )
              : Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.white.withOpacity(0.8),
                ),
        ),
        label: const Text(
          'رمز عبور',
        ),
      ),
    );
  }
}
