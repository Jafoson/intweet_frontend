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
                        children: [
                          Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              child: const Text(
                                "Paul",
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xffD5FAFF),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          const Text(
                              "gzfrgfrzgrhguhuhhzugfzgfhzrugzhgzughihfhjughzuhgrungrhuuzhgrezhrzuhzuhzu",
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xff93B6C1), fontSize: 14)),
                        ],
                      )),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("12:33",
                                style: TextStyle(
                                    color: Color(0xff93B6C1), fontSize: 14)),
                            Container(
                              margin: const EdgeInsets.only(top: 18),
                              padding: const EdgeInsets.only(
                                  left: 6, right: 6, top: 2, bottom: 2),
                              decoration: const BoxDecoration(
                                  color: Color(0xff008973),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: const Text(
                                "99+",
                                style: TextStyle(
                                    color: Color(0xffD5FAFF),
                                    fontWeight: FontWeight.bold),
                              ),
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
