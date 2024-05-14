import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  final int? likes;
  final int? comments;
  const ImageWidget({super.key,this.imageUrl,this.likes,this.comments});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width/2-100,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(image: NetworkImage(imageUrl!)),
        borderRadius: BorderRadius.circular(20),
        
      ),
      child: Container(
        child: Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                bottomContent("assets/svgs/Likes.svg", "$likes"),
                SizedBox(width: 20,),
                bottomContent("assets/svgs/Comments.svg", "$comments")
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget bottomContent(String img, String count) => Column(
                  children: [
                    SvgPicture.asset(img),
                    SizedBox(height: 5,),
                    Text(count,style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12
                    ),)
                  ],
                );
}