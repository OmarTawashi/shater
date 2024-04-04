

enum MediaStatus { Image, Video, Text }

class MediaType {
  MediaStatus? mType;

  MediaType({this.mType});

  MediaType.fromType(MediaStatus type) {
    this.mType = type;
  }

  MediaType.fromString(String type) {
    this.mType = questionTypeFromType(type);
  }

  MediaStatus questionTypeFromType(String type) {
    switch (type) {
      case "video":
        return MediaStatus.Video;
      case "image":
        return MediaStatus.Image;
      case "text":
        return MediaStatus.Text;
      default:
        return MediaStatus.Image;

    }
  }
}

// extension QuestionStatusColorExt on MediaStatus {
//   String getUrlMedia(String bathUrl) {
//     switch (this) {
//       case MediaStatus.Image:
//         return  (ApiConstant.baseUrl +'');
//       case MediaStatus.Video:
//         return MediaStatus.Video;
//       case MediaStatus.Text:
//         return MediaStatus.Text;
//     }
//   }
// }
