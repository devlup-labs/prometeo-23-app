import 'package:flutter/material.dart';

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
      child: const TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
