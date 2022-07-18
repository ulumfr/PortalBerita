-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jul 2022 pada 16.28
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_berita`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `album_name` varchar(100) NOT NULL,
  `album_seo` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id`, `album_name`, `album_seo`, `photo`, `is_active`) VALUES
(17, 'Album 1', 'album-1', 'album-1-1581343722711.jpg', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `banner`
--

INSERT INTO `banner` (`id`, `title`, `photo`) VALUES
(5, 'Home', '3f0edd4a3de4375c41038e0ccf300b3b.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `category_name`, `slug`, `is_active`) VALUES
(6, 'Technology', 'technology', 'Y'),
(9, 'Health', 'health', 'Y'),
(10, 'Education', 'education', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `contact`
--

INSERT INTO `contact` (`id`, `contact_name`, `description`) VALUES
(1, 'About Me', 'Ini adalah project portal berita dan artikel sederhana, yang bertujuan membantu para programmer memahami dalam pembuatan projects serta penguasaan dalam bahasa pemrograman, library dan framework.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `id_album` int(11) NOT NULL,
  `gallery_name` varchar(100) NOT NULL,
  `gallery_seo` varchar(100) NOT NULL,
  `information` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id`, `id_album`, `gallery_name`, `gallery_seo`, `information`, `photo`, `is_active`) VALUES
(9, 17, 'Galeri 2', 'galeri-2', 'LIfe is Strange', 'galeri-2-15815614412.jpg', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `identity`
--

CREATE TABLE `identity` (
  `id` int(11) NOT NULL,
  `web_name` varchar(255) NOT NULL,
  `web_address` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `identity`
--

INSERT INTO `identity` (`id`, `web_name`, `web_address`, `meta_description`, `meta_keyword`, `photo`) VALUES
(1, 'Ninews', 'Ninews', 'Latest Indonesia and World News Today, the Latest Most Complete Daily News Regarding Politics, Economy, Travel, Technology, Automotive, ...', 'Ninews', 'f98ca9ac053046af9ad294f8ad5257ac.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 'Setting Web', '', 'fas fa-fw fa-cog', 'Y'),
(2, 'Setting Menu', '', 'fas fa-fw fa-sliders-h', 'Y'),
(3, 'Manajemen Artikel', '', 'fas fa-fw fa-newspaper', 'Y'),
(4, 'Media', '', 'fas fa-fw fa-photo-video', 'Y'),
(6, 'Logout', 'auth/logout', '', 'N'),
(7, 'User (soon)', 'admin/user', 'fas fa-fw fa-user', 'Y'),
(8, 'Ninews', 'home', 'fas fa-fw fa-home', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posting`
--

CREATE TABLE `posting` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `featured` char(1) NOT NULL,
  `choice` char(1) NOT NULL,
  `thread` char(1) NOT NULL,
  `id_category` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `is_active` char(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `posting`
--

INSERT INTO `posting` (`id`, `title`, `seo_title`, `content`, `featured`, `choice`, `thread`, `id_category`, `photo`, `is_active`, `date`) VALUES
(88, '4 Risiko yang Mengintai Pengguna Aplikasi MOD di Android', '4-risiko-yang-mengintai-pengguna-aplikasi-mod-di-android', '<p> Aplikasi modifikasi (MOD) sudah banyak beredar di dunia maya, sehingga sangat mudah ditemukan oleh penggunanya dan diinstal di perangkat Android.</p>\r\n<p>Dilansir dari keterangan resmi Kominfo, (11/4/2022), aplikasi MOD ini memungkinkan fitur premium atau berbayar dijadikan gratis, serta menghadirkan banyak fitur yang tidak dimiliki oleh aplikasi resmi.\r\nAplikasi MOD sendiri dikembangkan oleh developer pihak ketiga, sehingga dapat merugikan developer resmi. Dan, ternyata aplikasi ini bisa merugikan penggunanya.\r\n</p>\r\n<p> Lantas, apa saja kerugian yang bisa didapati para pengguna aplikasi MOD? Berikut paparannya.\r\n<p>1. Terserang virus yang bikin smartphone cepat panas dan lemot</p>\r\n<p>2. Muncul banyak iklan mengganggu</p>\r\n<p>3 .Baterai smartphone cepat habis</p>\r\n<p>4. Berisiko ter-banned</p>\r\n<p>Itulah kerugian dan bahaya yang mengintai para pengguna aplikasi MOD. Jadi, jangan sampai tergiur dengan kelebihan yang dimiliki oleh aplikasi ilegal.Pastikan aplikasi yang terinstal di smartphone Android merupakan aplikasi yang digarap oleh developer resmi yang terpercaya. Ini juga untuk menjaga keamanan data pribadi.\r\n</p>\r\n\r\n', 'N', 'Y', 'Y', 6, '82de71a256bf7694e9405b919530a1e0.jpg', 'Y', '2022-05-15'),
(89, 'Samsung Notes dan S Pen, Kombinasi Cakep untuk Produktivitas dan Kreativitas', 'samsung-notes-dan-s-pen-kombinasi-cakep-untuk-produktivitas-dan-kreativitas', '<p>Samsung baru-baru ini menghadirkan produk terbarunya Galaxy Tab S8 series 5G, yang terdiri dari Galaxy Tab S8 dan S8+, serta kehadiran perdana Tab S8 Ultra. Galaxy Tab S8 series 5G menawarkan kebebasan dan fleksibilitas yang pantas didapatkan pengguna saat bekerja dan bermain di manapun yang belum pernah terwujud sebelumnya.</p>\r\n\r\n<p>Menariknya, di Galaxy Tab S8 ini sudah tersematkan aplikasi Samsung Notes, yang memiliki keunggulan yang bukan sekedar aplikasi catatan biasa. S Notes punya banyak kelebihan yang bisa dieksplorasi dan didukung fitur yang melimpah.</p>\r\n\r\n<p>Samsung Notes memungkinkan Anda mencatat dan menggambar dengan lebih kreatif. Bukan itu saja, Anda juga bisa membuat catatan dalam bentuk teks, gambar, footnote, rekaman suara dan musik, selain juga bisa berbagi konten. Keunggulan ini makin terasa mantap dengan hadirnya S Pen.</p>\r\n<p>Okezone.com berkesempatan mengupas keunggulan dari S Pen yang sejak lebih dari satu dekade lalu terus berevolusi dan berkembang. Hadir di jajaran tablet terbaru Samsung Galaxy Tab S8 Series 5G, inovasi teknologi pada S Pen kini menghadirkan pengalaman menulis dan menggambar yang semakin alami berkat latensi yang rendah, hanya 2,8 ms, sehingga semakin nyaman digunakan seolah menulis dan menggambar di kertas.</p>\r\n<p>S Pen di Galaxy Tab S8 Series 5G akan memperkaya user experience serta membuat aktivitas bekerja makin smart dan produktif, mulai dari mengerjakan pekerjaan rutin sehari-hari hingga merancang sebuah project besar di kantor.</p>\r\n\r\n<p>Gunakan S Pen untuk mencatat meeting atau kelas online melalui aplikasi Samsung Notes, di mana Anda bisa menambahkan gambar, hyperlink, audio recording, dan mengimpor file PDF, untuk membuat catatan yang lebih kreatif lagi. S Pen ini juga sangat serbaguna. Dengan menggunakan fitur ‘Air Action’, S Pen bisa menjadi shutter kamera, mengontrol slide presentasi, memainkan musik atau film.</p>\r\n\r\n<p>Mencatat juga makin menyenangkan dengan Samsung Notes yang sudah diperbarui di Samsung Galaxy Tab S8 Series 5G. “Aplikasi ini sudah diperkaya dengan fitur-fitur baru sehingga tambah powerful, seperti split view mode & divisible pages, menyimpan web dalam layout aslinya, mengetik dan memberikan tanda dengan tulisan tangan, serta bahkan mengimpor file PDF untuk memudahkan pekerjaan Anda,” kata Annisa Maulina, Product Marketing Manager Mobile Experience, Samsung Electronics Indonesia.\r\nBerikut cara mendorong produktivitas dengan Samsung Notes dan S Pen di Galaxy Tab S8 Series 5G:</p>\r\n\r\n<p>1. Menampilkan Lebih dari Satu Catatan di Satu Layar</p>\r\n<p>Samsung Notes sudah diperkaya dengan fitur baru split view mode & divisible pages yang membuat Anda bisa menampilkan beberapa halaman Notes di satu layar. Dengan cara ini, Anda akan lebih mudah dalam mereview beberapa Notes sekaligus sehingga pekerjaan pun lebih cepat selesai. Misalnya, Anda telah mencatat sejumlah ide project besar di kantor, namun tersebar di beberapa Notes. Anda bisa menampilkannya di satu layar untuk melihat seluruh ide yang ada atau menyatukan ide-ide yang tersebar itu ke dalam satu Notes saja.</p>\r\n<p>2. Menyimpan Halaman Web dalam Layout Utuh</p>\r\n<p>Anda juga dapat memanfaatkan fitur baru lain di Samsung Notes, yaitu Web Clip, yang memungkinkan Anda untuk menyimpan halaman web dalam bentuk dan layout orisinalnya, serta tautan menuju situs halaman web tersebut. Dengan demikian, Anda akan lebih mudah dalam menelusuri informasi dan inspirasi langsung dari sumbernya.</p>\r\n<p>3. Menulis tangan dan mengetik teks di area yang sama</p>\r\n<p>Dengan fitur ini, Anda bisa mengetik ide atau catatan menggunakan keyboard di Samsung Notes. Lalu, masih di halaman yang sama, gunakan S Pen jika perlu memberikan catatan ekstra untuk ketikan tadi. Dengan cara ini, segala catatan Anda bisa dibuat dan ditinjau dengan lebih mudah dan pekerjaan pun lebih cepat selesai.</p>\r\n<p>4. Lampirkan File PDF</p>\r\n<p>Samsung Notes memungkinkan Anda mengimpor file PDF, bahkan membuka beberapa file PDF dalam satu note serta memberikan catatan secara langsung di halaman tersebut. Hal ini akan mempercepat proses pengkajian beberapa dokumen sehingga menghemat waktu dan Anda tidak perlu bolak-balik membuka file.</p>\r\n\r\n<p>Anda bisa mendapatkan tablet ini dengan harga mulai dari Rp9.999.000 untuk Samsung Galaxy Tab S8 (WiFi), Rp12.999.000 untuk Galaxy Tab S8 5G (8GB/128GB), Rp 16.999.000 untuk Galaxy Tab S8+ 5G (8GB/256GB), dan Rp 19.999.000 untuk Galaxy Tab S8 Ultra 5G (12GB/256GB).</p>\r\n\r\n<p>Dapatkan Samsung Galaxy Tab S8 Series 5G dengan penawaran menarik pada periode 1 April – 15 Mei 2022 di Samsung.com/id berupa gratis Keyboard Cover dan tambahan cashback untuk pembelian produk wearables dan aksesoris pilihan.</p>', 'N', 'N', 'N', 6, '0240d9cb270047b97d62c2c4a9c04329.jpg', 'Y', '2022-07-15'),
(90, '5 Cara Mudah Atasi Masalah Instalasi Windows 11, Coba Aja', '5-cara-mudah-atasi-masalah-instalasi-windows-11-coba-aja', '<p>Mengingat sistem operasi Windows 11 dirilis pada Oktober tahun lalu dan masih terbilang baru, kamu bisa saja menemukan beberapa masalah pada saat proses instalasi. Untungnya, beberapa masalah tersebut bisa diatasi dengan mudah.</p>\r\n\r\n<p>Salah satu masalah utama pada proses instalasi Windows 11 adalah persyaratan spesifikasi yang lumayan ketat. Sistem operasi baru ini membutuhkan prosesor modern yang kemungkinan harus dibeli setelah tahun 2018. </p>\r\n<p>Apa saja masalah lain yang biasa dihadapi dalam instalasi Windows 11? Berikut penjelasan dan cara penyelesaiannya. </p>\r\n<p>1. Masalah instalasi Windows 11</p>\r\n<p>Langkah pertama yang bisa kamu lakukan ketika menghadapi masalah instalasi adalah menggunakan fitur Troubleshoot bawaan dari Windows. Fitur ini akan mengidentifikasi masalah secara otomatis. Troubleshoot juga bisa mengatur ulang aplikasi Windows Update yang akan membantu memulai instalasi.</p>\r\n\r\n<p>Untuk menggunakan ini, klik menu Start > Setting > Update & Security > Troubleshoot > Windows Update > Run the troubleshooter. Setelah itu ikuti instruksi yang ada dan klik Apply this fix jika troubleshooter berhasil menemukan solusi. </p>\r\n<p>2. Cek persyaratan sistem untuk Windows 11</p>\r\n<p>Untuk menginstal Windows 11, pastikan komputer atau laptop kamu sesuai dengan persyaratan sistem berikut ini:</p>\r\n\r\n<p>Prosesor: 1 gigahertz (GHz)</p>\r\n<p>RAM: 4 GB</p>\r\n<p>Penyimpanan: 64 GB</p>\r\n<p>System Firmware: UEFI, bisa Secure Boot</p>\r\n<p>TPM: Trusted Platform Module 2.0</p>\r\n<p>Graphics Card: DirectX 12 atau lebih baru dari driver WDDM 2.0</p>\r\n<p>Display: 720p, 8-bit per color channel, setidaknya 9 inci diagonal</p>\r\n<p>Koneksi Internet dan Akun Microsoft: Membutuhkan koneksi internet dan akun Microsoft untuk menyelesaikan instalasi.\r\nItu adalah persyaratan minimun untuk instalasi Windows 11. Akan lebih baik jika kamu mempunyai perangkat yang lebih kuat. </p>\r\n\r\n<p>3. Periksa kecocokan Windows 11</p>\r\n<p>Jika perangkat kamu sudah memenuhi persyaratan sistem, kamu perlu melakukan pemeriksaan kesehatan perangkat agar sistem kamu siap untuk menginstal Windows 11.</p>\r\n\r\n<p>Kamu bisa download aplikasi PC Health Check dengan menggunakan link ini aka.ms/GetPCHealthCheckApp.</p>\r\n\r\n<p>Saat sudah berhasil diinstal, klik Check Now pada banner Windows 11. Jika sistem yang kamu punya cocok, maka aplikasi akan menunjukkan \"This PC will run Windows 11\".</p>\r\n<p>4. Kosongkan memori disk</p>\r\n<p>Seperti sistem operasi sebelumnya, Windows 11 memerlukan ruang memori yang cukup untuk berhasil diinstal. Jika hard drive utama kamu hampir penuh, kamu mungkin akan mengalami masalah saat menginstal Windows 11. Memori minimun Windows 11 adalah 64 GB.</p>\r\n\r\n<p>Jadi, hal yang bisa kamu lakukan jika terjadi masalah instalasi adalah mengecek memori yang tersedia di Windows Explorer. Jika memori kamu penuh, kamu bisa mengetik \"Disk Clean-up\" pada kolom pencarian dan pilih sistem disk utama (biasanya C:drive). </p>\r\n<p>5. Nonaktifkan antivirus</p>\r\n<p>Software antivirus tentunya sangat bermanfaat untuk melindungi perangkat. Akan tetapi, ini bisa menjadi penghambat saat proses instalasi Windows 11. Jika kamu mempunyai software antivirus, coba nonaktifkan aplikasi tersebut sebelum melakukan proses instalasi. Kamu bisa mengaktifkan software antivirus kembali saat proses instalasi sudah berhasil.</p> \r\n<p>Di beberapa kasus, kamu mungkin harus menghapus software tersebut untuk sementara. Hal ini untuk memastikan proses instalasi berjalan lancar. </p>\r\n\r\n<p>Demikian beberapa cara yang bisa kamu coba untuk proses instalasi Windows 11 yang lancar. Semoga cara tersebut bermanfaat dan bisa menyelesaikan masalah yang kamu hadapi saat menginstal Windows 11. </p>', 'N', 'N', 'N', 6, '34eb4e9a5f6128a1eaddd97089c1f0f5.png', 'N', '2022-07-18'),
(91, 'Sering Dipertimbangkan Pembeli, Ini Bedanya Fungsi CPU dan GPU di HP', 'sering-dipertimbangkan-pembeli-ini-bedanya-fungsi-cpu-dan-gpu-di-hp', '<p>Apa pertimbanganmu sebelum membeli HP? Sementara banyak yang mengatakan \"kamera\", tidak sedikit pencinta gadget mempertimbangkan spesifikasi jeroannya. Salah satu yang vital adalah central processing unit (CPU) dan graphics processing unit (GPU) pada HP tersebut.</p>\r\n\r\n<p>Sementara sama-sama processing unit dan terletak di bagian System on Chip (SoC) atau chipset, apakah kamu tahu perbedaan antara kedua bagian HP tersebut? Jika belum, inilah perbedaan fungsi CPU dan GPU di HP.</p>\r\n\r\n<p>1. Persamaan antara CPU dan GPU</p>\r\n<p>Jika kamu memiliki komputer atau laptop, kamu mungkin sudah akrab dengan kinerja CPU dan GPU. Kedua bagian ini terdiri dari inti (core) yang terbagi menjadi blok-blok lain. Tiap-tiap blok pada CPU dan GPU bertugas untuk memproses instruksi perangkat.</p>\r\n\r\n<p>Lalu, baik CPU maupun GPU sama-sama memiliki Arithmetic Logic Unit (ALU) yang memproses operasi matematika dalam bentuk aritmatika dan logika sesuai instruksi program. Jika sama-sama memproses instruksi perangkat dan aplikasi, apa yang membedakan kedua bagian ini?</p>\r\n<p>2. Apa itu CPU?</p>\r\n<p>Anggaplah CPU adalah otak dari HP-mu. Dengan ALU, CPU bertanggung jawab mengoperasikan segala perhitungan matematika dan logika agar sistem operasi dan aplikasi bisa berjalan lancar.</p>\r\n\r\n<p>CPU terdiri dari core dan di HP, umumnya CPU memiliki empat sampai delapan core. Dengan core tersebut, perangkat bisa menjalankan lebih dari satu aplikasi dan instruksi secara bersamaan, lebih hemat baterai, dan performa jadi lebih optimal. Tiap core pada CPU HP memiliki clock speed rata-rata 2—3 Gigahertz (GHz).</p>\r\n\r\n<p>Satuan ini mengacu pada 1 miliar rentang siklus per detik pada proses CPU. Sebagai contoh, CPU Kryo pada Qualcomm Snapdragon 8 Gen 1 memiliki kecepatan hingga 3,0 GHz atau mampu menjalankan 3 miliar instruksi per detik. Makin tinggi clock speed CPU, maka makin cepat CPU menjalankan instruksi perangkat.</p>\r\n<p>Selain itu, CPU juga umumnya memiliki tembolok atau cache, memori yang menyimpan instruksi dan data yang digunakan saat ini agar lebih cepat dimuat di masa depan. Di CPU, masing-masing core bisa memiliki cache (atau beberapa core berbagi satu cache) dan cache amat penting agar HP menjalankan aplikasi berulang kali lebih cepat.</p>\r\n\r\n<p>Menurut Android Authority, bukan hanya mengatur memori virtual dari aplikasi, tetapi CPU juga berperan sebagai branch predictor yang memprakirakan data dan instruksi yang kamu butuhkan di nantinya. Fitur branch predictor ini tidak akan ditemukan pada GPU.</p>\r\n<p>3. Apa itu GPU?</p>\r\n<p>Di sisi lain, GPU adalah bagian dari otak HP yang juga bertugas memproses data. Beda dengan CPU yang memang bertugas memproses banyak instruksi, GPU secara spesifik memproses data untuk ditampilkan ke dalam bentuk grafik.</p>\r\n\r\n<p>Tiap core pada GPU didesain memiliki banyak ALU, dan menurut Geeks for Geeks, jumlah ALU pada GPU jauh lebih banyak dibanding CPU. Bukan satu atau dua, GPU bisa mengeksekusi 8 hingga 32 operasi matematika dalam satu waktu. Hal ini penting apabila kamu ingin melihat tampilan layar HP beresolusi tinggi.</p>\r\n\r\n<p>Pemrosesan dalam GPU dikerjakan dalam satu jalur paralel atau yang disebut warp. Dengan kata lain, GPU didesain untuk menjalankan jenis data yang sama bersamaan dalam satu instruksi.\r\nMeski begitu, clock speed pada GPU lebih lambat daripada CPU (biasanya dalam ratusan MHz atau GHz rendah). Selain karena panas dan keterbatasan daya, pemrosesan paralel GPU butuh banyak transistor dibanding CPU. Selain itu, GPU paralel dapat digunakan untuk rendering video, machine learning, hingga menghitung algoritma kriptografi.</p>\r\n\r\n<p>Kembali ke contoh Snapdragon 8 Gen 1, terdapat GPU Adreno 730 dengan clock speed 818 MHz dan ALU berjumlah hingga lebih dari 1.500. Menurut klaim dari Qualcomm, GPU ini 25 persen lebih hemat baterai dan menjalankan proses rendering 50 persen lebih cepat.</p>\r\n<p>4. Kesimpulan</p>\r\n<p>Sebagai kesimpulan, baik CPU dan GPU sama-sama terdiri dari berbagai komponen dan core untuk memproses data dan menjalankan operasi aritmatika dan logika. Bersatu di chipset, kinerja CPU dan GPU beda tetapi saling berpadu.</p>\r\n\r\n<p>Bukan cuma beda nama, CPU dan GPU sudah memiliki perbedaan jelas dalam hal fungsi. Sementara CPU menjalankan instruksi yang memperlancar kinerja sistem operasi dan aplikasi, GPU secara spesifik menjalankan instruksi paralel agar perangkat memiliki tampilan beresolusi tinggi.</p>\r\n\r\n<p>Sampai di sini, apakah kalian sudah paham? Semoga tidak tertukar lagi, ya!</p>\r\n', 'N', 'N', 'N', 6, 'fd505b2eb97a3c390bda8fbbcb5fefe2.jpg', 'Y', '2022-07-15'),
(92, 'Pakar: Face Recognition Butuh Cek Lapangan, Tak Boleh Langsung Percaya ', 'pakar-face-recognition-butuh-cek-lapangan-tak-boleh-langsung-percaya', '<p>Jakarta, CNN Indonesia -- Pakar Ilmu Komputer Universitas Padjadjaran (Unpad) Setiawan Hadi menyebut kepolisian terlalu dini mengungkap identitas terduga pelaku pengeroyokan Ade Armando yang diketahui menggunakan teknologi face recognition.</p>\r\n<p>Ade Armando, Ketua Pergerakan Indonesia untuk Semua (PIS), dikeroyok sekelompok orang dalam aksi demo di Kompleks Gedung DPR-RI, Senin (11/4). Sejumlah orang kemudian ditetapkan sebagai tersangka lewat teknologi pengenalan wajah namun kemudian diralat polisi.</p>\r\n\r\n<p>\"Iya polisi terlalu dini [menyimpulkan hasil identifikasi face recognition]. Mungkin tekanan dari masyarakat ingin tahu siapa sih [pelakunya],\" ujar Setiawan kepada CNNIndonesia.com, Kamis (14/4).</p>\r\n\r\n<p>Pakar IT yang juga fokus pada Artificial Intelligent (AI) itu mengatakan bagi orang yang berkecimpung di citra digital pasti tak akan langsung percaya pada gambar yang beredar di media sosial, karena bisa dimanipulasi.</p>\r\n\r\n<p>Ia menjelaskan seharusnya kepolisian tak langsung mempercayai mesin atau face recognition untuk mengungkap terduga pelaku pengeroyokan.</p>\r\n\r\n<p>Dia menyarankan melakukan verifikasi sebelum mengungkap indentitas terduga pelaku ke publik meskipun berasal dari data base biometrik kepolisian.\r\n\"Perlu check and recheck dan enggak boleh langsung di-publish. Kalau di-publish kan polisi lain langsung action, nah ini enggak boleh langsung percaya,\" ujarnya.</p>\r\n\r\n<p>Setiawan menjelaskan identifikasi wajah menggunakan teknologi face recognition terbilang cepat, hanya dalam hitungan jam.</p>\r\n\r\n<p>Hal itu lantaran kecanggihan algoritma yang diajarkan untuk memahami wajah manusia, berdasarkan database yang bentuk wajah manusia.</p>\r\n\r\n<p>\"Soal cepet sih dua sampai tiga jam bisa dapat [identitasnya]. Tapi bener tidaknya itu perlu ada orang yang memeriksa,\" kata Setiawan.</p>\r\n\r\n<p>Polisi menggunakan metode face recognition untuk mengidentifikasi para pelaku pemukulan dan pengeroyokan Ade.</p>', 'N', 'N', 'N', 6, '3ed6a6e01abd16deb1a29def64408f2a.jpg', 'Y', '2022-07-15'),
(93, '3 Smartphone Terbaru Honor yang Rilis April 2022, Buruan Upgrade!', '3-smartphone-terbaru-honor-yang-rilis-april-2022-buruan-upgrade', '<p>Sebagai salah satu brand smartphone yang cukup produktif, tentu Honor memiliki berbagai varian smartphone terbaru yang rilis setiap bulannya. Hal ini merupakan salah satu upaya dari Honor untuk melakukan persaingan dengan jajaran produk buatan kompetitornya. Sehingga, dengan melakukan inovasi produk, Honor bisa menjadi salah satu brand yang ikut bersaing dengan kompetitif.</p>\r\n\r\n<p>Untuk kalian yang berencana ingin membeli smartphone atau upgrade smartphone di bulan April 2022, maka salah satu dari kelima rekomendasi smartphone Honor di bawah ini dapat dijadikan pilihan yang sangat tepat. Apa saja rekomendasinya? Langsung simak ulasan di bawah ini, yuk!</p>\r\n\r\n<p>1. Honor Magic4 Pro</p>\r\n<p>Hadir di segmen high-end, smartphone yang rilis pada, Sabtu (9/4/2022), ini mengusung penggunaan chipset berbasis Snapdragon 8 Gen 1. Tak hanya itu saja, smartphone ini juga memiliki dukungan sistem operasi terbaru berupa Android 12 yang dipadukan dengan antarmuka Magic UI 6.</p>\r\n\r\n<p>Sebagai salah satu dukungan fitur yang cukup inovatif, Honor Magic4 Pro hadir dengan dukungan quad kamera yang dipadukan dengan teknologi TOF 3D. Tak ketinggalan, quad kamera pada smartphone ini juga mendukung format perekaman video 4K.</p>\r\n\r\n<p>Untuk spesifikasi, Honor Magic4 Pro memiliki dukungan dapur pacu berupa:</p>\r\n\r\n<p>Prosesor: Octa-core (1x3.00 GHz Cortex-X2 & 3x2.40 GHz Cortex-A710 & 4x1.70 GHz Cortex-A510);</p>\r\n<p>RAM: 8/12GB;   </p>\r\n<p>Memori internal: 256/512GB;</p>\r\n<p>Kamera depan: dual 12MP+TOF 3D;</p>\r\n<p>Kamera belakang: quad camera </p>50+50+64MP+TOF 3D;</p>\r\n<p>Baterai: 4600 mAh;</p>\r\n<p>Untuk harganya, Honor Magic4 Pro dibanderol sekitar Rp17,1 juta.</p>\r\n<p>2. Honor Magic4 Ultimate</p>\r\n<p>Masih di segmen high-end, smartphone ini adalah varian paling unggul di jajaran Honor Magic4 series. Hadir dengan konfigurasi layar berpanel LTPO OLED yang memiliki refresh rate sebesar 120 Hz, Honor Magic4 Ultimate sangat cocok untuk aktivitas multimedia seperti gaming.</p>\r\n\r\n<p>Untuk menunjang produktivitas saat menggunakan smartphone ini, Honor Magic4 Ultimate hadir dengan dukungan memori RAM berkapasitas besar sehingga sangat cocok untuk aktivitas multitasking. Kemudian, sebagai ciri khas smartphone masa kini, Honor Magic4 Ultimate hadir dengan dukungan sistem operasi Android 12 dengan user interface Magic UI 6.</p>\r\n\r\n<p>Untuk soal dapur pacu, Honor Magic4 Ultimate memiliki dukungan spesifikasi berupa:</p>\r\n\r\n<p>Prosesor: Octa-core (1x3.00 GHz Cortex-X2 & 3x2.40 GHz Cortex-A710 & 4x1.70 GHz Cortex-A510);</p>\r\n<p>RAM: 12GB;   </p>    \r\n<p>Memori internal: 512GB;</p>\r\n<p>Kamera depan: dual 12MP+TOF 3D;</p>\r\n<p>Kamera belakang: penta camera 50+64+64+50MP+TOF 3D;</p>\r\n<p>Baterai: 4600 mAh;</p>\r\n<p>Untuk harganya, Honor Magic4 Ultimate dibanderol sekitar Rp17,9 juta.</p>\r\n<p>3. Honor X9</p>\r\n<p>Dikabarkan rilis hari ini, Kamis (14/4/2022), smartphone ini tergolong di segmen mid-end dengan konfigurasi chipset berbasis Snapdragon 680 4G. Hadir dengan dukungan memori RAM berkapsitas lega, smartphone ini sangat cocok untuk kebutuhan multitasking.</p>\r\n<p>Sebagai salah satu hal yang cukup menarik, Honor X9 dibanderol dengan harga yang cukup terjangkau jika menimbang dari aspek spesifikasi yang dibawakan. Sehingga dari aspek tersebut, Honor X9 merupakan pilihan bijak yang cukup worth it bagi kita yang memiliki budget terbatas.</p>\r\n<p>Untuk konfigurasi teknis, Honor X9 memiliki spesifikasi berupa:</p>\r\n\r\n<p>Prosesor: Octa-core (4x2.4 GHz Kryo 265 Gold & 4x1.9 GHz Kryo 265 Silver);</p>\r\n<p>RAM: 8GB;</p>\r\n<p>Memori internal: 128GB;</p>\r\n<p>Kamera depan: 16MP;</p>\r\n<p>Kamera belakang: quad camera 64+8+2+2MP;</p>\r\n<p>Baterai: 4800 mAh;</p>\r\n<p>Untuk harganya, Honor X9 dibanderol sekitar Rp3,5 juta.</p>\r\n', 'N', 'N', 'N', 6, '9d31cb14ad4ded372c1dd8de3af5ff21.jpg', 'Y', '2022-07-15'),
(94, 'Kemendikbudristek: Perubahan Kurikulum di Indonesia Langkah yang Tepat ', 'kemendikbudristek-perubahan-kurikulum-di-indonesia-langkah-yang-tepat', '<p>Jakarta - Learning loss atau kemunduran secara akademis berkaitan dengan kesenjangan yang berkepanjangan menjadi salah satu tema bahasan dalam diskusi G20 di bidang pendidikan.\r\nSalah satu terobosan yang dilakukan Kementerian Pendidikan, Kebudayaan, Riset, dan Teknologi (Kemendikbudristek) untuk mengatasi learning loss dengan meluncurkan Kurikulum Merdeka pada Februari 2022 lalu.</p>\r\n\r\n<p>Kurikulum baru ini dirancang untuk mengatasi krisis pembelajaran dan pemulihan pembelajaran akibat pandemi COVID-19.</p>\r\n<p>\"Learning loss itu dampaknya sangat luar biasa dan mengembalikan anak-anak ke sekolah itu tidak mudah. Negara perlu memastikan kembali ke sekolah aman,\" ujar Dirjen GTK Kemendikbudristek Iwan Syahril dalam acara Ngopi Sore via Youtube, Kamis (14/4/2022).</p>\r\n\r\n<p>\"Pola yang terlihat itu kita harus penyederhanaan kurikulum. Ke depan kurikulum yang lebih sederhana yang bisa menyesuaikan tumbuh kembang anak dan tantangan zaman. Bisa memberi ruang untuk pengalaman-pengalaman yang mengasah literasi dan numerasi,\" papar Iwan.</p>\r\n\r\n<p>Iwan mengatakan literasi dan numerasi harus menjadi pondasi untuk pembelajaran ke depan. Ia berpendapat ketika seseorang tidak memiliki literasi dan numerasi yang baik akan bisa keteteran sedangkan jika memiliki kemampuan yang baik dapat memunculkan inovasi-inovasi baru.</p>\r\n\r\n<p>Menurut Iwan perubahan kurikulum di Indonesia sudah merupakan langkah yang tepat.</p>\r\n\r\n<p>\"Kita belajar dari berbagai negara, kita udah di jalan yang tepat. Saat kita menghapus ujian nasional sebelum pandemi itu kita udah one step ahead,\" papar Iwan.</p>\r\n\r\n<p>Selain perubahan kurikulum untuk mengatasi learning loss harus sejalan dengan sumber daya manusianya (SDM).</p>\r\n\r\n<p>\"Kita sudah terapkan di platform merdeka belajar dengan guru penggerak. Jadi masalah yang dibutuhkan adalah kemauan belajarnya. Di masa pandemi ini semangat guru-guru Indonesia sangat luar biasa,\" kata Iwan.</p>\r\n\r\n<p>Iwan menjelaskan program sekolah penggerak sendiri berfokus pada paradigma SDMnya.</p>\r\n\r\n<p>\"Kita melihat dari SDM kepala sekolahnya. Kita seleksi kepala sekolah yang bagus-bagus. Jika SDMnya bagus mereka bisa berakselerasi untuk perubahan fundamental sekolahnya,\" jelas Iwan.</p>\r\n\r\n<p>Lebih lanjut selain inovasi kurikulum yang dicetuskan Kemdikbudristek, penyelesaian permasalahan pendidikan diselesaikan lintas sektor berbagai kementerian.</p>\r\n\r\n<p>\"Karena memang fokusnya Mas Menteri yaitu problem solving. Jadi hashtag gotong royong itu memang menjadi senjata kita untuk melompat ke depan,\" kata Iwan.</p>\r\n', 'N', 'N', 'Y', 10, '7e52475cb3641fd4de1b5ca044fdc579.jpeg', 'Y', '2022-05-15'),
(95, 'Siapa Saja yang Dapat Mendaftar KIP Kuliah? Ini Golongannya ', 'siapa-saja-yang-dapat-mendaftar-kip-kuliah-ini-golongannya', '<p>Jakarta - Kartu Indonesia Pintar (KIP) Kuliah termasuk ke dalam program Merdeka Belajar yang berupa beasiswa. KIP Kuliah ini diberikan pemerintah kepada lulusan SMA, SMK, atau sederajat. bantuan ini diperuntukkan kepada pelajar yang kurang mampu secara ekonomi agar dapat melanjutkan pendidikan ke jenjang yang lebih tinggi.</p>\r\n\r\n<p>1. Pembebasan biaya seleksi masuk kuliah baik UTBK ataupun seleksi lainnya yang diajukan masing-masing panitia dan perguruan tinggi untuk siswa pemilik KIP atau yang terdaftar di Data Terpadu Kesejahteraan Sosial (DTKS) Kementerian Sosial RI.</p>\r\n\r\n<p>2. Gratis biaya kuliah. Uang kuliah langsung ditransfer ke universitas.</p>\r\n\r\n<p>3. Bantuan biaya hidup yang terbagi menjadi lima klaster berdasarkan indeks harga di kabupaten/kota perguruan tinggi negeri (PTN) atau perguruan tinggi swasta (PTS).</p>\r\n<p>Siapa yang Boleh Mendaftar KIP Kuliah?\r\nKip Kuliah 2022 diperuntukkan untuk beberapa golongan di bawah ini yaitu:</p>\r\n<p>1. Punya potensi akademik, tetapi berasal dari keluarga miskin atau rentan miskin.</p>\r\n<p>2. Lulus SMA/SMK/sederajat pada tahun berjalan atau dua tahun sebelumnya.</p>\r\n<p>3. Lulus seleksi mahasiswa baru jalur apa saja di PTN atau PTS, dengan prodi yang terakreditasi resmi dan tercatat sistem akreditasi nasional perguruan tinggi.</p>\r\n<p>4. Pemilik Kartu Indonesia Pintar (KIP).</p>\r\n<p>5. Berasal dari keluarga peserta Program Keluarga Harapan (PKH).</p>\r\n<p>6. Berasal dari keluarga pemegang Kartu Keluarga Sejahtera (KKS).</p>\r\n<p>7. Mahasiswa dari panti asuhan atau panti sosial.</p>\r\n<p>8. Berasal dari keluarga yang terdaftar dalam DTKS.</p>\r\n<p>9. Pendapatan kotor gabungan orang tua atau wali maksimal Rp 4 juta per bulan.</p>\r\n<p>10. Pendapatan kotor gabungan orang tua atau wali jika dibagi jumlah anggota keluarga, hasilnya maksimal Rp 750 ribu.</p>\r\n<p>11. Mahasiswa on going yang kembali ikut seleksi jalur SBMPTN 2022/mandiri/lainnya, dapat memenuhi syarat, dan belum pernah dapat KIP Kuliah atau beasiswa lain pada tahun berjalan atau tahun sebelumnya.</p>\r\n<p>Nah itulah kelompok yang mendapatkan KIP Kuliah 2022. Semoga dapat berhasil ya detikers!</p>', 'N', 'N', 'N', 10, '51c7827164815979777beb34a746a1e8.jpeg', 'Y', '2022-07-15'),
(96, 'Kemendikbud Ristek Buka Beasiswa ke 11 Negara bagi Mahasiswa D3-D4 ', 'kemendikbud-ristek-buka-beasiswa-ke-11-negara-bagi-mahasiswa-d3-d4', '<p>Pininta Kasih KOMPAS.com - Kementerian Pendidikan, Kebudayaan, Riset, dan Teknologi (Kemendikbud Ristek) membuka program IISMA (Indonesia International Student Mobility Awards) untuk para mahasiswa vokasi jenjang D3 dan D4. Program yang menjadi salah satu implementasi dari Merdeka Belajar Kampus Merdeka (MBKM) bagi mahasiswa vokasi di Indonesia ini memberikan kesempatan untuk belajar ke luar negeri. Selama satu semester di kampus luar negeri, mahasiswa bisa sekaligus magang di industri yang menjadi mitra kampus tersebut. </p>\r\n\r\n<p>Menteri Pendidikan, Kebudayaan, Riset, dan Teknologi (Mendikbud Ristek) Nadiem Anwar Makarim mengatakan, program ini memfasilitasi mahasiswa vokasi ke perguruan tinggi terkemuka di luar negeri. Baca juga: Uang Saku Di Atas Rp 10 Juta Per Bulan, Daftar 10 Beasiswa S1-S2 Ini Program ini tidak hanya mempersiapkan sumber daya manusia (SDM) yang siap bekerja tetapi akan melahirkan calon-calon pemimpin yang menguatkan posisi Indonesia di panggung dunia. Selain itu, Nadiem menuturkan, program ini juga menjadi cara pemerintah untuk terus menghilangkan sekat-sekat antara pendidikan vokasi dengan industri. “Internasionalisasi pendidikan menjadi keharusan jika kita ingin berperan dan mendapat manfaat dari globalisasi. </p>\r\n\r\n<p>Untuk itu program ini tepat bagi mahasiswa pendidikan vokasi yang kelak akan bekerja di industri-industri terkemuka dunia, baik yang berlokasi di Indonesia maupun di mancanegara,\" katanya saat meluncurkan Program IISMA Edisi Vokasi Tahun 2022 secara virtual. Baca juga: Tanpa Hukuman, Ini Cara Sukses BPK Penabur Latih Kedisiplinan Siswa Ada 11 negara yang bisa dipilih mahasiswa, di antaranya: Inggris Jerman Prancis Australia Amerika Serikat Turki Malaysia Singapura Taiwan Korea Selatan Irlandia. Selama satu semester, mahasiswa bisa merasakan belajar ke luar negeri melalui tiga skema studi antara lain: </p>\r\n<p>1. Program pengalaman industrial </p>\r\n<p>2. Pembelajaran industrial berbasis kelas dan pengalaman industri </p>\r\n<p>3. Pembelajaran industrial berbasis kelas  </p><p>Untuk kuota, Direktur Akademik Pendidikan Tinggi Vokasi Kemendikbudristek, Benny Bandanadjaja mengatakan ada 400 mahasiswa vokasi yang dapat menerima beasiswa tersebut. </p>\r\n<p>\"Untuk tahun 2022, Program IISMA Edisi Vokasi kuota yang tersedia sebanyak 400 peserta,\" jelasnya.</p>\r\n<p> Benny mengatakan, program IISMA Edisi Vokasi terbuka bagi semua mahasiswa vokasi baik itu D3 maupun D4. Baik mahasiswa vokasi dari dari perguruan tinggi negeri atau swasta di Indonesia dapat mengikuti program tersebut. Ia mengatakan, lebih dari 100 perguruan tinggi vokasi di Indonesia telah siap mendaftarkan mahasiswanya untuk bergabung ke program IISMA Vokasi. Syarat pendaftaran IISMA Vokasi 2022 </p>\r\n<p>1. Warga Negara Indonesia </p>\r\n<p>2. Mahasiswa aktif D3 (semester 4) atau Mahasiswa D4 (semester 4 dan 6) </p>\r\n<p>3. IPK minimal 3,0 dari skala 4,0 dan dibuktikan dengan transkrip </p>\r\n<p>4. Memiliki kemampuan berbahasa Inggris dengan melampirkan: TOEFL iBT: 70 TOEIC: 560 IELTS: 5,5 Duolingo: 85 </p>\r\n<p>5. Pendaftaran dilakukan secara online</p>\r\n<p> Jadwal pendaftaran IISMA Vokasi 2022 </p><p>Registrasi PIC/KUI (kantor urusan </p>internasional) PTPPV ke situs IISMA: 14-30 April 2022 </p>\r\n<p>Mahasiswa melakukan pendaftaran ke laman IISMA: 1-14 Mei 2022</p>\r\n<p>Verifikasi internal oleh PIC PTPPV: 14-21 Mei 2022 </p>\r\n<p>Nominasi penerima oleh PTPPV: 14-21 Mei 2022 </p>\r\n<p>Seleksi administrasi: 22-24 Mei 2022 </p><p>Pengumuman seleksi wawancara: 25 Mei 2022 </p>\r\n<p>Pelaksanaan seleksi wawancara: 27-28 Mei 2022 </p>\r\n<p>Pengumuman: 31 Mei-3 Juni 2022 </p>\r\n<p>Penetapan penerima: 3-4 Juni 2022 </p>\r\n<p>IISMA dan PTPPV melakukan koordinasi prakeberangkatan: 3-6 Juni 2022 </p>\r\n<p>Keberangkatan: 1 Agustus-Desember 2022 </p>\r\n<p>Monev dan laporan studi oleh mahasiswa: Desember 2022 </p>\r\n<p>Rekognisi angka kredit: Desember 2022 </p>\r\n<p>Laporan hasil kegiatan oleh PTPPV ke IISMA: Desember 2022</p>', 'Y', 'Y', 'Y', 10, '4c2e5cbe6f4c1e4fb1f9b763a0cb79ac.jpg', 'Y', '2022-07-15'),
(97, 'Stroke Ringan, Apa Bisa Sembuh Total? ', 'stroke-ringan-apa-bisa-sembuh-total', '<p>KOMPAS.com - Saat mendapati diagnosis stroke ringan, banyak penderita dan orang terdekat yang khawatir, apakah penyakitnya bisa sembuh total? Perlu diketahui, gejala stroke ringan yang dirasakan pengidapnya biasanya berupa sakit kepala berdenyut tiba-tiba dan parah, lengan dan kaki terasa lemas, dan badan tiba-tiba roboh ke lantai.</p>\r\n<p>Kondisi yang sekilas tak berbeda dari gejala stroke biasa ini terlihat mengkhawatirkan. Pasalnya, banyak di antara penderita stroke yang mengalami cacat permanen setelah sembuh dari serangan penyakit ini. Untuk menjawab pertanyaan sekaligus kekhawatiran di atas, simak penjelasan berikut ini.</p>\r\n\r\n<p>Stroke ringan umumnya bisa sembuh total, asalkan penderita segera diberikan bantuan medis yang tepat, dievaluasi dokter, dan penderita konsisten menjalani gaya hidup. Dilansir dari MedicineNet, penyebab stroke ringan biasanya karena ada penyumbatan atau kebocoran pembuluh darah arteri di otak. Pada stroke ringan, gangguan pada pembuluh darah di otak bisa segera pulih, sehingga kerusakan sel-sel otak relatif sedikit jika dibandingkan dengan serangan stroke biasa. </p>\r\n<p>Lain halnya dengan stroke biasa, penyumbatan dan kebocoran pembuluh darah cenderung parah. Imbasnya, sel-sel otak rusak cukup parah dan kerusakannya bisa permanen. Dengan kondisi tersebut, stroke biasa jamak susah sembuh total meskipun penderita selamat dari serangan yang mengancam nyawa ini.</p>\r\n\r\n<p>Meskipun stroke ringan bisa sembuh total dalam waktu relatif singkat, tapi setiap penderita perlu segera memeriksakan diri ke rumah sakit. Dilansir dari Harvard Health Publishing, setiap penderita baik stroke ringan maupun stroke biasa bakal diberikan penanganan medis dari dokter untuk mengatasi masalah kesehatan ini. Cara mengatasi stroke baisanya dengan segera memberikan obat penghancur pembekuan darah, jika penyebab stroke berasal dari pembekuan darah. Obat ini paling efektif diberikan dalam rentang waktu maksimal tiga jam sejak gejala stroke ringan atau stroke biasa muncul. Setelah jeda waktu tersebut, obat kurang efektif dan proses pemulihan penyakit ini jadi lebih susah karena kerusakan otak sudah cukup parah. </p>\r\n<p>Stroke ringan bisa sembuh total tapi tidak boleh diabaikan karena penyakit ini meningkatkan risiko penderita terkena serangan stroke berat. Sekitar sepertiga penderita stroke ringan mengalami serangan stroke berat dalam waktu setahun.</p>', 'N', 'N', 'N', 9, '3dc37634922f8674ad76d487b9cbbd02.jpg', 'Y', '2022-07-15'),
(98, 'Bisakah Penyakit Jantung Koroner Disembuhkan? ', 'bisakah-penyakit-jantung-koroner-disembuhkan', '<p>KOMPAS.com - Penyakit jantung koroner adalah penyebab utama kematian di seluruh dunia. Salah satu pemicu terjadinya penyakit jantung koroner adalah penyumbatan di arteri jantung, yang disebut dengan aterosklerosis. Kabar buruhnya, belum ada obat untuk penyakit ini. Kita juga tidak bisa membalikan keadaan ketika didiagnosis penyakit ini. Namun, kita bisa mengurangi komplikasi lebih lanjut dengan melakukan perubahan gaya hidup.</p>\r\n\r\n<p>Pengobatan jantung koroner Menurut data Cleveland Clinic, ada banyak obat-obatan yang membantu mengurangi kolesterol jahat. Seperti yang kita ketahui, kolesterol jahat adalah penyebab umum penyumbatan di arteri jantung. Namun, masih belum ditemukan obat untuk penyakit jantung koroner. Cara terbaik untuk mengatasi jantung koroner adalah dengan mencegahnya. Sebab, otot jantung tidak dapat tumbuh kembali setelah rusak. Menurut ahli jantung Steven Nissen, menyeimbangkan tekanan darah dan kolesterol adalah cara terbaik untuk mencegah serangan jantung, yang merupakan komplikasi dari jantung koroner. \"Namun, saat serangan jantung terjadi dan otot jantung mati, kita tidak dapat meregenerasi sel-sel itu,\" tambahnya. \"Bentuk lain dari penyakit jantung, penyakit katup, juga dapat memiliki konsekuensi yang tidak dapat diperbaiki,\" tambah Nissen. Saat katup jantung menjadi kaku dan terkalsifikasi, tidak ada cara untuk mengembalikan fleksibilitas katup. \"Satu-satunya cara adalah dengan memperbaiki katup atau menggantinya,\" ucapnya.</p>\r\n\r\n<p>Cara mencegah penyakit jantung Ada beberapa cara yang bisa kita lakukan untuk mencegah penyakit jantung. </p>\r\n<p>Berikut cara tersebut:</p>\r\n\r\n<p>1. Kontrol tekanan darah Anda </p>\r\n<p>Tekanan darah tinggi merupakan faktor risiko utama penyakit jantung. Penting untuk memeriksakan tekanan darah secara teratur, setidaknya setahun sekali. Umumnya, tekanan darah ideal biasanya dianggap antara 90/60mmHg dan 120/80mmHg. Tekanan darah dianggap tinggi ketika hasil pemeriksaan berkisar 140/90mmHg atau lebih tinggi.</p>\r\n\r\n<p>2. Jaga kadar kolesterol dan trigliserida </p>\r\n<p>Kadar kolesterol yang tinggi dapat menyumbat arteri dan meningkatkan risiko penyakit arteri koroner dan serangan jantung. Perubahan gaya hidup dan obat-obatan (jika diperlukan) dapat menurunkan kolesterol Anda. Trigliserida adalah jenis lemak lain dalam darah. Kadar trigliserida yang tinggi juga dapat meningkatkan risiko penyakit arteri koroner, terutama pada wanita.</p>\r\n\r\n<p>3. Kontrol berat badan </p>\r\n<p>Kelebihan berat badan atau obesitas dapat meningkatkan risiko penyakit jantung. Kondisi ini sebagian besar karena mereka terkait dengan faktor risiko penyakit jantung lainnya, termasuk kadar kolesterol dan trigliserida darah tinggi, tekanan darah tinggi, dan diabetes. Menjaga berat badan tetap ideal dapat menurunkan risiko ini.</p>\r\n', 'N', 'N', 'Y', 9, '5d9d2c4128243ac963cf5c9390802a18.jpg', 'Y', '2022-05-15'),
(99, 'Puasa Bisa Meningkatkan Imun Tubuh berkat Regenerasi Sel', 'puasa-bisa-meningkatkan-imun-tubuh-berkat-regenerasi-sel', '<p>Selama bulan Ramadan, umat Islam diwajibkan untuk melakukan puasa dari terbitnya matahari hingga terbenam sembari tetap menjalankan aktivitasnya seperti biasa. Bagi sebagian orang, ini bisa terdengar ekstrem dan membahayakan. Akan tetapi, puasa nyatanya memiliki banyak manfaat, termasuk untuk sistem imun.</p>\r\n<p>Apa hubungan antara puasa dan imunitas tubuh? Merujuk penelitian dalam jurnal Frontiers in Nutrition tahun 202, berikut penjelasannya.</p>\r\n\r\n<p>1. Memicu produksi sel darah putih</p>\r\n<p>Menurut penelitian tersebut, berpuasa minimal selama tiga hari akan memicu tubuh untuk memproduksi sel darah putih baru yang akan memperkuat kekebalan tubuh dalam melawan infeksi.</p>\r\n\r\n<p>Peristiwa ini bisa terjadi karena berpuasa akan memaksa tubuh mengonsumsi cadangan lemak dan glukosa, dan sebagian besar sel darah putih akan dipecah. Alhasil, proses ini menyebabkan perubahan dalam tubuh yang memicu sel induk untuk meregenerasi sel-sel baru dalam sistem kekebalan tubuh. </p>\r\n<p>2. Bisa mencegah infeksi COVID-19</p>\r\n<p>Mekanisme utama virus penyebab COVID-19 dalam menyerang tubuh adalah melalui inflamasi badai sitokin atau kondisi respons imun tubuh yang berlebihan. </p>\r\n\r\n<p>Dalam penelitian tersebut, puasa Ramadan yang dilakukan oleh orang sehat menunjukkan dampak yang lebih sedikit terhadap stres oksidatif dan inflamasi.</p>\r\n\r\n<p>Walaupun begitu, para ahli mengingatkan untuk selalu menghindari aktivitas yang berpotensi menyebabkan penularan COVID-19 serta selalu menjaga kebersihan. Bagi yang memiliki penyakit bawaan, sebaiknya berkonsultasi dengan dokter terlebih dahulu sebelum melakukan puasa. </p>\r\n\r\n<p>3. Berolahraga saat puasa bisa meningkatkan imun tubuh</p>\r\n<p>Olahraga saat puasa tentunya menjadi tantangan yang berat untuk dilakukan. Akan tetapi, tidak berolahraga sama sekali malah bisa menurunkan daya tahan tubuh, lo! Hal ini bisa terjadi karena adanya adaptasi kardiovaskular dan resistansi saat berolahraga.</p>\r\n\r\n<p>Selain itu, orang yang berpuasa dan tetap berolahraga menunjukkan adanya peningkatan dalam konsentrasi plasma IL-6, serum CRP, imunoglobulin A dan G, serta antioksidan non-enzimatik. </p>\r\n\r\n<p>Jadi, usahakan untuk tetap berolahraga saat berpuasa untuk mempertahankan kekebalan tubuh. Olahraga bisa dilakukan pada pagi hari atau 1 jam setelah berbuka. Tak perlu olahraga berat, olahraga ringan seperti jalan kaki atau yoga bila dilakukan secara rutin tentu akan mendatangkan kebaikan bagi tubuh. </p>', 'Y', 'N', 'N', 9, 'fd850bbc502f0d5fa1b395005fbdcd33.png', 'Y', '2022-07-15'),
(100, 'New MacBook Pro 13-inch spotted with 10th-generation Ice Lake', 'new-macbook-pro-13-inch-spotted-with-10th-generation-ice-lake', '<p>It looks like Apple has plans to give the MacBook Pro 13-inch a \r\nconsiderable power boost in 2020. And, it’s about darn time, especially \r\nsince 8th-generation Intel Core processors are aging at this point, \r\nespecially on a premium laptop.</p><p>A <a href=\"https://twitter.com/_rogame/status/1228636786517270529?s=20\" target=\"_blank\" class=\"hawk-link-parsed\"><u>3DMark Time Spy benchmark</u></a>, recently leaked by <a href=\"https://twitter.com/_rogame\" target=\"_blank\" class=\"hawk-link-parsed\"><u>@_rogame</u></a>\r\n on Twitter, shows a new 13-inch MacBook Pro boasting marked performance\r\n improvements over 2019’s second highest configuration. If you’re not \r\nfamiliar with this serial leaker, he was responsible for uncovering a <a href=\"https://www.reddit.com/r/Amd/comments/dvq3xx/16_macbook_pro_with_an_rx_5500m_8gb/\" target=\"_blank\" class=\"hawk-link-parsed\"><u>Geekbench 4 benchmark</u></a>\r\n of the 16-inch MacBook Pro boasting the Radeon 5500M graphics card \r\nbefore it came out. So, you know this is coming from a reliable source.</p><aside class=\"hawk-widget\" data-render-type=\"fte\" data-widget-type=\"seasonal\"></aside><p>The\r\n unreleased 13-inch MacBook Pro model is fitted with an Intel Core \r\ni7-1068NG7 processor with a 2.3GHz base clock, Turbo Boost up to 4.1GHz \r\nclocks and a TDP of 28W. Based on an <a href=\"https://twitter.com/_rogame/status/1228628173509857280?s=20\" target=\"_blank\" class=\"hawk-link-parsed\"><u>earlier tweet</u></a>, it also boasts 32GB of memory and 2TB of storage (SSD).</p><p>It’s worth noting that the i7-1068NG7 could be a variant of the i7-1068G7.</p>', 'Y', 'N', 'N', 6, 'f4fb052d0586fdd3ce07605855bfee5f.jpg', 'Y', '2022-07-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `submenu`
--

CREATE TABLE `submenu` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `sub_title` varchar(50) NOT NULL,
  `sub_url` varchar(50) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `submenu`
--

INSERT INTO `submenu` (`id`, `id_menu`, `sub_title`, `sub_url`, `is_active`) VALUES
(1, 1, 'Identitas Web', 'admin/identity', 'Y'),
(2, 1, 'Kontak', 'admin/contact', 'Y'),
(3, 2, 'Menu Utama', 'admin/menu', 'Y'),
(4, 2, 'Sub Menu', 'admin/submenu', 'Y'),
(5, 3, 'Kategori', 'admin/category', 'Y'),
(6, 3, 'Posting', 'admin/posting', 'Y'),
(7, 4, 'Album', 'admin/album', 'N'),
(8, 4, 'Gallery Foto', 'admin/gallery', 'N'),
(10, 4, 'Banner', 'admin/banner', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$QUM2OeQCZclQqJIhZKKMt.Aq8dA3Y7eIzjtXsyr.xuE0kDjfj8SLS', 'admin@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1658152630, 1, 'Garsans', 'News', NULL, '0123456789');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(39, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `identity`
--
ALTER TABLE `identity`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `posting`
--
ALTER TABLE `posting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indeks untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `identity`
--
ALTER TABLE `identity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `posting`
--
ALTER TABLE `posting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
