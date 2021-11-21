import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto/apps/model/restaurant.dart';
import 'package:resto/apps/pages/detail_page.dart';
import 'package:resto/apps/pages/search_page.dart';
import 'package:resto/apps/providers/restaurant_provider.dart';
import 'package:resto/apps/services/api_service.dart';
import 'package:resto/theme/color/color.dart';
import 'package:resto/theme/fonts/fonts.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  final TextEditingController searchController = TextEditingController();

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _buildList() {
      return Consumer<RestaurantProvider>(builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return ListView.separated(
            itemBuilder: (context, index) {
              var dataResto = state.result.restaurants![index];
              return ListRestaurant(dataResto: dataResto);
            },
            separatorBuilder: (_, __) {
              return const SizedBox(height: 16);
            },
            itemCount: state.result.restaurants!.length,
          );
        } else if (state.state == ResultState.noData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.error) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Abdul Azis Al Ayubbi', style: FontApp.descriptionText),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: ColorApp.primaryColor,
              child: Text(
                'AB',
                style: FontApp.buttonText,
              ),
            ),
          ),
        ],
        backgroundColor: ColorApp.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: ChangeNotifierProvider(
            create: (context) => RestaurantProvider(
              apiService: ApiService(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 36,
                    right: 16,
                  ),
                  width: double.infinity,
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      Navigator.of(context).pushNamed(SearchPage.routeName,arguments: value);
                    },
                    controller: searchController,
                    cursorColor: ColorApp.primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 0.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.lightGreen.shade200,
                        ),
                      ),
                      hintText: 'Search ',
                      hintStyle: FontApp.descriptionText,
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorApp.primaryColor,
                      ),
                      filled: true,
                      fillColor: ColorApp.greyColor2,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Explore Restaurant',
                  style: FontApp.subtitleText3,
                ),
                const SizedBox(height: 4),
                Text(
                  'Restaurant yang ada',
                  style: FontApp.descriptionText,
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: _buildList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListRestaurant extends StatelessWidget {
  const ListRestaurant({
    Key? key,
    required this.dataResto,
  }) : super(key: key);

  final RestaurantsDetails dataResto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: ColorApp.whiteColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailPage.routeName,
            arguments: dataResto,
          );
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://restaurant-api.dicoding.dev/images/small/${dataResto.pictureId}',
          ),
        ),
        title: Text('${dataResto.name}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              '${dataResto.description}',
              style: FontApp.descriptionText.copyWith(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  color: ColorApp.primaryColor,
                ),
                Text(
                  '${dataResto.city}',
                  style: FontApp.descriptionText.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.star_rate,
                  color: ColorApp.primaryColor,
                ),
                Text(
                  '${dataResto.rating}',
                  style: FontApp.descriptionText.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
