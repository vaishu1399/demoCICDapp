import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:democicdapp/config/routes/app_router.dart';
import 'package:democicdapp/config/providers.dart';
import 'package:democicdapp/core/usecases/usecase.dart';
import 'package:democicdapp/features/home/domain/entities/feature.dart';
import 'package:democicdapp/features/home/presentation/widgets/coming_soon_card.dart';
import 'package:democicdapp/features/home/presentation/widgets/loading_indicator.dart';
import 'package:democicdapp/features/home/presentation/widgets/error_view.dart';

/// Home page displaying upcoming features with "Coming Soon" content.
@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the upcoming features from the provider
    final featuresAsync = ref.watch(upcomingFeaturesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.router.push(const SettingsRoute());
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(upcomingFeaturesProvider);
        },
        child: featuresAsync.when(
          data: (features) => ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: features.length,
            itemBuilder: (context, index) {
              final feature = features[index] as Feature;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ComingSoonCard(
                  title: feature.title,
                  description: feature.description,
                  iconName: feature.iconName,
                  onTap: () {
                    context.router.push(
                      FeatureDetailRoute(
                        id: feature.id,
                        title: feature.title,
                        description: feature.description,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          loading: () => const LoadingIndicator(),
          error: (error, stack) => ErrorView(
            message: error.toString(),
            onRetry: () {
              ref.invalidate(upcomingFeaturesProvider);
            },
          ),
        ),
      ),
    );
  }
}

/// Provider for upcoming features using FutureProvider.
final upcomingFeaturesProvider = FutureProvider.autoDispose<List<Feature>>((
  ref,
) async {
  final useCase = ref.watch(getUpcomingFeaturesUseCaseProvider);
  return await useCase(const NoParams());
});
