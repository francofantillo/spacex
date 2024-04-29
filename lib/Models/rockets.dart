import 'package:json_annotation/json_annotation.dart';

part 'rockets.g.dart';

@JsonSerializable()
class Rocket {
  final String? id;
  final String? name;
  final String? type;
  final bool? active;
  final int? stages;
  final int? boosters;
  final int? costPerLaunch;
  final double? successRatePct;
  final String? firstFlight;
  final String? country;
  final String? company;
  final String? wikipedia;
  final String? description;
  final Height? height;
  final Diameter? diameter;
  final Mass? mass;
  final FirstStage? firstStage;
  final SecondStage? secondStage;
  final Engines? engines;
  final LandingLegs? landingLegs;
  final List<PayloadWeight>? payloadWeights;
  final List<String>? flickrImages;

  Rocket({
    this.id,
    this.name,
    this.type,
    this.active,
    this.stages,
    this.boosters,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.wikipedia,
    this.description,
    this.height,
    this.diameter,
    this.mass,
    this.firstStage,
    this.secondStage,
    this.engines,
    this.landingLegs,
    this.payloadWeights,
    this.flickrImages,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);
  Map<String, dynamic> toJson() => _$RocketToJson(this);
}

@JsonSerializable()
class Height {
  final double? meters;
  final double? feet;

  Height({
    this.meters,
    this.feet,
  });

  factory Height.fromJson(Map<String, dynamic> json) => _$HeightFromJson(json);
  Map<String, dynamic> toJson() => _$HeightToJson(this);
}

@JsonSerializable()
class Diameter {
  final double? meters;
  final double? feet;

  Diameter({
    this.meters,
    this.feet,
  });

  factory Diameter.fromJson(Map<String, dynamic> json) => _$DiameterFromJson(json);
  Map<String, dynamic> toJson() => _$DiameterToJson(this);
}

@JsonSerializable()
class Mass {
  final int? kg;
  final int? lb;

  Mass({
    this.kg,
    this.lb,
  });

  factory Mass.fromJson(Map<String, dynamic> json) => _$MassFromJson(json);
  Map<String, dynamic> toJson() => _$MassToJson(this);
}

@JsonSerializable()
class FirstStage {
  final Thrust? thrustSeaLevel;
  final Thrust? thrustVacuum;
  final bool? reusable;
  final int? engines;
  final double? fuelAmountTons;
  final int? burnTimeSec;

  FirstStage({
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  factory FirstStage.fromJson(Map<String, dynamic> json) => _$FirstStageFromJson(json);
  Map<String, dynamic> toJson() => _$FirstStageToJson(this);
}

@JsonSerializable()
class SecondStage {
  final Thrust? thrust;
  final Payloads? payloads;
  final bool? reusable;
  final int? engines;
  final double? fuelAmountTons;
  final int? burnTimeSec;

  SecondStage({
    this.thrust,
    this.payloads,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  factory SecondStage.fromJson(Map<String, dynamic> json) => _$SecondStageFromJson(json);
  Map<String, dynamic> toJson() => _$SecondStageToJson(this);
}

@JsonSerializable()
class Thrust {
  final int? kN;
  final int? lbf;

  Thrust({
    this.kN,
    this.lbf,
  });

  factory Thrust.fromJson(Map<String, dynamic> json) => _$ThrustFromJson(json);
  Map<String, dynamic> toJson() => _$ThrustToJson(this);
}

@JsonSerializable()
class Payloads {
  final CompositeFairing? compositeFairing;
  final String? option1;

  Payloads({
    this.compositeFairing,
    this.option1,
  });

  factory Payloads.fromJson(Map<String, dynamic> json) => _$PayloadsFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadsToJson(this);
}

@JsonSerializable()
class CompositeFairing {
  final Height? height;
  final Diameter? diameter;

  CompositeFairing({
    this.height,
    this.diameter,
  });

  factory CompositeFairing.fromJson(Map<String, dynamic> json) => _$CompositeFairingFromJson(json);
  Map<String, dynamic> toJson() => _$CompositeFairingToJson(this);
}

@JsonSerializable()
class Engines {
  final Isp? isp;
  final Thrust? thrustSeaLevel;
  final Thrust? thrustVacuum;
  final int? number;
  final String? type;
  final String? version;
  final String? layout;
  final int? engineLossMax;
  final String? propellant1;
  final String? propellant2;
  final double? thrustToWeight;

  Engines({
    this.isp,
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.number,
    this.type,
    this.version,
    this.layout,
    this.engineLossMax,
    this.propellant1,
    this.propellant2,
    this.thrustToWeight,
  });

  factory Engines.fromJson(Map<String, dynamic> json) => _$EnginesFromJson(json);
  Map<String, dynamic> toJson() => _$EnginesToJson(this);
}

@JsonSerializable()
class Isp {
  final int? seaLevel;
  final int? vacuum;

  Isp({
    this.seaLevel,
    this.vacuum,
  });

  factory Isp.fromJson(Map<String, dynamic> json) => _$IspFromJson(json);
  Map<String, dynamic> toJson() => _$IspToJson(this);
}

@JsonSerializable()
class LandingLegs {
  final int? number;
  final String? material;

  LandingLegs({
    this.number,
    this.material,
  });

  factory LandingLegs.fromJson(Map<String, dynamic> json) => _$LandingLegsFromJson(json);
  Map<String, dynamic> toJson() => _$LandingLegsToJson(this);
}

@JsonSerializable()
class PayloadWeight {
  final String? id;
  final String? name;
  final int? kg;
  final int? lb;

  PayloadWeight({
    this.id,
    this.name,
    this.kg,
    this.lb,
  });

  factory PayloadWeight.fromJson(Map<String, dynamic> json) => _$PayloadWeightFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadWeightToJson(this);
}
