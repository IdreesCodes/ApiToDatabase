class PostsModel {
  List<Data>? data;
  int? total;
  bool? success;

  PostsModel({this.data, this.total, this.success});

  PostsModel.fromJson(Map<dynamic, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? descriptionLong;
  String? description;
  String? number;
  String? inStock;
  String? supplierName;
  String? mainDetailid;
  String? tax;
  String? lastStock;
  String? changetime;
  String? supplierdescription;
  String? supplierimg;
  String? supplierlink;
  String? supplierID;
  String? added;
  String? active;
  String? changeTimeBc;
  MainDetail? mainDetail;
  BcAdditionalInfo? bcAdditionalInfo;

  Data(
      {this.id,
        this.name,
        this.descriptionLong,
        this.description,
        this.number,
        this.inStock,
        this.supplierName,
        this.mainDetailid,
        this.tax,
        this.lastStock,
        this.changetime,
        this.supplierdescription,
        this.supplierimg,
        this.supplierlink,
        this.supplierID,
        this.added,
        this.active,
        this.changeTimeBc,
        this.mainDetail,
        this.bcAdditionalInfo});

  Data.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    descriptionLong = json['descriptionLong'];
    description = json['description'];
    number = json['number'];
    inStock = json['inStock'];
    supplierName = json['supplierName'];
    mainDetailid = json['mainDetailid'];
    tax = json['tax'];
    lastStock = json['lastStock'];
    changetime = json['changetime'];
    supplierdescription = json['supplierdescription'];
    supplierimg = json['supplierimg'];
    supplierlink = json['supplierlink'];
    supplierID = json['supplierID'];
    added = json['added'];
    active = json['active'];
    changeTimeBc = json['change_time_bc'];
    mainDetail = json['mainDetail'] != null
        ? new MainDetail.fromJson(json['mainDetail'])
        : null;
    bcAdditionalInfo = json['bcAdditionalInfo'] != null
        ? new BcAdditionalInfo.fromJson(json['bcAdditionalInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['descriptionLong'] = this.descriptionLong;
    data['description'] = this.description;
    data['number'] = this.number;
    data['inStock'] = this.inStock;
    data['supplierName'] = this.supplierName;
    data['mainDetailid'] = this.mainDetailid;
    data['tax'] = this.tax;
    data['lastStock'] = this.lastStock;
    data['changetime'] = this.changetime;
    data['supplierdescription'] = this.supplierdescription;
    data['supplierimg'] = this.supplierimg;
    data['supplierlink'] = this.supplierlink;
    data['supplierID'] = this.supplierID;
    data['added'] = this.added;
    data['active'] = this.active;
    data['change_time_bc'] = this.changeTimeBc;
    if (this.mainDetail != null) {
      data['mainDetail'] = this.mainDetail!.toJson();
    }
    if (this.bcAdditionalInfo != null) {
      data['bcAdditionalInfo'] = this.bcAdditionalInfo!.toJson();
    }
    return data;
  }
}

class MainDetail {
  String? number;
  String? inStock;
  bool? lastStock;

  MainDetail({this.number, this.inStock, this.lastStock});

  MainDetail.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    inStock = json['inStock'];
    lastStock = json['lastStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['inStock'] = this.inStock;
    data['lastStock'] = this.lastStock;
    return data;
  }
}

class BcAdditionalInfo {
  String? activeParent;
  String? bcCategoryparentName;
  String? bcCategoryparentID;
  String? bcCategoryID;
  String? bcCategoryName;
  BcArticleImg? bcArticleImg;
  String? articleId;
  List<ArticlePrice>? articlePrice;
  String? supplierName;
  List<BcPropertyValues>? bcPropertyValues;

  BcAdditionalInfo(
      {this.activeParent,
        this.bcCategoryparentName,
        this.bcCategoryparentID,
        this.bcCategoryID,
        this.bcCategoryName,
        this.bcArticleImg,
        this.articleId,
        this.articlePrice,
        this.supplierName,
        this.bcPropertyValues});

  BcAdditionalInfo.fromJson(Map<String, dynamic> json) {
    activeParent = json['activeParent'];
    bcCategoryparentName = json['bcCategoryparentName'];
    bcCategoryparentID = json['bcCategoryparentID'];
    bcCategoryID = json['bcCategoryID'];
    bcCategoryName = json['bcCategoryName'];
    bcArticleImg = json['bcArticleImg'] != null
        ? new BcArticleImg.fromJson(json['bcArticleImg'])
        : null;
    articleId = json['ArticleId'];
    if (json['ArticlePrice'] != null) {
      articlePrice = <ArticlePrice>[];
      json['ArticlePrice'].forEach((v) {
        articlePrice!.add(new ArticlePrice.fromJson(v));
      });
    }
    supplierName = json['SupplierName'];
    if (json['bcPropertyValues'] != null) {
      bcPropertyValues = <BcPropertyValues>[];
      json['bcPropertyValues'].forEach((v) {
        bcPropertyValues!.add(new BcPropertyValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activeParent'] = this.activeParent;
    data['bcCategoryparentName'] = this.bcCategoryparentName;
    data['bcCategoryparentID'] = this.bcCategoryparentID;
    data['bcCategoryID'] = this.bcCategoryID;
    data['bcCategoryName'] = this.bcCategoryName;
    if (this.bcArticleImg != null) {
      data['bcArticleImg'] = this.bcArticleImg!.toJson();
    }
    data['ArticleId'] = this.articleId;
    if (this.articlePrice != null) {
      data['ArticlePrice'] = this.articlePrice!.map((v) => v.toJson()).toList();
    }
    data['SupplierName'] = this.supplierName;
    if (this.bcPropertyValues != null) {
      data['bcPropertyValues'] =
          this.bcPropertyValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BcArticleImg {
  Src? src;

  BcArticleImg({this.src});

  BcArticleImg.fromJson(Map<String, dynamic> json) {
    src = json['src'] != null ? new Src.fromJson(json['src']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.src != null) {
      data['src'] = this.src!.toJson();
    }
    return data;
  }
}

class Src {
  String? s1;

  Src({this.s1});

  Src.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    return data;
  }
}

class ArticlePrice {
  String? priceWithoutTax;
  String? price1;
  CustomerGroup? customerGroup;

  ArticlePrice({this.priceWithoutTax, this.price1, this.customerGroup});

  ArticlePrice.fromJson(Map<String, dynamic> json) {
    priceWithoutTax = json['price_without_tax'];
    price1 = json['price1'];
    customerGroup = json['customerGroup'] != null
        ? new CustomerGroup.fromJson(json['customerGroup'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_without_tax'] = this.priceWithoutTax;
    data['price1'] = this.price1;
    if (this.customerGroup != null) {
      data['customerGroup'] = this.customerGroup!.toJson();
    }
    return data;
  }
}

class CustomerGroup {
  int? id;
  String? key;
  String? name;
  bool? tax;
  bool? taxInput;
  bool? mode;
  int? discount;
  int? minimumOrder;
  int? minimumOrderSurcharge;

  CustomerGroup(
      {this.id,
        this.key,
        this.name,
        this.tax,
        this.taxInput,
        this.mode,
        this.discount,
        this.minimumOrder,
        this.minimumOrderSurcharge});

  CustomerGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    tax = json['tax'];
    taxInput = json['taxInput'];
    mode = json['mode'];
    discount = json['discount'];
    minimumOrder = json['minimumOrder'];
    minimumOrderSurcharge = json['minimumOrderSurcharge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['name'] = this.name;
    data['tax'] = this.tax;
    data['taxInput'] = this.taxInput;
    data['mode'] = this.mode;
    data['discount'] = this.discount;
    data['minimumOrder'] = this.minimumOrder;
    data['minimumOrderSurcharge'] = this.minimumOrderSurcharge;
    return data;
  }
}

class BcPropertyValues {
  String? id;
  String? articleID;
  String? optionId;
  String? name;
  String? value;

  BcPropertyValues(
      {this.id, this.articleID, this.optionId, this.name, this.value});

  BcPropertyValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleID = json['articleID'];
    optionId = json['optionId'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleID'] = this.articleID;
    data['optionId'] = this.optionId;
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}