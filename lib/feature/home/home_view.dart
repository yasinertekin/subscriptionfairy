import 'package:flutter/material.dart';
import 'package:subscriptionfairy/product/base/base_cubit.dart';
import 'package:subscriptionfairy/product/base/base_state.dart';
import 'package:subscriptionfairy/product/widget/custom_cached_network_image.dart';

/// This is the view for the home feature.
final class HomeView extends StatelessWidget {
  /// This is the constructor for the home view.
  const HomeView({
    required this.state,
    required this.appcubit,
    super.key,
  });

  /// This is the state for the home view.
  final AppLoadedState state;

  /// This is the cubit for the home view.
  final AppCubit appcubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.refresh,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      body: _HomeBlocBuilder(
        state,
      ),
    );
  }
}

final class _HomeBlocBuilder extends StatelessWidget {
  const _HomeBlocBuilder(
    this.state,
  );

  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
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
                    imageUrl:
                        state.users.subscriptionList?[index].subscriptionIcon ??
                            '',
                    height: 100,
                    width: 100,
                  ),
                  title: Text(
                    state.users.subscriptionList?[index].subscriptionPlan ?? '',
                  ),
                  subtitle: Text(
                    state.users.subscriptionList?[index].price?.toString() ??
                        '',
                  ),
                  trailing: Switch(
                    onChanged: (value) {},
                    value: state.users.subscriptionList?[index].isSubscribed ??
                        false,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
