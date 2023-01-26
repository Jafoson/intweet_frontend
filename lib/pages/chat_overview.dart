import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intweet_aplikation/components/costum_searchbar.dart';
import 'package:intweet_aplikation/components/top_bar.dart';

class ChatOverview extends StatelessWidget {
  const ChatOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2C3333),
        appBar: const TopBar(),
        body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(children: [
            const CostumSearch(),
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 8),
                  // color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 8, bottom: 8, right: 16),
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*"),
                                fit: BoxFit.fill)),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Paul",
                            textAlign: TextAlign.left,
                          ),
                          Text(
                              "Hallo du kleine Bitch ich hasse dich denn du bist eine hässliche Kuh!!!",
                              textAlign: TextAlign.left),
                        ],
                      )),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("12:33"),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 6, right: 6, top: 2, bottom: 2),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Text("99+"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ))
          ]),
        )
        // SearchBar(),
        );
  }
}
