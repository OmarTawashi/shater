import 'package:flutter/material.dart';

enum QType {
  MultiChoiceText,
  TrueOrFalse,
  OrderWord,
  MultiChoiceImage,
  MultiChoiceVirtical,
  ConnectSentence,
  ConnectImageTextSentence,
  MatchImage,
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
  MultiChoiceTextSound,
  OrderImage,
  ImageCount,
  MathOperations,
  ArithmeticText,
  ComprehensiveImage,
  ComprehensiveSelectImage,
  ComprehensiveAttachmentsInput,
  WritingBoard,
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
        return QType.MatchImage;
      case "7":
        return QType.ConnectImageTextSentence;
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
        return QType.OrderImage;
      case "21":
        return QType.ImageCount;
      case "22":
        return QType.MathOperations;
      case "23":
        return QType.ComprehensiveImage;
      case "24":
        return QType.MultiChoiceImage;
      case "25":
        return QType.WritingBoard;
      case "27":
        return QType.ArithmeticText;
      case "28":
        return QType.FractionsType;
      case "29":
        return QType.CalculationsType;
      case "30":
        return QType.MultiChoiceVirtical;
      default:
        return QType.None;
    }
  }
}

extension QuestionComprehensiveImageExt on String {
  Widget getComprehensiveImageWidget({
    required Widget inputField,
    required Widget skipWidget,
    required Widget newLine,
    required Widget operator,
    required Widget stable,
  }) {
    switch (this) {
      case 'space':
        return inputField;
      case '<skip>':
        return skipWidget;
      case '<full>':
        return newLine;
      default:
        if ("=-+!*%<>&|^~?×÷%−(),.،".contains(this)) {
          return operator;
        } else {
          return stable;
        }
    }
  }
}

extension QuestionArithmicitcTextExt on String {
  Widget getQuestionArithmicitcTextWidget({
    required Widget fraction,
    required Widget numberWithFraction,
    required Widget other,
    required Widget stable,
  }) {
    switch (this) {
      case 'fraction':
        return fraction;
      case 'numberWithFraction':
        return numberWithFraction;
      case 'other':
        return other;
      default:
        return stable;
    }
  }
}
