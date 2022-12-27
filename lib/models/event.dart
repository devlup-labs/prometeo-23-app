class EventDetail {
  final String eventId;
  final String name;
  final String image;
  final String description;
  final String prizeMoney;
  final String date;
  final String eventType;
  final String rulebookLink;
  final bool isSpeaker;
  final String unstopLink;
  final String eventLocation;
  final List<String> sponsorLinks;

  EventDetail({
    required this.eventId,
    required this.name,
    required this.image,
    required this.description,
    required this.prizeMoney,
    required this.date,
    required this.isSpeaker,
    required this.unstopLink,
    required this.eventLocation,
    required this.eventType,
    required this.rulebookLink,
    required this.sponsorLinks,
  });
}
