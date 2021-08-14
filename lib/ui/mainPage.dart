import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  List<String> avatarUrl = [
    "assets/images/oybek.png",
    "assets/images/ali.jpg",
    "assets/images/umid.jpg",
  ];

  List<String> storyUrl = [
    "https://images.unsplash.com/photo-1600055882386-5d18b02a0d51?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=621&q=80",
    "https://images.unsplash.com/photo-1600174297956-c6d4d9998f14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1600008646149-eb8835bd979d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=666&q=80",
    "https://images.unsplash.com/photo-1502920313556-c0bbbcd00403?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a1a1a),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF262626),
        title: Text(
          "Facebook",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        //Now let's add the action button
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF262626),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage(avatarUrl[0]),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 25.0),
                                  hintText: "Post something...",
                                  filled: true,
                                  fillColor: Color(0xFF505050),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        color: Color(0xFF505050),
                        thickness: 1.5,
                      ),
                      Row(
                        children: [
                          actionButton(
                              Icons.live_tv, "Live", Color(0xFFF23E5C)),
                          actionButton(
                              Icons.image, "Picture", Color(0xFF58C472)),
                          actionButton(Icons.insert_emoticon, "Activity",
                              Color(0xFFF8C03E)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 160.0,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    storyTile(avatarUrl[0], storyUrl[0], "Tokiyo"),
                    storyTile(avatarUrl[1], storyUrl[1], "Uzbekistan"),
                    storyTile(avatarUrl[2], storyUrl[2], "Mountain"),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              feedBox("assets/images/oybek.png", "Oybek Soliev", "6 min",
                  "I just wrote something", ""),
              feedBox("assets/images/ali.jpg", "Alijon Xurshidov", "6 min",
                  "It's pretty good I like it", storyUrl[2]),
              feedBox("assets/images/umid.jpg", "Umid Rukhiddinov", "Yesterday",
                  "I'm Umid Rukhiddinov and I have a Dream", storyUrl[1]),
            ],
          ),
        ),
      ),
    );
  }
  Widget actionButton(IconData icon, String actionTitle, Color iconColor) {
    return Expanded(
      child: FlatButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          color: iconColor,
        ),
        label: Text(
          actionTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  Widget storyTile(String avatarUrl, String storyUrl, String userName) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      height: 144.0,
      width: 120.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: NetworkImage(storyUrl),
            fit: BoxFit.cover,
          )),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatarUrl),
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              userName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18.0,
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget feedBox(String avatarUrl, String userName, String date,
      String contentText, String contentImg) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0xFF262626),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(avatarUrl),
                  radius: 25.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            if (contentText != "")
              Text(
                contentText,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            SizedBox(
              height: 10.0,
            ),
            if (contentImg != "") Image.network(contentImg),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              thickness: 1.5,
              color: Color(0xFF505050),
            ),
            Row(
              children: [
                actionButton(Icons.thumb_up, "Like", Color(0xFF505050)),
                actionButton(Icons.comment, "Reply", Color(0xFF505050)),
                actionButton(Icons.share, "Share", Color(0xFF505050)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

