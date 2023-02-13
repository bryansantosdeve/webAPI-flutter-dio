import 'package:flutter/material.dart';
import 'package:studio_ghibli_studio/presentation/my_home_page.dart';

import '../presentation/search_movie_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(100.0, 30.0),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_sharp,
        ),
        // TODO: Implement back button if necessary
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ),
          );
        },
      ),
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search_sharp,
          ),
          // TODO: Implement search functionality based on title
          onPressed: () async {
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SearchMoviePage()),
            );
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.settings_input_component_rounded,
          ),
          // TODO: Implement changing theme options
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65.0);
}
