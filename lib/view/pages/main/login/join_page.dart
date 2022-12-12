import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/core/util/validator_util.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_form.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_password_form.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/line_button.dart';

import '../components/line_app_bar.dart';

class JoinPage extends StatelessWidget {
  JoinPage({Key? key}) : super(key: key);
  //컴포넌트화에 조금더 심혈을 기울어야 했음 완전 뒤죽박죽
  final pwVali = validatePassword();
  final emailVali = validatePassword();

  final _formKey = GlobalKey<FormState>();

  //입력된 값 정리 해주기 위해서
  final _username = TextEditingController(); // 추가
  final _password = TextEditingController(); // 추가
  final _email = TextEditingController(); // 추가
  final _nickname = TextEditingController(); // 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("이메일 간편가입", null),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 30),
              _buildEmailForm(
                emailVali,
                _email,
              ),
              SizedBox(height: 24),
              CustomForm(
                "닉네임",
                "닉네임을 입력해주세요",
                funValidator: validateNickname(),
                controllerInput: _nickname,
              ),
              SizedBox(height: 18),
              _buildPasswordForm(
                pwVali,
                _password,
              ),
              SizedBox(height: 40),
              LineButton("회원가입", "/login", funPageRoute: () async {
                if (_formKey.currentState!.validate()) {}
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailForm(emailValidate, _controllerInput) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "이메일",
          style: textTheme(color: kchacholGreyColor(), weight: FontWeight.w700)
              .bodyText1,
        ),
        SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                //width: 222,
                //color: Colors.blue,
                padding: EdgeInsets.only(top: 2),
                child: TextFormField(
                  controller: _controllerInput,
                  validator: emailValidate,
                  decoration: new InputDecoration(
                    hintText: "이메일을 입력해주세요",
                    contentPadding:
                        EdgeInsets.only(top: 12, bottom: 12, left: 10),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kmidGreyColor(),
                      ),
                    ),
                    hintStyle: textTheme(
                            color: kmidGreyColor(), weight: FontWeight.bold)
                        .headline2,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                //color: Colors.green,
                padding: EdgeInsets.only(left: 6, top: 1),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(color: Colors.white),
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 16, bottom: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0.0),
                  child: Text(
                    "인증하기",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Column _buildPasswordForm(pwValidate, _controllerInput) {
    return Column(
      children: [
        //텍스트 필드 난무
        CustomPasswordForm(
          "비밀번호",
          "비밀번호를 입력해주세요",
          funValidator: validatePassword(),
          controllerInput: _controllerInput,
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: _controllerInput,
          validator: pwValidate,
          decoration: InputDecoration(
            hintText: "비밀번호를 입력해주세요",
            contentPadding:
                const EdgeInsets.fromLTRB(10, 14, double.minPositive, 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: kmidGreyColor(),
              ),
            ),
            hintStyle:
                textTheme(color: kmidGreyColor(), weight: FontWeight.bold)
                    .headline2,
          ),
          obscureText: true,
        )
      ],
    );
  }
}
