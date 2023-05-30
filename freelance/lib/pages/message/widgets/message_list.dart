import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:freelance/model/chatlist_model.dart';
import 'package:intl/intl.dart';

import '../../../model_widget/rounded_card.dart';
import '../../../model_widget/rounded_image.dart';
import '../../../utils/app_styles.dart';
import '../messsage_detail.dart';

class MessageList extends StatefulWidget {
  final ChatlistModel? myChatlistModel;
  const MessageList(this.myChatlistModel, {super.key});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             MessageDetail(id: widget.myChatlistModel?.id)));
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
                        "${widget.myChatlistModel?.sender?.name}",
                        style: Styles.headLineStyle3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${widget.myChatlistModel?.updatedAt?.day}/${widget.myChatlistModel?.updatedAt?.month}/${widget.myChatlistModel?.updatedAt?.year}",
                      style: Styles.headLineStyle3,
                    )
                  ],
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                // const Text(
                //   'text content asdjknaskjdnakj sndkjanskdan a sjkdnaskjd nak jnakdj ndjksandkjas',
                //   overflow: TextOverflow.ellipsis,
                //   maxLines: 2,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
