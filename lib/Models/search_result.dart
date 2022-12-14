import 'dart:convert';

SearchResult searchResultFromJson(String str) =>
    SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
  SearchResult({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        status: json["status"] ?? "",
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.categories,
    required this.products,
  });

  List<dynamic> categories;
  Products products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "products": products.toJson(),
      };
}

class Products {
  Products({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  num count;
  String next;
  String previous;
  List<Result> results;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        count: json["count"]??0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.brand,
    required this.image,
    required this.charge,
    required this.images,
    required this.slug,
    required this.productName,
    required this.model,
    required this.commissionType,
    required this.amount,
    required this.tag,
    required this.description,
    required this.note,
    required this.embaddedVideoLink,
    required this.maximumOrder,
    required this.stock,
    required this.isBackOrder,
    required this.specification,
    required this.warranty,
    required this.preOrder,
    required this.productReview,
    required this.isSeller,
    required this.isPhone,
    required this.willShowEmi,
    required this.badge,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.language,
    required this.seller,
    required this.combo,
    required this.createdBy,
    required this.updatedBy,
    required this.category,
    required this.relatedProduct,
    required this.filterValue,
  });

  num id;
  Brand brand;
  String image;
  Charge charge;
  List<Image> images;
  String slug;
  String productName;
  String model;
  String commissionType;
  String amount;
  String tag;
  String description;
  String note;
  String embaddedVideoLink;
  num maximumOrder;
  num stock;
  bool isBackOrder;
  String specification;
  String warranty;
  bool preOrder;
  num productReview;
  bool isSeller;
  bool isPhone;
  bool willShowEmi;
  dynamic badge;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic language;
  String seller;
  dynamic combo;
  String createdBy;
  dynamic updatedBy;
  List<num> category;
  List<dynamic> relatedProduct;
  List<dynamic> filterValue;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? 0,
        brand: Brand.fromJson(json["brand"]),
        image: json["image"] ?? "",
        charge: Charge.fromJson(json["charge"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        slug: json["slug"] ?? "",
        productName: json["product_name"] ?? "",
        model: json["model"] ?? "",
        commissionType: json["commission_type"] ?? "",
        amount: json["amount"] ?? "",
        tag: json["tag"] ?? "",
        description: json["description"] ?? "",
        note: json["note"] ?? "",
        embaddedVideoLink: json["embadded_video_link"] ?? "",
        maximumOrder: json["maximum_order"] ?? 0,
        stock: json["stock"] ?? 0,
        isBackOrder: json["is_back_order"] ?? false,
        specification: json["specification"] ?? "",
        warranty: json["warranty"] ?? "",
        preOrder: json["pre_order"] ?? false,
        productReview: json["product_review"] ?? 0,
        isSeller: json["is_seller"] ?? 0,
        isPhone: json["is_phone"] ?? 0,
        willShowEmi: json["will_show_emi"] ?? 0,
        badge: json["badge"] ?? "",
        isActive: json["is_active"],
        createdAt: json["created_at"] != null? DateTime.parse(json["created_at"]) : DateTime.now(),
        updatedAt: json["updated_at"] != null? DateTime.parse(json["updated_at"]): DateTime.now(),
        language: json["language"] ?? "",
        seller: json["seller"] ?? "",
        combo: json["combo"] ?? "",
        createdBy: json["created_by"] ?? "",
        updatedBy: json["updated_by"] ?? "",
        category: List<num>.from(json["category"].map((x) => x)),
        relatedProduct:
            List<dynamic>.from(json["related_product"].map((x) => x)),
        filterValue: List<dynamic>.from(json["filter_value"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand.toJson(),
        "image": image,
        "charge": charge.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "slug": slug,
        "product_name": productName,
        "model": model,
        "commission_type": commissionType,
        "amount": amount,
        "tag": tag,
        "description": description,
        "note": note,
        "embadded_video_link": embaddedVideoLink,
        "maximum_order": maximumOrder,
        "stock": stock,
        "is_back_order": isBackOrder,
        "specification": specification,
        "warranty": warranty,
        "pre_order": preOrder,
        "product_review": productReview,
        "is_seller": isSeller,
        "is_phone": isPhone,
        "will_show_emi": willShowEmi,
        "badge": badge,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "language": language,
        "seller": seller,
        "combo": combo,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "category": List<dynamic>.from(category.map((x) => x)),
        "related_product": List<dynamic>.from(relatedProduct.map((x) => x)),
        "filter_value": List<dynamic>.from(filterValue.map((x) => x)),
      };
}

class Brand {
  Brand({
    required this.name,
    required this.image,
    required this.headerImage,
    required this.slug,
  });

  String name;
  String image;
  dynamic headerImage;
  String slug;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        headerImage: json["header_image"] ?? "",
        slug: json["slug"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "header_image": headerImage,
        "slug": slug,
      };
}

class Charge {
  Charge({
    required this.bookingPrice,
    required this.currentCharge,
    required this.discountCharge,
    required this.sellingPrice,
    required this.profit,
    required this.isEvent,
    required this.eventId,
    required this.highlight,
    required this.highlightId,
    required this.groupping,
    required this.grouppingId,
    required this.campaignSectionId,
    required this.campaignSection,
    required this.message,
  });

  num bookingPrice;
  num currentCharge;
  dynamic discountCharge;
  num sellingPrice;
  num profit;
  bool isEvent;
  dynamic eventId;
  bool highlight;
  dynamic highlightId;
  bool groupping;
  dynamic grouppingId;
  dynamic campaignSectionId;
  bool campaignSection;
  dynamic message;

  factory Charge.fromJson(Map<String, dynamic> json) => Charge(
        bookingPrice: json["booking_price"]?? 0,
        currentCharge: json["current_charge"]?? 0,
        discountCharge: json["discount_charge"] ?? 0,
        sellingPrice: json["selling_price"]?? 0,
        profit: json["profit"]?? 0,
        isEvent: json["is_event"]?? 0,
        eventId: json["event_id"] ?? 0,
        highlight: json["highlight"]?? 0,
        highlightId: json["highlight_id"] ?? "",
        groupping: json["groupping"]?? 0,
        grouppingId: json["groupping_id"] ?? "",
        campaignSectionId: json["campaign_section_id"] ?? "",
        campaignSection: json["campaign_section"]?? 0,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "booking_price": bookingPrice,
        "current_charge": currentCharge,
        "discount_charge": discountCharge,
        "selling_price": sellingPrice,
        "profit": profit,
        "is_event": isEvent,
        "event_id": eventId,
        "highlight": highlight,
        "highlight_id": highlightId,
        "groupping": groupping,
        "groupping_id": grouppingId,
        "campaign_section_id": campaignSectionId,
        "campaign_section": campaignSection,
        "message": message,
      };
}

class Image {
  Image({
    required this.id,
    required this.image,
    required this.isPrimary,
    required this.product,
  });

  num id;
  String image;
  bool isPrimary;
  num product;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"]?? 0,
        image: json["image"]?? "",
        isPrimary: json["is_primary"]?? 0,
        product: json["product"]?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "is_primary": isPrimary,
        "product": product,
      };
}
