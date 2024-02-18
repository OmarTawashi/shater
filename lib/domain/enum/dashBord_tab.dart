

enum dashBordTabEnum { teachers, exercise, result,first,profile }

extension  DashBordTabExt on int {
  dashBordTabEnum todashBordTabEnum() {
    switch (this) {
      case 0:
        return dashBordTabEnum.teachers;
      case 1:
        return dashBordTabEnum.exercise;
      case 2:
        return dashBordTabEnum.result;
      case 3:
        return dashBordTabEnum.first;
      case 4:
        return dashBordTabEnum.profile;
      default:
        return dashBordTabEnum.teachers;
 
    }
  }
}
 
