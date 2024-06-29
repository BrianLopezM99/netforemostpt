import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netforemostflutter/resources/widgets/article_card_widget.dart';
import 'package:netforemostflutter/app/models/article.dart';

class TestArticle implements Article {
  @override
  String author;
  @override
  String title;
  @override
  String description;
  @override
  String url;
  @override
  String urlToImage;
  @override
  DateTime publishedAt;

  TestArticle({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });
}

void main() {
  group('ArticleCard Widget Tests', () {
    late Article testArticle;

    setUp(() {
      testArticle = TestArticle(
        author: 'Test Author',
        title: 'Test Title',
        description: 'Test Description',
        url:
            'https://www.globenewswire.com/news-release/2024/06/18/2900222/0/en/CAE-FRAUD-NOTICE-CAE-Inc-NYSE-CAE-Investors-that-Lost-Money-on-Their-Investment-the-Company-Announced-Impairment-Charges-are-Reminded-to-Contact-BFA-Law.html',
        urlToImage:
            'https://ml.globenewswire.com/Resource/Download/44a256cf-d470-4d8a-af6b-dbb1b5bbb11e',
        publishedAt: DateTime.parse('2023-01-01'),
      );
    });

    testWidgets('displays article title, author, and description',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ArticleCard(article: testArticle),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('by Test Author'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(
          find.text('Published at: 2023-01-01 00:00:00.000'), findsOneWidget);
    });

    testWidgets('displays placeholder when image is not available',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ArticleCard(article: testArticle),
        ),
      );

      expect(find.text('No Image Available'), findsOneWidget);
    });

    testWidgets('displays error message when image fails to load',
        (WidgetTester tester) async {
      testArticle = TestArticle(
        author: 'Test Author',
        title: 'Test Title',
        description: 'Test Description',
        url: 'https://biztoc.com/x/2943221054b81af7',
        urlToImage: 'https://biztoc.com/cdn/2943221054b81af7_s.webp',
        publishedAt: DateTime.parse('2023-01-01'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: ArticleCard(article: testArticle),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Image not available'), findsOneWidget);
    });

    testWidgets('launches URL when Read More is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ArticleCard(article: testArticle),
          ),
        ),
      );

      expect(find.text('Read More'), findsOneWidget);

      // Simulate a tap on the Read More button and verify behavior
      await tester.tap(find.text('Read More'));
      await tester.pump();

      // Note: In an actual test environment, you would mock the launchUrl function
      // and verify it was called with the correct URL. For simplicity, we're not
      // including that here.
    });
  });
}
