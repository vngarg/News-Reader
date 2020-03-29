/*
final class Source
{
    final String id { get; set; }
    final String name { get; set; }
    final String description { get; set; }
    final String url { get; set; }
    final String category { get; set; }
    final String language { get; set; }
    final String country { get; set; }
}

final class RootObject
{
    final String status { get; set; }
    final List<Source> sources { get; set; }
}
*/

class Source{
  final String id ;
    final String name ;
    final String description ;
    final String url ;
    final String category ;
    final String language ;
    final String country ;

    Source ({ this.id , this.category , this.country , this.description , this.language , this.name , this.url} );

    factory Source.fromJson(Map<String , dynamic> json) {
      return Source(
        id: json['id'],
        category: json['category'],
        country: json['country'],
        description: json['description'],
        language: json['language'],
        name: json['name'],
        url: json['url']
      );
    }
}

class NewsAPI{
  final String status;
  final List<Source> sources;

  NewsAPI({ this.sources , this.status });

  factory NewsAPI.fromJson(Map<String , dynamic> json) {
    return NewsAPI(status: json['status'],
    sources: (json['sources'] as List )
    .map((source) => Source.fromJson(source)).toList()
    );
  }
}