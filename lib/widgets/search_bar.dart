import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          color: Color(0xff8892b0),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const CupertinoSearchTextField(
        suffixIcon: Icon(
          CupertinoIcons.ellipsis_vertical,
          color: CupertinoColors.white,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            CupertinoIcons.search,
            color: CupertinoColors.white,
          ),
        ),
      ),
    );
  }
}
