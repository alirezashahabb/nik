import 'package:flutter/material.dart';
import 'package:nikeshop/data/repositroy/auth_repositroy.dart';

class AuthScreens extends StatefulWidget {
  const AuthScreens({super.key});

  @override
  State<AuthScreens> createState() => _AuthScreensState();
}

class _AuthScreensState extends State<AuthScreens> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    const Color onbackground = Colors.white;
    return Theme(
      data: themeData.copyWith(
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
        body: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
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
                isLogin ? 'خوش امدید' : 'ثبت نام',
                style: const TextStyle(
                  color: onbackground,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                isLogin
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
              const TextField(
                decoration: InputDecoration(label: Text('آدرس ایمیل')),
              ),
              const SizedBox(
                height: 20,
              ),
              const _TextFieldPasswords(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  authRepositroy.login('test@gmail.com', '123456');
                },
                child: Text(isLogin ? 'ورود ' : 'ثبت نام'),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLogin ? 'حساب کاربری ندارید' : 'حساب کاربری دارید',
                      style: const TextStyle(
                        color: onbackground,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      isLogin ? 'ثبت نام' : 'ورود',
                      style: TextStyle(
                        color: themeData.colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TextFieldPasswords extends StatefulWidget {
  const _TextFieldPasswords();

  @override
  State<_TextFieldPasswords> createState() => _TextFieldPasswordsState();
}

class _TextFieldPasswordsState extends State<_TextFieldPasswords> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
