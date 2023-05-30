import 'package:flutter/material.dart';
import 'package:freelance/layouts/header_mainpage.dart';
import 'package:freelance/model_widget/rounded_card.dart';
import 'package:freelance/model_widget/rounded_image.dart';
import 'package:freelance/pages/message/messsage_detail.dart';
import 'package:freelance/utils/app_styles.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const MainPageHeader(title: 'Message'),
          const SizedBox(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 246, 241, 241)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      //controller: search,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.blue,
                      decoration: const InputDecoration.collapsed(
                        hintText: "Search",
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                RoundedCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageDetail()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: RoundedImage(
                          size: 50,
                          image: AssetImage('assets/images/profile.jpg'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Sender/Recipient Name",
                                    style: Styles.headLineStyle3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'May, 5 2023',
                                  style: Styles.headLineStyle3,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'text content asdjknaskjdnakj sndkjanskdan a sjkdnaskjd nak jnakdj ndjksandkjas',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
