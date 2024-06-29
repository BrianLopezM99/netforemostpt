import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netforemostflutter/app/models/article.dart';
import '../../app/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.urlToImage.isNotEmpty)
            Image.network(
              article.urlToImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('Image not available'),
                  ),
                );
              },
            )
          else
            const SizedBox(
              height: 200,
              child: Center(
                child: Text('No Image Available'),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  'by ${article.author}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 5),
                Text(
                  article.description,
                  style: TextStyle(color: Colors.grey[800]),
                ),
                const SizedBox(height: 10),
                Text(
                  'Published at: ${article.publishedAt.toLocal()}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    final url = Uri.parse(article.url);
                    if (kDebugMode) {
                      print('Trying to launch URL: $url');
                    }
                    try {
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        if (kDebugMode) {
                          print('Could not launch URL: $url');
                        }
                        throw 'Could not launch $url';
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print('Error launching URL: $e');
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Could not launch URL')),
                      );
                    }
                  },
                  child: const Text('Read More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
