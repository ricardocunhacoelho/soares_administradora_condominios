import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/app.style.dart';
import 'package:soares_administradora_condominios/size.config.dart';

class CategoriesSection extends StatefulWidget {
  final Function change;
  final int current;
  const CategoriesSection({super.key, required this.change, required this.current});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  List<String> categories = [
    "Todos",
    "Moradores",
    "Visitantes",
    "Funcionários",
  ];

  List<String> icons = [
    'all_person',
    'residents_icon',
    'visitors_icon',
    'service_providers_icons',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              widget.change(index);
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                  right: index == categories.length - 1 ? 20 : 15),
              padding: const EdgeInsets.all(5),
              height: 36,
              width: 120,
              decoration: BoxDecoration(
                  color: widget.current == index ? kBlue : kWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: widget.current == index
                      ? null
                      : Border.all(
                          color: kLightGrey,
                          width: 1,
                        )),
              child: Center(
                child: Text(categories[index],
                    style: kPoppinsMedium.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        color: widget.current == index ? kWhite : kDarkBlue)),
              ),
            ),
          );
        },
      ),
    );
  }
}
