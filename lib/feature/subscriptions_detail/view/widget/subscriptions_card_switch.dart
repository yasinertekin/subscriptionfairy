part of '../subscriptions_detail_view.dart';

final class _SubscriptionsCardSwitch extends StatelessWidget {
  const _SubscriptionsCardSwitch({
    required this.state,
    required this.receivedSubscriptions,
    required this.index,
    required this.subscriptionsDetailViewModel,
    required this.appCubit,
  });

  final AppLoadedState state;
  final SubscriptionsList receivedSubscriptions;
  final int index;
  final SubscriptionsDetailViewModel subscriptionsDetailViewModel;
  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    final value = state.users.subscriptionList!
        .where(
          (element) =>
              element.subId == receivedSubscriptions.name![index].subId &&
              element.isSubscribed == true,
        )
        .isNotEmpty;
    return Switch(
      value: value,
      onChanged: (value) async {
        subscriptionsDetailViewModel.onEndDateSelected(
          receivedSubscriptions.name![index].subscriptionLength!,
        );
        if (value) {
          await NavigationService.instance.navigateToPage(
            path: Routes.datePicker,
            data: subscriptionsDetailViewModel,
          );
          await appCubit.updateSubscriptionList(
            receivedSubscriptions.name![index].copyWith(
              isSubscribed: true,
              startDate: subscriptionsDetailViewModel.selectedDate,
              endDate: subscriptionsDetailViewModel.selectedDate.add(
                Duration(
                  days: receivedSubscriptions.name![index].subscriptionLength!
                      .toInt(),
                ),
              ),
            ),
          );
        } else {
          await context.read<AppCubit>().deleteSubscriptionList(
                state.users.subscriptionList!.firstWhere(
                  (element) =>
                      element.subId == receivedSubscriptions.name![index].subId,
                ),
              );
        }
      },
    );
  }
}
