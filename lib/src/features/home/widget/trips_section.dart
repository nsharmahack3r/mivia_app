import 'package:flutter/material.dart';

class TripsSection extends StatelessWidget {
  const TripsSection({super.key});

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
                'Your Trips',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('See All')),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Horizontal trip cards
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.none,
            children: [
              _TripCard(
                title: 'Alpine Crossing',
                subtitle: 'Paris → Zurich → Milan',
                distance: '1,240 km',
                duration: '14h 20m',
                date: 'Mar 28, 2026',
                gradient: const [Color(0xFF2979FF), Color(0xFF2979FF)],
                icon: Icons.terrain_rounded,
                isDark: isDark,
              ),
              const SizedBox(width: 16),
              _TripCard(
                title: 'Mediterranean Coastline',
                subtitle: 'Barcelona → Nice → Rome',
                distance: '1,580 km',
                duration: '18h 45m',
                date: 'Mar 15, 2026',
                gradient: const [Color(0xFF2979FF), Color(0xFF2979FF)],
                icon: Icons.beach_access_rounded,
                isDark: isDark,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TripCard extends StatelessWidget {
  const _TripCard({
    required this.title,
    required this.subtitle,
    required this.distance,
    required this.duration,
    required this.date,
    required this.gradient,
    required this.icon,
    required this.isDark,
  });

  final String title;
  final String subtitle;
  final String distance;
  final String duration;
  final String date;
  final List<Color> gradient;
  final IconData icon;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            gradient[0].withValues(alpha: isDark ? 0.25 : 0.15),
            gradient[1].withValues(alpha: isDark ? 0.10 : 0.06),
          ],
        ),
        border: Border.all(
          color: gradient[0].withValues(alpha: isDark ? 0.30 : 0.20),
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: icon + date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: gradient[0].withValues(alpha: 0.20),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: gradient[0], size: 22),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: (isDark ? Colors.white : Colors.black)
                            .withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        date,
                        style: TextStyle(
                          fontSize: 11,
                          color: isDark ? Colors.white60 : Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                // Title & subtitle
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.white54 : Colors.black45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),

                // Stats row
                Row(
                  children: [
                    _StatChip(
                      icon: Icons.straighten_rounded,
                      value: distance,
                      color: gradient[0],
                      isDark: isDark,
                    ),
                    const SizedBox(width: 12),
                    _StatChip(
                      icon: Icons.schedule_rounded,
                      value: duration,
                      color: gradient[0],
                      isDark: isDark,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.value,
    required this.color,
    required this.isDark,
  });

  final IconData icon;
  final String value;
  final Color color;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color.withValues(alpha: 0.80)),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white70 : Colors.black54,
          ),
        ),
      ],
    );
  }
}
