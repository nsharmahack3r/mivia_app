import 'package:flutter/material.dart';
import 'package:mivia/src/resources/assets.gen.dart';

class GarageSection extends StatelessWidget {
  const GarageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Garage',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('Manage')),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _VehicleCard(
                name: 'Volkswagen Golf GTI',
                type: 'Hatchback',
                year: '2024',
                mileage: '12,480 mi',
                status: _VehicleStatus.active,
                animation: Assets.animations.car,
                isDark: isDark,
              ),
              const SizedBox(height: 12),
              _VehicleCard(
                name: 'Triumph Street Triple',
                type: 'Naked Sport',
                year: '2023',
                mileage: '6,210 mi',
                status: _VehicleStatus.servicePending,
                animation: Assets.animations.bike,
                isDark: isDark,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum _VehicleStatus {
  active,
  servicePending,
}

class _VehicleCard extends StatelessWidget {
  const _VehicleCard({
    required this.name,
    required this.type,
    required this.year,
    required this.mileage,
    required this.status,
    required this.animation,
    required this.isDark,
  });

  final String name;
  final String type;
  final String year;
  final String mileage;
  final _VehicleStatus status;
  final LottieGenImage animation;
  final bool isDark;

  Color get _accentColor => const Color(0xFF2979FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _accentColor.withValues(alpha: isDark ? 0.12 : 0.06),
        border: Border.all(
          color: _accentColor.withValues(alpha: isDark ? 0.25 : 0.15),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Lottie animation on the left
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: _accentColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: animation.lottie(
                      fit: BoxFit.cover,
                      repeat: true,
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Info on the right
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name + status row
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _StatusBadge(status: status, isDark: isDark),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$type • $year',
                        style: TextStyle(
                          fontSize: 13,
                          color: isDark ? Colors.white54 : Colors.black45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.speed_rounded,
                            size: 14,
                            color: _accentColor.withValues(alpha: 0.80),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            mileage,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isDark ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status, required this.isDark});

  final _VehicleStatus status;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final isActive = status == _VehicleStatus.active;
    final label = isActive ? 'Active' : 'Service Due';
    final color = isActive ? const Color(0xFF00C853) : const Color(0xFFFF6D00);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.18 : 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: isDark ? 0.35 : 0.25),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
