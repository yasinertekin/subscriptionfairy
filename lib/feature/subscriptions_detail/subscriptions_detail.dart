import 'package:flutter/material.dart';
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
                          value: false,
                          onChanged: (value) {},
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
