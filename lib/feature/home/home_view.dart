import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/mixin/succesfull_lottie.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
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
              return _CustomCard(
                state: state,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}

final class _CustomCard extends StatelessWidget with SuccesFullLottie {
  const _CustomCard({
    required this.index,
    required this.state,
  });

  final AppLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomCachedNetworkImage(
              imageUrl:
                  state.users.subscriptionList?[index].subscriptionIcon ?? '',
              height: context.sized.dynamicHeight(0.1),
              width: context.sized.dynamicWidth(0.2),
            ),
          ),
          title: Text(
            state.users.subscriptionList?[index].subscriptionPlan ?? '',
          ),
          subtitle: Text(
            '${state.users.subscriptionList?[index].price} TL',
          ),
          trailing: Switch(
            onChanged: (value) async {
              succesFullLottie(context);
              await context.read<AppCubit>().deleteSubscriptionList(
                    state.users.subscriptionList![index],
                  );
            },
            value: state.users.subscriptionList?[index].isSubscribed ?? false,
          ),
        ),
      ),
    );
  }
}
