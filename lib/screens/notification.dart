import 'package:flutter/material.dart';
import 'package:ojt_app/theme.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(65),
              child: Text(
                "Notifications",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: listView(),
      ),
    );
  }
}

listView() {
  return ListView.separated(
      itemBuilder: (context, index) {
        return listViewItem(index);
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.black,
        );
      },
      itemCount: 5);
}

listViewItem(int index) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        prefixIcon(),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message(index),
                timeAndDate(index),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

prefixIcon() {
  return Container(
    height: 50,
    width: 50,
    padding: EdgeInsets.all(10),
    child: Icon(
      Icons.notifications_outlined,
      size: 25,
      color: Colors.red,
    ),
  );
}

message(int index) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: 'Title',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          "Description",
          style: TextStyle(
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    ),
  );
}

timeAndDate(int index) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "08-10-2023",
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}
