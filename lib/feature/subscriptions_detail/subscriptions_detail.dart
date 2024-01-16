import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/product/base/base_cubit.dart';
import 'package:subscriptionfairy/product/base/base_state.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/widget/custom_cached_network_image.dart';

/// SubscriptionDetails
final class SubscriptionDetails extends StatelessWidget {
  /// Default constructor
  const SubscriptionDetails({
    super.key,
  });

  /// subscriptions

  @override
  Widget build(BuildContext context) {
    // arguments'ten geçilen verileri al
    final receivedSubscriptions =
        ModalRoute.of(context)!.settings.arguments! as SubscriptionsList;
    final state = context.watch<AppCubit>().state as AppLoadedState;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Details'),
      ),
      body: Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: receivedSubscriptions.name?.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CustomCachedNetworkImage(
                      height: 100,
                      width: 100,
                      imageUrl:
                          receivedSubscriptions.subscriptionIcon.toString(),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              receivedSubscriptions
                                      .name?[index].subscriptionPlan
                                      .toString() ??
                                  '',
                            ),
                            const Text('15TL'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Switch(
                          value: state.users.subscriptionList!
                              .where(
                                (element) =>
                                    element.subId ==
                                    receivedSubscriptions.name?[index].subId,
                              )
                              .isNotEmpty,
                          onChanged: (value) {
                            if (value) {
                              context.read<AppCubit>().updateSubscriptionList(
                                    receivedSubscriptions.name![index].copyWith(
                                      isSubscribed: true,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
