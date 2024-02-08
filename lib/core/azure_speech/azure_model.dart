class AzureModel {
  String? recognitionStatus; //status code
  List<NBest>? nBest; //list of best values (your sentence, and each word)
  String? displayText; //input text

  AzureModel({this.recognitionStatus, this.nBest, this.displayText});

  AzureModel.fromJson(Map<String, dynamic> json) {
    recognitionStatus = json['RecognitionStatus'];
    if (json['NBest'] != null) {
      nBest = <NBest>[];
      json['NBest'].forEach((v) {
        nBest!.add(NBest.fromJson(v));
      });
    }
    displayText = json['DisplayText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RecognitionStatus'] = recognitionStatus;
    if (nBest != null) {
      data['NBest'] = nBest!.map((v) => v.toJson()).toList();
    }
    data['DisplayText'] = displayText;
    return data;
  }
}

/// Score of the whole sentence
class NBest {
  double? confidence;
  double? accuracyScore;
  double? fluencyScore;
  double? completenessScore;
  double? pronScore;
  List<Words>? words;

  NBest(
      {this.confidence,
        this.accuracyScore,
        this.fluencyScore,
        this.completenessScore,
        this.pronScore,
        this.words});

  NBest.fromJson(Map<String, dynamic> json) {
    confidence = json['Confidence'];
    accuracyScore = json['AccuracyScore'];
    fluencyScore = json['FluencyScore'];
    completenessScore = json['CompletenessScore'];
    pronScore = json['PronScore'];
    if (json['Words'] != null) {
      words = <Words>[];
      json['Words'].forEach((v) {
        words!.add(Words.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Confidence'] = confidence;
    data['AccuracyScore'] = accuracyScore;
    data['FluencyScore'] = fluencyScore;
    data['CompletenessScore'] = completenessScore;
    data['PronScore'] = pronScore;
    if (words != null) {
      data['Words'] = words!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// Each Word
class Words {
  String? word;
  double? accuracyScore;
  String? errorType;

  Words({this.word, this.accuracyScore, this.errorType});

  Words.fromJson(Map<String, dynamic> json) {
    word = json['Word'];
    accuracyScore = json['AccuracyScore'];
    errorType = json['ErrorType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Word'] = word;
    data['AccuracyScore'] = accuracyScore;
    data['ErrorType'] = errorType;
    return data;
  }
}