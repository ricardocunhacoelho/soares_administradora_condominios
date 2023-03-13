import 'package:flutter/material.dart';
import '../../app.style.dart';
import '../../size.config.dart';

class BottomTabBarLista extends StatefulWidget {
  final Function onChange;
  final int indexSelecionado;

  const BottomTabBarLista(
      {super.key, required this.onChange, required this.indexSelecionado});

  @override
  State<BottomTabBarLista> createState() => _BottomTabBarListState();
}

class _BottomTabBarListState extends State<BottomTabBarLista> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => widget.onChange(index),
      currentIndex: widget.indexSelecionado,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kWhite,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          // icon: ImageIcon(
          //   const AssetImage("assets/home.png"),
          //   size: SizeConfig.blockSizeHorizontal! * 5.5,
          //   color: widget.indexSelecionado == 0 ? kDarkBlue : kGrey,
          // ),
          icon: Icon(
            Icons.home,
            color: widget.indexSelecionado == 0 ? kDarkBlue : kGrey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          // icon: ImageIcon(
          //   const AssetImage("assets/bible.png"),
          //   size: SizeConfig.blockSizeHorizontal! * 5.5,
          //   color: widget.indexSelecionado == 1 ? kDarkBlue : kGrey,
          // ),
          icon: Icon(
            Icons.business_outlined,
            color: widget.indexSelecionado == 1 ? kDarkBlue : kGrey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          // icon: ImageIcon(
          //   const AssetImage("assets/user_1.png"),
          //   size: SizeConfig.blockSizeHorizontal! * 5.5,
          //   color: widget.indexSelecionado == 2 ? kDarkBlue : kGrey,
          // ),
          icon: Icon(
            Icons.more_horiz_rounded,
            color: widget.indexSelecionado == 2 ? kDarkBlue : kGrey,
          ),
          label: '',
        ),
      ],
    );
  }
}
