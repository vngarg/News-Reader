class ArticleModel {
  String author, title, description, url, urlToImage, content;
  DateTime publishedAt;

  ArticleModel(
      {this.title,
      this.description,
      this.url,
      this.author,
      this.content,
      this.urlToImage,
      this.publishedAt});
}
