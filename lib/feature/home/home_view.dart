import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/home/view_model/home_cubit.dart';
import 'package:subscriptionfairy/feature/home/view_model/home_state.dart';
import 'package:subscriptionfairy/product/widget/custom_cached_network_image.dart';

/// This is the view for the home feature.
final class HomeView extends StatelessWidget {
  /// This is the constructor for the home view.
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UsersLoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.users.subscriptionList?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CustomCachedNetworkImage(
                            imageUrl: state.users.subscriptionList?[index]
                                    .subscriptionIcon ??
                                '',
                            height: 100,
                            width: 100,
                          ),
                          title: Text(
                            state.users.subscriptionList?[index]
                                    .subscriptionPlan ??
                                '',
                          ),
                          subtitle: Text(
                            state.users.subscriptionList?[index]
                                    .subscriptionPlanId
                                    ?.toString() ??
                                '',
                          ),
                          trailing: Switch(
                            onChanged: (value) {},
                            value: state.users.subscriptionList?[index]
                                    .subscriptionPlanId ??
                                false,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is UsersErrorState) {
            return Center(
              child: Text(
                state.error,
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Something went wrong!',
              ),
            );
          }
        },
      ),
    );
  }
}
