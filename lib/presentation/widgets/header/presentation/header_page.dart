import 'package:ecommerce_app/presentation/widgets/favorites/addtofavorite.dart';
import 'package:ecommerce_app/presentation/widgets/header/cubit/header_cuit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function() onCartPressed;

  HeaderWidget({required this.onCartPressed});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HeaderCubit(),
      child: BlocBuilder<HeaderCubit, HeaderState>(
        builder: (context, state) {
          // Default profile image (can be updated based on user state)
          String gender = 'Select Gender';

          if (state is HeaderProfileUpdated) {}

          if (state is HeaderGenderUpdated) {
            gender = state.gender;
          }

          return AppBar(
            backgroundColor:
                const Color.fromARGB(255, 116, 105, 136).withOpacity(0.5),
            shape: Border.all(color: Colors.white),
            shadowColor: Colors.white,
            leading: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/pp2.webp'),
              ),
            ),
            title: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.2), // Apply 60% opacity to black color
                  borderRadius: BorderRadius.circular(30), // Circular border
                  border: Border.all(
                      color: Colors.white, width: 2), // Border color and width
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4), // Padding for better appearance
                child: DropdownButton<String>(
                  value: gender,
                  onChanged: (String? newGender) {
                    if (newGender != null) {
                      context.read<HeaderCubit>().updateGender(newGender);
                    }
                  },
                  items: ['Select Gender', 'Male', 'Female', 'Other']
                      .map((genderOption) {
                    return DropdownMenuItem<String>(
                      value: genderOption,
                      child: Text(
                        genderOption,
                        style: TextStyle(
                          color: genderOption == 'Select Gender'
                              ? Colors.white
                              : Colors.white, // White for default text
                        ),
                      ),
                    );
                  }).toList(),
                  style: const TextStyle(
                      color: Colors.white), // White text for the selected item
                  dropdownColor: Colors.black.withOpacity(
                      0.8), // Dark transparent background for the dropdown items
                  underline: const SizedBox(), // Remove the default underline
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritesPage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: onCartPressed,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  // AppBar's default height is 56.0
  Size get preferredSize => const Size.fromHeight(56.0);
}
