import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yhinsocial/states/create_account.dart';
import 'package:yhinsocial/states/my_service.dart';
import 'package:yhinsocial/utility/my_constant.dart';
import 'package:yhinsocial/utility/my_dialog.dart';
import 'package:yhinsocial/widgets/show_button.dart';
import 'package:yhinsocial/widgets/show_form.dart';
import 'package:yhinsocial/widgets/show_image.dart';
import 'package:yhinsocial/widgets/show_text.dart';
import 'package:yhinsocial/widgets/show_text_button.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
        child: Container(
          decoration: MyConstant().planBox(),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newImage(),
                  newText(),
                  newEmail(),
                  newPassword(),
                  newLoginButton(),
                  newCreateAccount(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row newCreateAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowText(
          label: 'Non Account ?',
          textStyle: MyConstant().h2Style(),
        ),
        ShowTextButton(
          label: 'Create Account',
          pressFunc: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateAccount(),
                ));
          },
        ),
      ],
    );
  }

  ShowButton newLoginButton() => ShowButton(
        label: 'Login',
        pressFunc: () {
          if ((email?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            MyDiablog(context: context).twoWayAction(
                title: 'Have Space ?', subTitle: 'Please Fill Every Blank');
          } else {
            processCheckAuthen();
          }
        },
      );

  ShowForm newPassword() {
    return ShowForm(
      obscue: true,
      label: 'Password :',
      iconData: Icons.lock_outline,
      changeFunc: (String string) {
        password = string.trim();
      },
    );
  }

  ShowForm newEmail() {
    return ShowForm(
      label: 'Email :',
      iconData: Icons.contact_mail_outlined,
      changeFunc: (String string) {
        email = string.trim();
      },
    );
  }

  ShowText newText() {
    return ShowText(
      label: 'Login :',
      textStyle: MyConstant().h1Style(),
    );
  }

  SizedBox newImage() {
    return const SizedBox(
      width: 150,
      child: ShowImage(),
    );
  }

  Future<void> processCheckAuthen() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      print('Authen Success');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MyService(),
          ),
          (route) => false);
    }).catchError((value) {
      MyDiablog(context: context)
          .twoWayAction(title: value.code, subTitle: value.message);
    });
  }
}
