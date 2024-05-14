import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/feed_model.dart';
import '../view_models/feed_view_model.dart';
import '../widgets/image_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FeedViewModel feedViewModel = context.watch<FeedViewModel>();
    return Scaffold(
      bottomNavigationBar: ClipRRect(
         borderRadius: const BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
        child: BottomAppBar(
          
          color: Color(0xFF1E2E5D),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset("assets/svgs/home.svg"),
              SvgPicture.asset("assets/svgs/Search.svg"),
              SvgPicture.asset("assets/svgs/add.svg"),
              SvgPicture.asset("assets/svgs/reels.svg"),
              SvgPicture.asset("assets/svgs/profile.svg")
            ],
          ),
        ),
      ),
      // appBar: AppBar(
      //  backgroundColor: Colors.white,
      //  elevation: 0,
      //   leading: SvgPicture.asset("assets/svgs/backarrow.svg",width: 50,height: 50,),
      //   actions: [
      //     SvgPicture.asset("assets/svgs/dotarrow.svg")
      //   ],
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/svgs/backarrow.svg"),
                      Spacer(),
                      SvgPicture.asset("assets/svgs/dotarrow.svg")
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/images/profilepic.png"),
                      ),
                      titleIndicator("Post", 50),
                      titleIndicator("Followers", 564),
                      titleIndicator("Following", 564)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rayan Moon",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF1E3167),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Photographer",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF1E3167),
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "🌟 You are beautiful, and \nI'm here to capture it! 🌟",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF1E3167),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: Text("Edit Profile"),style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF184AC0),
                            minimumSize: Size(145, 40)
                          ),),
                      ElevatedButton(onPressed: () {}, child: Text("Wallet"),style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF28426B),
                            minimumSize: Size(145, 40)
                          ),),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.call,
                      //     color: Colors.black,
                      //   ),
                      //  color: Color(0xFF184AC0).withOpacity(0.7),
                      // )
                      ElevatedButton(onPressed: (){}, child: Icon(Icons.call,color: Colors.white,),style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF184AC0).withOpacity(0.7),
                            minimumSize: Size(40, 40)
                          ),)
                    ],
                  ),
                ],
              ),
            ),
            TabBar(
              indicatorColor: Colors.transparent,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              controller: tabController, tabs: [
              Tab(
                  child: Container(
                    width: size.width/2,
                    height: 30,
                child: Center(
                  child: Text(
                    "Photos",
                    style: GoogleFonts.poppins(
                        color: Color(0xFFA7ACD0),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFA7ACD0), width: 1)),
              ),),
              Tab(
                child: Container(
                  width: size.width/2,
                  height: 30,
                child: Center(
                  child: Text(
                    "Videos",
                    style: GoogleFonts.poppins(
                        color: Color(0xFFA7ACD0),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFA7ACD0), width: 1)),
              ),
              )
            ]),
            Expanded(
                child: TabBarView(controller: tabController, children: [
              _ui(feedViewModel),
              Center(child: Text("no videos found"))
            ]))
          ],
        ),
      ),
    );
  }

  Widget titleIndicator(String name, int number) => Column(
        children: [
          Text(
            "$number",
            style: GoogleFonts.poppins(
                color: Color(0xFF1E3167),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          Text(
            name,
            style: GoogleFonts.poppins(
                color: Color(0xFF1E3167).withOpacity(0.6),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ],
      );

  _ui(FeedViewModel feedViewModel) {
    if (feedViewModel.loading) {
      return Center(child: CircularProgressIndicator());
    }
    if (feedViewModel.userError.code != null &&
        feedViewModel.userError.code != 200) {
      return Center(child: Text("Something went wrong"));
    }
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 8,mainAxisSpacing: 8),
          itemCount: feedViewModel.feed.media!.length,
          itemBuilder: (context, index) {
            Feed feed = feedViewModel.feed;
            return ImageWidget(imageUrl: feed.media![index].profilePic,likes: feed.media![index].likeCount,comments: feed.media![index].commentCount,);
          }),
    );
  }
}
