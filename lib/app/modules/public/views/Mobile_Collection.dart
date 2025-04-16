import 'package:flutter/material.dart';

class MobileCollection extends StatefulWidget {
  const MobileCollection({super.key});

  @override
  _MobileCollectionState createState() => _MobileCollectionState();
}

class _MobileCollectionState extends State<MobileCollection> {
  bool showCustomerInfo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        centerTitle: false,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Logo Suzuki
            Image.asset(
              'res/images/logo_suzuki.png', // Ganti dengan logo Suzuki kamu
              height: 40,
            ),
            SizedBox(width: 12),

            // Judul
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
            // Buttons
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
                            ? const Color.fromARGB(255, 0, 0, 0)
                            : const Color.fromARGB(255, 233, 233, 233),
                  ),
                  child: Text('Customer Info'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showCustomerInfo = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        !showCustomerInfo
                            ? const Color.fromARGB(255, 0, 0, 0)
                            : Colors.grey,
                  ),
                  child: Text('Collection Form'),
                ),
              ],
            ),
            // Content
            showCustomerInfo ? buildCustomerInfo() : buildCollectionForm(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF0071C5),
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
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Customer Info',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://placehold.co/50x50',
                  ), // Placeholder image
                  radius: 25,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
          SizedBox(height: 16),
          buildTextField('Alamat', 'Value'),
          buildTextField('No Telepon', 'Value'),
          buildTextField('Tanggal Janji Tempo', 'Value'),
          buildTextField('Angsuran Ke', 'Value'),
          buildTextField('Keterangan', 'Value'),
          buildTextField('Deskripsi Keterlambatan', 'Value'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle submit action
              print('Customer Info Submitted');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[600]),
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget buildCollectionForm() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Mobile Collection System',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://placehold.co/50x50',
                  ), // Placeholder image
                  radius: 25,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
          SizedBox(height: 16),
          Text(
            'Foto Lokasi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Image.asset(
            'assets/images/lokasi_foto.jpg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          buildDropdown('Apakah Bertemu Dengan Customer?', ['Ya', 'Tidak']),
          buildDropdown('Alamat yang Dikunjungi?', [
            'Alamat KTP',
            'Alamat Rumah',
          ]),
          buildDropdown('Apakah Alamat Berubah', ['Tidak', 'Ya']),
          buildDropdown('Apakah Unit Ada?', ['Ya', 'Tidak']),
          buildDropdown('Apakah Customer Akan Membayar?', ['Ya', 'Tidak']),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
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
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle submit action
              print('Collection Form Submitted');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[600]),
            child: Text('Submit'),
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
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: placeholder,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildDropdown(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(border: OutlineInputBorder()),
          items:
              options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          onChanged: (_) {},
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
