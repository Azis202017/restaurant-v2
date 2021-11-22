import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:resto/apps/model/restaurant.dart';
import 'package:resto/apps/providers/detail_provider.dart';
import 'package:resto/apps/services/api_service.dart';
import 'package:resto/theme/color/color.dart';
import 'package:resto/theme/fonts/fonts.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail-page';
  final RestaurantsDetails restaurant;
  const DetailPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailRestaurantProvider(
        apiService: ApiService(),
        id: '${restaurant.id}',
      ),
      child: Material(
        child: Consumer<DetailRestaurantProvider>(builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Detail Restaurant'),
                backgroundColor: ColorApp.primaryColor,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          top: 8,
                        ),
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                        ),
                        decoration: BoxDecoration(
                          color: ColorApp.whiteColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                top: 24,
                              ),
                              height: 182,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://restaurant-api.dicoding.dev/images/small/${state.resultRestaurant.pictureId}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '${state.resultRestaurant.name}',
                              style: FontApp.titleText,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${state.resultRestaurant.description}',
                              style:
                                  FontApp.descriptionText.copyWith(height: 1.8),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 50,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final category = state
                                        .resultRestaurant.categories![index];
                                    return Chip(
                                      label: Text('${category.name}'),
                                    );
                                  },
                                  separatorBuilder: (_, __) {
                                    return const SizedBox(width: 32);
                                  },
                                  itemCount: state
                                      .resultRestaurant.categories!.length),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Alamat',
                                      style: FontApp.descriptionText,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_sharp,
                                          color: ColorApp.primaryColor,
                                        ),
                                        Text(
                                          '${state.resultRestaurant.address}',
                                          style:
                                              FontApp.descriptionText.copyWith(
                                            color: ColorApp.blackColor2,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ratings',
                                      style: FontApp.descriptionText,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: ColorApp.primaryColor,
                                        ),
                                        Text(
                                          '${state.resultRestaurant.rating}',
                                          style:
                                              FontApp.descriptionText.copyWith(
                                            color: ColorApp.greyColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorApp.whiteColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(13),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 24,
                        ),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Menu Restoran',
                                      style: FontApp.subtitleText3,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Menu dari restoran',
                                      style: FontApp.descriptionText,
                                    ),
                                    const SizedBox(
                                      height: 21,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: state.resultRestaurant.menus!.foods!
                                  .map((food) {
                                return Text(
                                  '${food.name}',
                                  style: FontApp.descriptionText
                                      .copyWith(height: 1.8),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: state.resultRestaurant.menus!.drinks!
                                  .map((drinks) {
                                return Text(
                                  '${drinks.name}',
                                  style: FontApp.descriptionText
                                      .copyWith(height: 1.8),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorApp.whiteColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(13),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 24,
                        ),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Review',
                                      style: FontApp.subtitleText3,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Review pelanggan',
                                      style: FontApp.descriptionText,
                                    ),
                                    const SizedBox(
                                      height: 21,
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        '/addreview',
                                        arguments: state.resultRestaurant);
                                  },
                                  child: const Text('Tambah Review +'),
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 400,
                              child: ListView.builder(
                                  itemCount: state
                                      .resultRestaurant.customerReviews!.length,
                                  itemBuilder: (context, index) {
                                    final customerReview = state
                                        .resultRestaurant
                                        .customerReviews![index];
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text('${customerReview.name}'),
                                      subtitle:
                                          Text('${customerReview.review}'),
                                      trailing: Text('${customerReview.date}'),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state.state == ResultState.error) {
            return SizedBox(
              height: 417,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/json/empty-state-wifi.json',
                    width: double.infinity,
                    height: 400,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.message,
                    style: FontApp.descriptionText,
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: ColorApp.primaryColor),
                    child: const Text('Kembali '),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(''),
            );
          }
        }),
      ),
    );
  }
}
