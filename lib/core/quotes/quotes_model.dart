
class QuoteModel {
  List<Quotes>? quotes;

  QuoteModel({this.quotes});

  QuoteModel.fromJson(List data){
    quotes = data.map((i) => Quotes.fromJson(i)).toList();
  }

}

class Quotes {
  String? sId;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  Quotes(
      {this.sId,
        this.content,
        this.author,
        this.tags,
        this.authorSlug,
        this.length,
        this.dateAdded,
        this.dateModified});

  Quotes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    author = json['author'];
    tags = json['tags'].cast<String>();
    authorSlug = json['authorSlug'];
    length = json['length'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['content'] = this.content;
    data['author'] = this.author;
    data['tags'] = this.tags;
    data['authorSlug'] = this.authorSlug;
    data['length'] = this.length;
    data['dateAdded'] = this.dateAdded;
    data['dateModified'] = this.dateModified;
    return data;
  }
}