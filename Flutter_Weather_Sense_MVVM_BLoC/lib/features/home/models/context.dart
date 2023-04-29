import 'package:equatable/equatable.dart';
import 'package:flutter_weather_sense_mvvm_bloc/features/home/models/forward_geocoding_model.dart';

/// The [Context] object will be a part of the [ForwardGeocodingModel].
/// This object is not appropriate to be created/used for the
/// stand-alone object.
class Context extends Equatable {
  final String id;
  final String? shortCode;
  final String wikidata;
  final String mapboxId;
  final String text;

  const Context({
    required this.id,
    this.shortCode,
    required this.wikidata,
    required this.mapboxId,
    required this.text,
  });

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        id: json['id'] as String,
        shortCode: json['short_code'] as String?,
        wikidata: json['wikidata'] as String,
        mapboxId: json['mapbox_id'] as String,
        text: json['text'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'short_code': shortCode,
        'wikidata': wikidata,
        'mapbox_id': mapboxId,
        'text': text,
      };

  @override
  List<Object?> get props => [id, shortCode, wikidata, mapboxId, text];

  @override
  bool? get stringify => true;
}
