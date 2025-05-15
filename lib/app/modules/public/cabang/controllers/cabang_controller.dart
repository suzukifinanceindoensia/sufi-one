import 'dart:async';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class CabangController extends GetxController {
  final RxList<Map<String, String>> cabangList =
      <Map<String, String>>[
        {
          'name': 'Balikpapan',
          'address':
              'Jl. Letkol HM Asnawi Arbain (BJ-BJ) Ruko Rubiz No.36 RT.51 Kel. Gunung Bahagia, Kecamatan Balikpapan Selatan',
          'latitude': '-1.265386',
          'longitude': '116.831230',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Bandar Lampung',
          'address':
              'Jl. Wolter Monginsidi No. 30 Kel. Durian Payung Kec. Tanjung Karang Pusat Kota Bandar Lampung Kode Pos 35116',
          'latitude': '-5.429495',
          'longitude': '105.261509',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Bandung',
          'address': 'Jl. BKR 14C Kelurahan Cijagra Kec. Lengkong Kota Bandung',
          'latitude': '-6.948273',
          'longitude': '107.606767',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Banjarbaru',
          'address':
              'Jl. Guntung Manggis Rt. 13 Rw. 03 Kel. Guntung manggis Kec. Landasan Ulin Kab. Guntung manggis Kota Banjarbaru',
          'latitude': '-3.444292',
          'longitude': '114.815560',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Banjarmasin',
          'address':
              'Jl Gatot Subroto Raya No. 112 RT 20 Kel. Kebun Bunga Kec. Banjar Timur Kota Banjarmasin Kode Pos 70235',
          'latitude': '-3.321193',
          'longitude': '114.600475',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Banyuwangi',
          'address':
              'JL. Brawijaya No. 11 Rt. 02 Rw. 01 Kel. Kebalen Kec. Banyuwangi Kota. Banyuwangi, Provinsi Jawa Timur',
          'latitude': '-8.219233',
          'longitude': '114.371398',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Barabai',
          'address':
              'Jl.H.Damanhuri No.1 Kel. Banua Binjai Kec. Barabai Kab Hulu Sungai Tengah Kode Pos 71315',
          'latitude': '-2.588781',
          'longitude': '115.388953',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Batam',
          'address':
              'Jl. Laksamana Bintan Komp. Bumi Riau Makmur Blok D No.13 Kel. Sungai Panas Kec. Batam Kota Kota Batam Kode Pos 29433',
          'latitude': '1.121000',
          'longitude': '104.043304',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Batu Licin',
          'address':
              'Jl Raya Batu Licin Rt 001 Kelurahan Kampung Baru Kecamatan Simpang Empat Kab Tanah Bumbu',
          'latitude': '-3.451526',
          'longitude': '115.811757',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Bekasi',
          'address':
              'Komplek Ruko Bekasi Town Square (BETOS) Ruko CBD Blok B No 1, Jl Cut Mutia Kel Margahayu Kec Bekasi Timur Kota Bekasi',
          'latitude': '-6.238270',
          'longitude': '106.991646',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Bengkulu',
          'address':
              'Jl. Mayjen Sutoyo No. 88 Kel. Jembatan Kecil Kec. Singaran Pati Kota/Kab Bengkulu Kode Pos 38224',
          'latitude': '-3.787956',
          'longitude': '102.265541',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Blitar',
          'address':
              'Jl. Ra Kartini No 10C Kel. Kepanjenlor Kec. Kepanjenkidul Kota/Kab. Blitar Kode Pos 66117',
          'latitude': '-8.098644',
          'longitude': '112.168194',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Bogor',
          'address':
              'Jl. Raya Pajajaran No. 23 F Kel. Sukasari Kec. Bogor Timur Kota Bogor Kode Pos 16142',
          'latitude': '-6.591453',
          'longitude': '106.805147',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Cirebon',
          'address':
              'Ruko Tuparev Super, Jl. Tuparev Blok C No.6 Kel. Sutawinangun Kec. Kedawung, Kab. Cirebon Kode Pos 45153',
          'latitude': '-6.714743',
          'longitude': '108.547438',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Denpasar',
          'address':
              'Jl. Gatot Subroto No. 369 X, Kelurahan Penatih, Kec Denpasar Timur, Kota Denpasar',
          'latitude': '-8.647817',
          'longitude': '115.230003',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Depok',
          'address':
              'Jl. Raya Bogor No.KM 31, Cisalak, Kec. Cimanggis, Kota Depok, Jawa Barat 16416',
          'latitude': '-6.374003',
          'longitude': '106.863215',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Duri',
          'address':
              'Jl. Desa Maju KM 125 RT.002 RW. 004 Kel. Balai Makam Kec. Mandau, Kab. Bengkalis, Riau',
          'latitude': '1.309316',
          'longitude': '101.180871',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Gorontalo',
          'address':
              'Jl. Prof. Dr. H.B. Jassin, Limba B, Kota Sel., Kota Gorontalo, Gorontalo 96135',
          'latitude': '0.542482',
          'longitude': '123.062152',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Gresik',
          'address':
              'Ruko Bunder Square, Jl. Dr. Wahidin Sudirohusodo No.3A No. 2A, Dahanrejo, Kec. Kebomas, Kabupaten Gresik, Jawa Timur 61124',
          'latitude': '-7.168200',
          'longitude': ' 112.589064',
          'distance': 'Menghitung...',
        },
        {
          'name': 'grobogan',
          'address':
              'Jl. R.Suprapto No.65B, Jetis Barat, Jetis, Kec. Purwodadi, Kabupaten Grobogan, Jawa Tengah 58111',
          'latitude': '-7.085615',
          'longitude': '110.897238',
          'distance': 'Menghitung...',
        },
        {
          'name': 'jakarta barat',
          'address':
              'Jl. Raya Lingkar Luar Barat RT.004 RW.03, Rawa Buaya - Cengkareng, Jakarta Barat 021-54330356/54330156',
          'latitude': '-6.163151',
          'longitude': '106.727709',
          'distance': 'Menghitung...',
        },
        {
          'name': 'jakarta timur',
          'address':
              'Jl. Dewi Sartika No.173 Rt 05/12 Kel.Cawang Kec.Kramat Jati Kota Jakarta Timur Propinsi DKI Jakarta',
          'latitude': '-6.251220',
          'longitude': '106.865755',
          'distance': 'Menghitung...',
        },
        {
          'name': 'jakarta utara',
          'address':
              'Jl. Danau Sunter Blok O/III No. 49 - 50 Sunter Jaya Tanjung Priok Kode Pos 14360',
          'latitude': '-6.143732',
          'longitude': '106.885125',
          'distance': 'Menghitung...',
        },
        {
          'name': 'jambi',
          'address':
              'Jl M Yamin No. 51 Kel. Lebak Bandung Kec. Jelutung Kota Jambi Kode Pos 36135',
          'latitude': '-1.605134',
          'longitude': '103.605763',
          'distance': 'Menghitung...',
        },
        {
          'name': 'karawang',
          'address':
              'JL. Raya Kosambi, No. 168, Klari, Duren, Karawang, Jawa Barat 41371',
          'latitude': '-6.364219',
          'longitude': '107.374361',
          'distance': 'Menghitung...',
        },
        {
          'name': 'kediri',
          'address':
              'Jl. Brigjen Katamso no 28 Rt 004 Rw 004 Kelurahan Kampung Dalem Kota Kediri Kec. Kediri Kota',
          'latitude': '-7.826787',
          'longitude': '112.015806',
          'distance': 'Menghitung...',
        },
        {
          'name': 'kendari',
          'address':
              'Jl. Sao-Sao No.281 D Kel. Bende Kec. Kadia Kota Kendari Kode Pos 93118',
          'latitude': '-3.989372',
          'longitude': '122.508861',
          'distance': 'Menghitung...',
        },
        {
          'name': 'klaten',
          'address':
              'Jl. Klaten - Solo, Belang Wetan, Klaten Utara, Klaten Regency, Central Java 57465',
          'latitude': '-7.686205',
          'longitude': '110.636069',
          'distance': 'Menghitung...',
        },
        {
          'name': 'kota mobagu',
          'address':
              'Jl. Adampe Dolot, Mogolaing, Kec. Kotamobagu Bar., Kota Kotamobagu, Sulawesi Utara 95716',
          'latitude': '0.735945',
          'longitude': '124.306453',
          'distance': 'Menghitung...',
        },
        {
          'name': 'kotawaringin barat',
          'address':
              'Jl. Ratu Mangku No.27, RT.005/RW.000, Sidorejo, Kec. Arut Sel., Kabupaten Kotawaringin Barat, Kalimantan Tengah 74111',
          'latitude': '-2.681162',
          'longitude': '111.640580',
          'distance': 'Menghitung...',
        },
        {
          'name': 'kotawaringin timur',
          'address':
              'Jl. Pelita No.70, Mentawa Baru Hilir, Kec. Mentawa Baru Ketapang, Kabupaten Kotawaringin Timur, Kalimantan Tengah 74321',
          'latitude': '-2.550297',
          'longitude': '112.953345',
          'distance': 'Menghitung...',
        },
        {
          'name': 'kudus',
          'address':
              'Jl. Sunan Muria No.57, Glantengan, Kec. Kota Kudus, Kabupaten Kudus, Jawa Tengah 59313',
          'latitude': '-6.800337',
          'longitude': '110.845406',
          'distance': 'Menghitung...',
        },
        {
          'name': 'kupang',
          'address':
              'JLN. TIMOR RAYA NO. 01 STRAT A-OEBA KELURAH FATUBESI Strat A - Oeba, Fatubesi, Kec. Kota Lama, Kota Kupang, Nusa Tenggara Tim. 86522',
          'latitude': '-10.156151',
          'longitude': '123.595027',
          'distance': 'Menghitung...',
        },
        {
          'name': 'labuhan ratu',
          'address':
              'JL. Ahmad Yani, No. 6, Bakaran Batu, Labuhan Batu, Rantau Prapat, South Sumatera, Bakaran Batu, Rantau Selatan, Labuhan Batu Regency, North Sumatra 21419',
          'latitude': '2.093189',
          'longitude': '99.844595',
          'distance': 'Menghitung...',
        },
        {
          'name': 'lampung tengah',
          'address':
              'Jl. Proklamator Raya No. 128 Kel. Bandar Jaya Kec. Terbanggi Besar Kota/Kab Lampung Tengah Kode Pos 34162',
          'latitude': '-4.954032',
          'longitude': '105.216259',
          'distance': 'Menghitung...',
        },
        {
          'name': 'madiun',
          'address':
              'Jl. Marsma TNI Anumerta R. Iswahjudi No.35, Jiwan Utara, Jiwan, Kec. Manguharjo, Kabupaten Madiun, Jawa Timur 63122',
          'latitude': '-7.623964',
          'longitude': '111.496281',
          'distance': 'Menghitung...',
        },
        {
          'name': 'makassar',
          'address':
              'Jl. Perintis Kemerdekaan No.km.9, Tamalanrea Jaya, Kec. Tamalanrea, Kota Makassar, Sulawesi Selatan 90245',
          'latitude': '-5.141291',
          'longitude': '119.481215',
          'distance': 'Menghitung...',
        },
        {
          'name': 'malang',
          'address':
              'Jl. Letjend S. Parman No.54, Purwantoro, Kec. Blimbing, Kota Malang, Jawa Timur 65126',
          'latitude': '-7.950081',
          'longitude': '112.643882',
          'distance': 'Menghitung...',
        },
        {
          'name': 'manado',
          'address':
              'Jl. Pierre Tendean Ruko Boulevard No.110, Sario Tumpaan, Kec. Sario, Kota Manado, Sulawesi Utara',
          'latitude': '1.468465',
          'longitude': '124.835894',
          'distance': 'Menghitung...',
        },
        {
          'name': 'mataram',
          'address':
              'Jl. Dewi Ratih No.20, Sapta Marga, Kec. Cakranegara, Kota Mataram, Nusa Tenggara Bar. 83232',
          'latitude': '-8.593256',
          'longitude': '116.130725',
          'distance': 'Menghitung...',
        },
        {
          'name': 'medan',
          'address':
              'Kompleks Tomang Elok Jalan Murai I Blok C No 106 Kel Simpang Tanjung Kec Medan Sunggal, Kota Medan',
          'latitude': '3.590379',
          'longitude': '98.642920',
          'distance': 'Menghitung...',
        },
        {
          'name': 'mojokerto',
          'address':
              'Jl. Pahlawan No.40C, Mergelo, Kranggan, Kec. Prajurit Kulon, Kota Mojokerto, Jawa Timur 61321',
          'latitude': '-7.465993',
          'longitude': '112.433232',
          'distance': 'Menghitung...',
        },
        {
          'name': 'padang',
          'address':
              'Jl. Dr. Sutomo No.90, Kubu Marapalam, Kec. Padang Tim., Kota Padang, Sumatera Barat 25143',
          'latitude': '-0.949604',
          'longitude': '100.385722',
          'distance': 'Menghitung...',
        },
        {
          'name': 'palangkaraya',
          'address':
              'Jl. Seth Adji ruko No.1, Langkai, Kec. Pahandut, Kota Palangka Raya, Kalimantan Tengah 73111',
          'latitude': '-2.244658',
          'longitude': '113.929851',
          'distance': 'Menghitung...',
        },
        {
          'name': 'palembang',
          'address':
              'Jl. Kolonel H. Barlian No.168 C-D, Suka Bangun, Kec. Sukarami, Kota Palembang, Sumatera Selatan 30961',
          'latitude': '-2.943036',
          'longitude': '104.729861',
          'distance': 'Menghitung...',
        },
        {
          'name': 'palu',
          'address':
              'Jl. Emmy Saelan No 44 Kel. Palu Selatan Kec. Tatura Utara Kota Palu Kode Pos 94236',
          'latitude': '-0.911065',
          'longitude': '119.875902',
          'distance': 'Menghitung...',
        },
        {
          'name': 'pangkal pinang',
          'address':
              'Jl. Jend.Sudirman No.8, Pangkalpinang, Bangka Air Salemba Kecamatan Gabek, Gedung Nasional, Taman Sari, Bangka Regency, Bangka Belitung Islands 33684',
          'latitude': '-2.126222',
          'longitude': '106.115823',
          'distance': 'Menghitung...',
        },
        {
          'name': 'parepare',
          'address':
              'Jl. Bau Massepe No.340, Labukkang, Kec. Ujung, Kota Parepare, Sulawesi Selatan',
          'latitude': '-4.016430',
          'longitude': '119.624012',
          'distance': 'Menghitung...',
        },
        {
          'name': 'pekalongan',
          'address':
              'Jl Raya Tirto No 27 Kel. Tirto Kec. Pekalongan Barat Kota/Kab. Pekalongan Kode Pos 51151',
          'latitude': '-6.889279',
          'longitude': '109.651131',
          'distance': 'Menghitung...',
        },
        {
          'name': 'pekanbaru',
          'address':
              'Jl Durian no 103 A Rt 1/8 Kel Kampung Melayu Kec Sukajadi Kota Pekanbaru',
          'latitude': '0.516731',
          'longitude': '101.435915',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Pematang Siantar',
          'address':
              'Komp. Ruko Mega Land Blok. A No.41, Jl. Asahan, Siopat Suhu, Kec. Siantar Tim., Kota Pematang Siantar, Sumatera Utara 21136',
          'latitude': '2.962249',
          'longitude': '99.082025',
          'distance': 'Menghitung...',
        },
        {
          'name': 'pohuwato',
          'address':
              'Jl. Prof. Dr. H.B. Jassin II No.237, Limba U Dua, Kota Sel., Kota Gorontalo, Gorontalo 96138',
          'latitude': '0.552297',
          'longitude': '123.050590',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Pontianak',
          'address':
              'Jl. Khw. Hasyim No.205, Tengah, Kec. Pontianak Kota, Kota Pontianak, Kalimantan Barat 78244',
          'latitude': '-0.022628',
          'longitude': '109.325928',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Purwakarta',
          'address':
              'Jl. Veteran No.272B, Ciseureuh, Kec. Babakancikao, Kabupaten Purwakarta, Jawa Barat 41115',
          'latitude': '-6.531951',
          'longitude': '107.437642',
          'distance': 'Menghitung...',
        },
        {
          'name': 'Purwokerto',
          'address':
              'Jl. Raga Semangsang No.18, Purwokerto, Sokanegara, Kec. Purwokerto Tim., Kabupaten Banyumas, Jawa Tengah 53115',
          'latitude': '-7.422835',
          'longitude': '109.231344',
          'distance': 'Menghitung...',
        },
        {
          'name': 'rembang',
          'address':
              'Jl. Pemuda km2 No.5, Dukuhan, Rumbut MalangRambutmalang, Kabongan KidulKec. Rembang, Kabupaten Rembang, Jawa Tengah 59218',
          'latitude': '-6.725605',
          'longitude': '111.349646',
          'distance': 'Menghitung...',
        },
        {
          'name': 'samarinda',
          'address':
              'Jl. P Antasari No.41 B, Tlk. Lerong Ulu, Kec. Sungai Kunjang, Kota Samarinda, Kalimantan Timur 75127',
          'latitude': '-0.492720',
          'longitude': '117.129178',
          'distance': 'Menghitung...',
        },
        {
          'name': 'sangatta',
          'address':
              'Jl. Merdeka No.60 A RT.014 Kel. Sangatta Utara, Kec. Sangatta Utara, Kab. Kutai Timur, Propinsi Kalimantan Timur',
          'latitude': '0.519089',
          'longitude': '117.538978',
          'distance': 'Menghitung...',
        },
        {
          'name': 'sanggau',
          'address':
              'Jalan Bujang Malaka RT 016, RW 08 Kel. Beringin Kec. Kapuas Kab. Sanggau Prov Kalimantan Barat',
          // 'latitude': '0.369885',
          // 'longitude': '108.959585',
          'distance': 'Menghitung...',
        },
        {
          'name': 'semarang',
          'address':
              'Jl. Gajah Raya No.168c, Pandean Lamper, Kec. Gayamsari, Kota Semarang, Jawa Tengah 50249',
          'latitude': '-6.994337',
          'longitude': '110.447154',
          'distance': 'Menghitung...',
        },
        {
          'name': 'serang',
          'address':
              'Jl. Raya Serang - Pandeglang No.Km 4, Karundang, Kec. Cipocok Jaya, Kota Serang, Banten 42122',
          'latitude': '-6.153611',
          'longitude': '106.158833',
          'distance': 'Menghitung...',
        },
        {
          'name': 'sidoarjo',
          'address':
              'Jl Raya Bluru Kidul No 87 kel. bluru kidul kec. Sidoarjo kab. Sidoarjo provisi Jawa Timur',
          //  'latitude': '-6.153611',
          //  'longitude': '106.158833',
          'distance': 'Menghitung...',
        },
        {
          'name': 'singkawang',
          'address':
              'Jl. Pangeran Diponegoro, Pasiran, Kec. Singkawang Bar., Kota Singkawang, Kalimantan Barat 79123',
          'latitude': '0.900785',
          'longitude': '108.982322',
          'distance': 'Menghitung...',
        },
        {
          'name': 'surabaya',
          'address':
              'Jl. Kenjeran No.552, Kalijudan, Kec. Mulyorejo, Surabaya, Jawa Timur 60114',
          'latitude': '-7.251683',
          'longitude': '112.790659',
          'distance': 'Menghitung...',
        },
        {
          'name': 'surakarta',
          'address':
              'Jl Veteran 221 Kel. Serengan Kec. Serengan Kota Surakarta Kode Pos 57155',
          //  'latitude': '-7.251683',
          //  'longitude': '112.790659',
          'distance': 'Menghitung...',
        },
        {
          'name': 'tanah grogot',
          'address':
              'Jl.Jend Sudirman RT 003 RW 003 No 17 kelurahan Tanah Grogot Kec. Tanah Grogot Kab. Paser',
          //  'latitude': '-7.251683',
          //  'longitude': '112.790659',
          'distance': 'Menghitung...',
        },
        {
          'name': 'tangerang',
          'address':
              'Ruko, Alam Sutera, A No. 19-20, Jl. Jalur Sutera Tim. No.Kav. 19, Kunciran, Kota Tangerang, Banten 15143',
          'latitude': '-6.225782',
          'longitude': '106.660258',
          'distance': 'Menghitung...',
        },
        {
          'name': 'tarakan',
          'address':
              'Jl. Yos Sudarso, Selumit Pantai, Kec. Tarakan Tengah, Kota Tarakan, Kalimantan Utara',
          'latitude': '3.302873',
          'longitude': '117.585945',
          'distance': 'Menghitung...',
        },
        {
          'name': 'tasikmalaya',
          'address':
              'Jl. R.E. Martadinata No.224, Cipedes, Kec. Cipedes, Kab. Tasikmalaya, Jawa Barat 46151',
          'latitude': '-7.309379',
          'longitude': '108.210464',
          'distance': 'Menghitung...',
        },
        {
          'name': 'tegal',
          'address':
              'Ruko Nirmala Estate No 12 Jl Laksamana Muda Yos Sudarso Kel. Mintaragen Kec. Tegal Timur Kota Tegal Kode Pos 52121',
          'latitude': '-6.854824',
          'longitude': '109.140780',
          'distance': 'Menghitung...',
        },
        {
          'name': 'ternate',
          'address':
              'Jl. Raya Bastiong, Bastiong Talangame, Kec. Ternate Sel., Kota Ternate, Maluku Utara 97716',
          'latitude': '0.767692',
          'longitude': '127.376059',
          'distance': 'Menghitung...',
        },
        {
          'name': 'tobelo',
          'address':
              'Jl. Raya Kemakmuran Kel Gosoma Kec Tobelo Kab Halmahera Utara (97762)',
          'latitude': '1.714396',
          'longitude': '128.010606',
          'distance': 'Menghitung...',
        },
        {
          'name': 'tulungagung',
          'address':
              'Jl Mayor Sujadi Timur No 10c (Ruko C) Ds. Plosokandang Kec Kedungwaru, Tulungagung 66218',
          //  'latitude': '1.714396',
          //  'longitude': '128.010606',
          'distance': 'Menghitung...',
        },
        {
          'name': 'yogyakarta',
          'address':
              'Jl Hos Cokroaminoto No 142 - A Kel Tegalrejo Kec Tegalrejo Kota Yogyakarta Kode Pos 55244',
          'latitude': '-7.786080',
          'longitude': '110.353224',
          'distance': 'Menghitung...',
        },
      ].obs;

  RxString selectedCabang = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _requestLocationPermission();
  }

  void updateSelectedCabang(String cabang) async {
    selectedCabang.value = cabang;
    await calculateDistance(cabang);
  }

  Future<void> calculateDistance(String cabangName) async {
    try {
      final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final cabang = cabangList.firstWhere(
        (c) => c['name'] == cabangName,
        orElse:
            () => {
              'name': 'Tidak Ditemukan',
              'address': 'Alamat tidak tersedia',
              'latitude': '',
              'longitude': '',
              'distance': '0 km',
            },
      );

      if (cabang != null) {
        final latitude = cabang['latitude'];
        final longitude = cabang['longitude'];

        if (latitude != null && longitude != null) {
          final distance =
              Geolocator.distanceBetween(
                currentPosition.latitude,
                currentPosition.longitude,
                double.parse(latitude),
                double.parse(longitude),
              ) /
              1000; // Convert to km

          cabang['distance'] = "${distance.toStringAsFixed(2)} km";

          // Untuk memperbarui data di UI
          cabangList.refresh();
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Tidak dapat menghitung jarak: $e");
    }
  }

  Future<void> goToMap(String name) async {
    final cabang = cabangList.firstWhere(
      (c) => c['name'] == name,
      orElse: () => {'latitude': '', 'longitude': ''},
    );
    final latitude = cabang['latitude'];
    final longitude = cabang['longitude'];

    if (latitude != null &&
        longitude != null &&
        latitude.isNotEmpty &&
        longitude.isNotEmpty) {
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
        await launchUrl(Uri.parse(googleMapsUrl));
      } else {
        Get.snackbar("Error", "Tidak dapat membuka Google Maps.");
      }
    } else {
      Get.snackbar("Error", "Koordinat cabang tidak ditemukan.");
    }
  }

  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        Get.snackbar("Error", "Izin lokasi diperlukan untuk menghitung jarak.");
      }
    }
  }
}
