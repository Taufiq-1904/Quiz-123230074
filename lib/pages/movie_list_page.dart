import 'package:flutter/material.dart';
import '../data/movie_data.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  final String username;

  const MovieListPage({super.key, required this.username});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<bool> added = List.generate(movieList.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie List"), centerTitle: true),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome, ${widget.username}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: movieList.length,

              itemBuilder: (context, index) {
                final movie = movieList[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),

                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailPage(movie: movie),
                        ),
                      );
                    },

                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(12),

                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                movie.image,
                                width: 90,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${movie.title} (${movie.year})",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    movie.genre,
                                    style: const TextStyle(color: Colors.grey),
                                  ),

                                  const SizedBox(height: 8),

                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 18,
                                      ),

                                      const SizedBox(width: 5),

                                      Text("${movie.rating}/10"),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  Align(
                                    alignment: Alignment.centerLeft,

                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: added[index]
                                            ? Colors.blue
                                            : Colors.white,

                                        side: BorderSide(
                                          color: added[index]
                                              ? Colors.blue
                                              : Colors.grey,
                                        ),

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),

                                      onPressed: () {
                                        setState(() {
                                          added[index] = !added[index];
                                        });
                                      },

                                      child: Text(
                                        added[index] ? "Added" : "Add to List",

                                        style: TextStyle(
                                          color: added[index]
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
