enum QType {
  MultiChoiceText,
  TrueOrFalse,
  OrderWord,
  MultiChoiceImage,
  ConnectSentence,
  ConnectImageTextSentence,
  ConnectImageSentence,
  CompleteSentence,
  WhoConic,
  MakingNumber,
  ShapeCount,
  LongDivision,
  Fractions,
  CompleteValue,
  CompleteSound,
  CompleteAll,
  TrueOrFalseImage,
  MultiChoiceImageTitle,
  MultiChoiceImageSound,
  OrderWithImage,
  ImageCount,
  MathOperations,
  VideoSkip,
  ComprehensiveSelectImage,
  ComprehensiveAttachmentsInput,
  WritingDrawing,
  LongDivisionType,
  FractionsType,
  CalculationsType,
  None,
}

class QuestionType {
  QType? qtype;

  QuestionType({this.qtype});

  QuestionType.fromType(QType type) {
    this.qtype = type;
  }

  QuestionType.fromString(String type) {
    this.qtype = questionTypeFromType(type);
  }

  QType questionTypeFromType(String type) {
    switch (type) {
      case "1":
        return QType.MultiChoiceText;
      case "2":
        return QType.TrueOrFalse;
      case "3":
        return QType.OrderWord;
      case "4":
        return QType.ComprehensiveSelectImage;
      case "5":
        return QType.ConnectSentence;
      case "6":
        return QType.ConnectImageTextSentence;
      case "7":
        return QType.ConnectImageSentence;
      case "8":
        return QType.CompleteSentence;
      case "9":
        return QType.WhoConic;
      case "10":
        return QType.MakingNumber;
      case "11":
        return QType.ShapeCount;
      case "12":
        return QType.LongDivision;
      case "13":
        return QType.Fractions;
      case "14":
        return QType.CompleteValue;
      case "15":
        return QType.CompleteSound;
      case "16":
        return QType.CompleteAll;
      case "17":
        return QType.TrueOrFalseImage;
      case "18":
        return QType.MultiChoiceImageSound;
      case "19":
        return QType.MultiChoiceText;
      case "20":
        return QType.OrderWithImage;
      case "21":
        return QType.ImageCount;
      case "22":
        return QType.MathOperations;
      case "23":
        return QType.VideoSkip;
      case "24":
        return QType.MultiChoiceImage;
      case "25":
        return QType.CompleteValue;
      case "26":
        return QType.WritingDrawing;
      case "27":
        return QType.LongDivisionType;
      case "28":
        return QType.FractionsType;
      case "29":
        return QType.CalculationsType;
      default:
        return QType.None;
    }
  }
}
