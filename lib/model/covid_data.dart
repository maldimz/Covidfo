class covidData {
  String? lastDate;
  double? currentData;
  double? missingData;
  int? tanpaProvinsi;
  List<ListData>? listData;

  covidData(
      {this.lastDate,
      this.currentData,
      this.missingData,
      this.tanpaProvinsi,
      this.listData});

  covidData.fromJson(Map<String, dynamic> json) {
    lastDate = json['last_date'];
    currentData = json['current_data'];
    missingData = json['missing_data'];
    tanpaProvinsi = json['tanpa_provinsi'];
    if (json['list_data'] != null) {
      listData = <ListData>[];
      json['list_data'].forEach((v) {
        listData!.add(new ListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_date'] = this.lastDate;
    data['current_data'] = this.currentData;
    data['missing_data'] = this.missingData;
    data['tanpa_provinsi'] = this.tanpaProvinsi;
    if (this.listData != null) {
      data['list_data'] = this.listData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListData {
  String? key;
  double? docCount;
  int? jumlahKasus;
  int? jumlahSembuh;
  int? jumlahMeninggal;
  int? jumlahDirawat;
  List<JenisKelamin>? jenisKelamin;
  List<KelompokUmur>? kelompokUmur;
  Lokasi? lokasi;
  Penambahan? penambahan;

  ListData(
      {this.key,
      this.docCount,
      this.jumlahKasus,
      this.jumlahSembuh,
      this.jumlahMeninggal,
      this.jumlahDirawat,
      this.jenisKelamin,
      this.kelompokUmur,
      this.lokasi,
      this.penambahan});

  ListData.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    docCount = json['doc_count'];
    jumlahKasus = json['jumlah_kasus'];
    jumlahSembuh = json['jumlah_sembuh'];
    jumlahMeninggal = json['jumlah_meninggal'];
    jumlahDirawat = json['jumlah_dirawat'];
    if (json['jenis_kelamin'] != null) {
      jenisKelamin = <JenisKelamin>[];
      json['jenis_kelamin'].forEach((v) {
        jenisKelamin!.add(new JenisKelamin.fromJson(v));
      });
    }
    if (json['kelompok_umur'] != null) {
      kelompokUmur = <KelompokUmur>[];
      json['kelompok_umur'].forEach((v) {
        kelompokUmur!.add(new KelompokUmur.fromJson(v));
      });
    }
    lokasi =
        json['lokasi'] != null ? new Lokasi.fromJson(json['lokasi']) : null;
    penambahan = json['penambahan'] != null
        ? new Penambahan.fromJson(json['penambahan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['doc_count'] = this.docCount;
    data['jumlah_kasus'] = this.jumlahKasus;
    data['jumlah_sembuh'] = this.jumlahSembuh;
    data['jumlah_meninggal'] = this.jumlahMeninggal;
    data['jumlah_dirawat'] = this.jumlahDirawat;
    if (this.jenisKelamin != null) {
      data['jenis_kelamin'] =
          this.jenisKelamin!.map((v) => v.toJson()).toList();
    }
    if (this.kelompokUmur != null) {
      data['kelompok_umur'] =
          this.kelompokUmur!.map((v) => v.toJson()).toList();
    }
    if (this.lokasi != null) {
      data['lokasi'] = this.lokasi!.toJson();
    }
    if (this.penambahan != null) {
      data['penambahan'] = this.penambahan!.toJson();
    }
    return data;
  }
}

class JenisKelamin {
  String? key;
  int? docCount;

  JenisKelamin({this.key, this.docCount});

  JenisKelamin.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    docCount = json['doc_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['doc_count'] = this.docCount;
    return data;
  }
}

class KelompokUmur {
  String? key;
  int? docCount;
  Usia? usia;

  KelompokUmur({this.key, this.docCount, this.usia});

  KelompokUmur.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    docCount = json['doc_count'];
    usia = json['usia'] != null ? new Usia.fromJson(json['usia']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['doc_count'] = this.docCount;
    if (this.usia != null) {
      data['usia'] = this.usia!.toJson();
    }
    return data;
  }
}

class Usia {
  double? value;

  Usia({this.value});

  Usia.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class Lokasi {
  double? lon;
  double? lat;

  Lokasi({this.lon, this.lat});

  Lokasi.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}

class Penambahan {
  int? positif;
  int? sembuh;
  int? meninggal;

  Penambahan({this.positif, this.sembuh, this.meninggal});

  Penambahan.fromJson(Map<String, dynamic> json) {
    positif = json['positif'];
    sembuh = json['sembuh'];
    meninggal = json['meninggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['positif'] = this.positif;
    data['sembuh'] = this.sembuh;
    data['meninggal'] = this.meninggal;
    return data;
  }
}
