import 'package:flutter/material.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class RegisterNewVisitor extends StatefulWidget {
  const RegisterNewVisitor({super.key});

  @override
  State<RegisterNewVisitor> createState() => _RegisterNewVisitorState();
}

class _RegisterNewVisitorState extends State<RegisterNewVisitor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/registerVisitorForm');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(kBorderRadius),
              boxShadow: [
                BoxShadow(
                    color: kDarkBlue.withOpacity(0.051),
                    offset: const Offset(0.0, 3.0),
                    blurRadius: 24.0,
                    spreadRadius: 0.0)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/cadastro.png'),
                          fit: BoxFit.contain),
                    )),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                      'Toque para cadastrar mais visitantes em sua casa.',
                      style: kPoppinsMedium.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          color: kDarkBlue)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
