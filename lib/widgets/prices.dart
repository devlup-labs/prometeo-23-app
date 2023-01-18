import 'package:flutter/material.dart';
import 'package:prometeo23/widgets/position.dart';

class Price extends StatefulWidget {
  String firstPrice;
  String secondPrice;
  String thirdPrice;

  Price({
    required this.firstPrice,
    required this.secondPrice,
    required this.thirdPrice,
  });

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height / 12,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
      ),
      decoration: BoxDecoration(
        // color: Color(0xff64ffda),
        color: const Color(0xff575B5e),
        // color: Color(0xffC1DEAE),
        // color: Color(0xff66BFBF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.01,
          bottom: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Position(position: "2", abbr: "nd"),
                const SizedBox(
                  height: 5,
                ),
                PriceAmount(amount: widget.secondPrice),
              ],
            ),
            const VerticalLine(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Position(position: "1", abbr: "st"),
                const SizedBox(
                  height: 5,
                ),
                PriceAmount(amount: widget.firstPrice),
              ],
            ),
            const VerticalLine(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Position(position: "3", abbr: "rd"),
                const SizedBox(
                  height: 5,
                ),
                PriceAmount(amount: widget.thirdPrice),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalLine extends StatelessWidget {
  const VerticalLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      color: Colors.white,
    );
  }
}

class PriceAmount extends StatelessWidget {
  String amount;
  PriceAmount({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Text(
      amount,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
