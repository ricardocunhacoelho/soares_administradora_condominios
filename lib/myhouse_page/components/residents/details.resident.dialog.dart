import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class DetailsResidentDialog extends StatefulWidget {
  final ResidentEntity resident;

  const DetailsResidentDialog({super.key, required this.resident});
  @override
  _DetailsResidentDialogState createState() =>
      new _DetailsResidentDialogState();
}

class _DetailsResidentDialogState extends State<DetailsResidentDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome completo: ${widget.resident.name}',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Text(
              'E-mail: ${widget.resident.email}',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Text(
              'Telefone: ${widget.resident.phoneNumber}',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Text(
              'CPF: ${widget.resident.cpf}',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Text(
              'Data de nascimento: ${widget.resident.bornDate.day} / ${widget.resident.bornDate.month} / ${widget.resident.bornDate.year}',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Text(
              'Acesso: ${widget.resident.access ? 'permitido' : 'sem acesso'}',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            if(!widget.resident.access)
            Text(
              'Por favor aguarde a avaliação da administração para liberação do acesso. Após conclusão, a senha inicial será o CPF do morador(a).',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: Colors.red,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      actions: [
        Container(
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: kGrey,
          ),
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Voltar',
                  style: kPoppinsSemiBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    color: kLightWhite,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
