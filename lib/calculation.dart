class CGPA_Calculation {
  static final List<double> cHours = [0.0];
  static final List<double> gpas = [0.0];
  static double cHr = 0;
  static double gpa = 0;
  static double result() {
    double _hourTotal = 0;
    double _qualitypointTotal = 0;
    double _result = 0;
    List<double> qualitypoints = [0];

    for (var i = 0; i < cHours.length; i++) {
      _hourTotal = _hourTotal + cHours[i];

      qualitypoints.add(cHours[i] * gpas[i]);
    }
    for (var i = 0; i < qualitypoints.length; i++) {
      _qualitypointTotal = _qualitypointTotal + qualitypoints[i];
    }

    _result = _qualitypointTotal / _hourTotal;

    return _result;
  }
}

class GPA_Calculation {
  static final List<double> hours = [0.0];
  static final List<double> grades = [0.0];
  static double cHr = 0;
  static double gp = 0;
  static double result() {
    double _hourTotal = 0;
    double _qualitypointTotal = 0;
    double _result = 0;
    List<double> qualitypoints = [0];

    for (var i = 0; i < hours.length; i++) {
      _hourTotal = _hourTotal + hours[i];

      qualitypoints.add(hours[i] * grades[i]);
    }
    for (var i = 0; i < qualitypoints.length; i++) {
      _qualitypointTotal = _qualitypointTotal + qualitypoints[i];
    }

    _result = _qualitypointTotal / _hourTotal;

    return _result;
  }
}
