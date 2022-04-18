class DataVaksin {
  Vaksinasi? vaksinasi;

  DataVaksin({this.vaksinasi});

  DataVaksin.fromJson(Map<String, dynamic> json) {
    vaksinasi = json['vaksinasi'] != null
        ? new Vaksinasi.fromJson(json['vaksinasi'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vaksinasi != null) {
      data['vaksinasi'] = this.vaksinasi!.toJson();
    }
    return data;
  }
}

class Vaksinasi{
  Penambahan? penambahan;
  Total? total;

  Vaksinasi({this.penambahan, this.total});

  Vaksinasi.fromJson(Map<String, dynamic> json) {
    penambahan = json['penambahan'] != null
        ? new Penambahan.fromJson(json['penambahan'])
        : null;
    total = json['total'] != null ? new Total.fromJson(json['total']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.penambahan != null) {
      data['penambahan'] = this.penambahan!.toJson();
    }
    if (this.total != null) {
      data['total'] = this.total!.toJson();
    }
    return data;
  }
}

class Penambahan {
  int? jumlahVaksinasi1;
  int? jumlahVaksinasi2;
  String? tanggal;
  String? created;

  Penambahan(
      {this.jumlahVaksinasi1,
      this.jumlahVaksinasi2,
      this.tanggal,
      this.created});

  Penambahan.fromJson(Map<String, dynamic> json) {
    jumlahVaksinasi1 = json['jumlah_vaksinasi_1'];
    jumlahVaksinasi2 = json['jumlah_vaksinasi_2'];
    tanggal = json['tanggal'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jumlah_vaksinasi_1'] = this.jumlahVaksinasi1;
    data['jumlah_vaksinasi_2'] = this.jumlahVaksinasi2;
    data['tanggal'] = this.tanggal;
    data['created'] = this.created;
    return data;
  }
}

class Total {
  int? jumlahVaksinasi1;
  int? jumlahVaksinasi2;

  Total({this.jumlahVaksinasi1, this.jumlahVaksinasi2});

  Total.fromJson(Map<String, dynamic> json) {
    jumlahVaksinasi1 = json['jumlah_vaksinasi_1'];
    jumlahVaksinasi2 = json['jumlah_vaksinasi_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jumlah_vaksinasi_1'] = this.jumlahVaksinasi1;
    data['jumlah_vaksinasi_2'] = this.jumlahVaksinasi2;
    return data;
  }
}
