class Category {
  int id;
  int segmentId;
  int mainCategory;
  String subCategory;
  bool mandatoryToTrack;
  bool mandatoryToComment;
  bool tick;
  bool locationNeeded;
  bool active;
  bool archived;

  Category(
      {this.id,
      this.segmentId,
      this.mainCategory,
      this.subCategory,
      this.mandatoryToTrack,
      this.mandatoryToComment,
      this.tick,
      this.locationNeeded,
      this.active,
      this.archived});

  factory Category.fromJson(Map<String, dynamic> item) {
    return Category(
      id: item['ID'],
      segmentId: item['SegmentID'],
      mainCategory: item['MainCategory'],
      subCategory: item['SubCategory'],
      mandatoryToTrack: item['MandatoryToTrack'],
      mandatoryToComment: item['MandatoryToComment'],
      tick: item['Tickable'],
      locationNeeded: item['LocationNeeded'],
      active: item['Active'],
      archived: item['Archived'],
    );
  }
}
