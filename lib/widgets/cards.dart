import 'package:flutter/cupertino.dart';

class Cards extends StatefulWidget {

  String title;
  String date;
  String imageLink;
  
  Cards({required this.imageLink, required this.date, required this.title, super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GestureDetector(
        onTap: (){
          // some logic
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            image: DecorationImage(  
              fit: BoxFit.cover,
              image: NetworkImage(widget.imageLink)
            )
          ),
          child: Stack(
            children: [
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(widget.title,
                          style: const TextStyle(  
                            fontSize: 30,
                            color: CupertinoColors.white
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          widget.date,
                          style:const TextStyle(  
                            color: CupertinoColors.white,
                          ),
                        )
                      )
                    ],
                  ),
                ),
              Positioned(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: CupertinoColors.systemGrey,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: const Icon(
                      CupertinoIcons.heart_fill,
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}