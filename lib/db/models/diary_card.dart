import 'package:fcode_bloc/fcode_bloc.dart';

class DiaryCard extends DBModel {
  static const TITLE_FILED = "title";
  static const SUBTITLE_FILED = "subtitle";
  static const DESCRIPTION_FILED = "description";
  static const CARDCOLOR_FILED = "cardColor";

  String title;
  String subtitle;
  String description;
  String cardColor;

  DiaryCard(this.title, this.subtitle, this.description, this.cardColor);
}
