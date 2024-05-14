// To parse this JSON data, do
//
//     final feed = feedFromJson(jsonString);

import 'dart:convert';

Feed feedFromJson(String str) => Feed.fromJson(json.decode(str));

String feedToJson(Feed data) => json.encode(data.toJson());

class Feed {
    String? sts;
    String? msg;
    int? postCount;
    List<Media>? media;

    Feed({
         this.sts,
         this.msg,
         this.postCount,
         this.media,
    });

    factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        sts: json["sts"],
        msg: json["msg"],
        postCount: json["postCount"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "postCount": postCount,
        "media": List<dynamic>.from(media!.map((x) => x.toJson())),
    };
}

class Media {
    String id;
    String userId;
    String fileType;
    String fileName;
    String filePath;
    String description;
    List<String> likedBy;
    int likeCount;
    List<String> commentId;
    int commentCount;
    bool story;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String firstName;
    String lastName;
    String profilePic;

    Media({
        required this.id,
        required this.userId,
        required this.fileType,
        required this.fileName,
        required this.filePath,
        required this.description,
        required this.likedBy,
        required this.likeCount,
        required this.commentId,
        required this.commentCount,
        required this.story,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.firstName,
        required this.lastName,
        required this.profilePic,
    });

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["_id"],
        userId: json["userId"],
        fileType: json["fileType"],
        fileName: json["fileName"],
        filePath: json["filePath"],
        description: json["description"],
        likedBy: List<String>.from(json["likedBy"].map((x) => x)),
        likeCount: json["likeCount"],
        commentId: List<String>.from(json["commentId"].map((x) => x)),
        commentCount: json["commentCount"],
        story: json["story"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        firstName:json["firstName"] ,
        lastName: json["lastName"],
        profilePic: json["profilePic"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "fileType": fileType,
        "fileName": fileName,
        "filePath": filePath,
        "description": description,
        "likedBy": List<dynamic>.from(likedBy.map((x) => x)),
        "likeCount": likeCount,
        "commentId": List<dynamic>.from(commentId.map((x) => x)),
        "commentCount": commentCount,
        "story": story,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "firstName": firstName,
        "lastName": lastName,
        "profilePic": profilePic,
    };
}

