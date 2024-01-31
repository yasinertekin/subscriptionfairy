import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/other/custom_cached_network_image.dart';

/// SubscriptionsListCard
final class SubscriptionsListCard extends StatelessWidget {
  /// Default constructor
  const SubscriptionsListCard({
    required this.subscription,
    required this.index,
    super.key,
  });

  /// subscription
  final SubscriptionsList subscription;

  /// state

  /// index
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const ProjectPadding.allSmall(),
          child: ListTile(
            trailing: const Icon(
              CupertinoIcons.chevron_right,
            ),
            onTap: () {
              NavigationService.instance.navigateToPage(
                path: Routes.subscriptionsDetail,
                data: subscription,
              );
            },
            leading: ClipRRect(
              borderRadius: context.border.normalBorderRadius,
              child: CustomCachedNetworkImage(
                height: context.sized.dynamicHeight(0.1),
                width: context.sized.dynamicWidth(0.13),
                fit: BoxFit.fill,
                imageUrl: subscription.subscriptionIcon ?? '',
              ),
            ),
            title: Text(
              subscription.subscriptionName ?? '',
            ),
          ),
        ),
      ),
    );
  }
}
