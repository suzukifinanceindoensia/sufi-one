import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class MobileCollection extends StatefulWidget {
  const MobileCollection({super.key});

  @override
  MobileCollectionState createState() => MobileCollectionState();
}

class MobileCollectionState extends State<MobileCollection> {
  bool showCustomerInfo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withAlpha(
        (0.2 * 255).toInt(),
      ), // Ganti dari withOpacity(0.2)
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        centerTitle: false,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('res/images/logo_suzuki.png', height: 40),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Suzuki Finance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Kredit Resmi Suzuki',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showCustomerInfo = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        showCustomerInfo
                            ? const Color.fromARGB(255, 53, 138, 235)
                            : const Color.fromARGB(255, 255, 255, 255),
                    foregroundColor:
                        showCustomerInfo ? Colors.white : Colors.black,
                  ),
                  child: const Text('Customer Info'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showCustomerInfo = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        !showCustomerInfo
                            ? const Color.fromARGB(255, 53, 138, 235)
                            : const Color.fromARGB(255, 255, 255, 255),
                    foregroundColor:
                        !showCustomerInfo ? Colors.white : Colors.black,
                  ),
                  child: const Text('Collection Form'),
                ),
                const SizedBox(width: 8),
              ],
            ),
            showCustomerInfo ? buildCustomerInfo() : buildCollectionForm(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0071C5),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_device_information),
            label: 'About',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Support'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget buildCustomerInfo() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((0.5 * 255).toInt()),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Customer Info',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage('https://placehold.co/50x50'),
                  radius: 25,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Jajang Nurjaman',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Customer'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          buildTextField('Alamat', 'Value'),
          buildTextField('No Telepon', 'Value'),
          buildTextField('Tanggal Janji Tempo', 'Value'),
          buildTextField('Angsuran Ke', 'Value'),
          buildTextField('Keterangan', 'Value'),
          buildTextField('Deskripsi Keterlambatan', 'Value'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              logger.i('Customer Info Submitted');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[600],
              foregroundColor: Colors.white,
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget buildCollectionForm() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((0.5 * 255).toInt()),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Mobile Collection System',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage('https://placehold.co/50x50'),
                  radius: 25,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Jajang Nurjaman',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Customer'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Foto Lokasi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'res/images/lokasi_foto.jpg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          buildDropdown('Apakah Bertemu Dengan Customer?', ['Ya', 'Tidak']),
          buildDropdown('Alamat yang Dikunjungi?', [
            'Alamat KTP',
            'Alamat Rumah',
          ]),
          buildDropdown('Apakah Alamat Berubah', ['Tidak', 'Ya']),
          buildDropdown('Apakah Unit Ada?', ['Ya', 'Tidak']),
          buildDropdown('Apakah Customer Akan Membayar?', ['Ya', 'Tidak']),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfoRow('Tagihan Perbulan:', 'Rp 3.344.000'),
                buildInfoRow('Tagihan:', 'Rp 3.344.000'),
                buildInfoRow('Total Tagihan:', 'Rp 3.344.000'),
                buildInfoRow('Jumlah Pembayaran:', 'Rp 0'),
                buildInfoRow('Sisa Tagihan:', 'Rp 3.344.000'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              logger.i('Collection Form Submitted');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[600],
              foregroundColor: Colors.white,
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: placeholder,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildDropdown(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          items:
              options
                  .map(
                    (value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
          onChanged: (_) {},
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
