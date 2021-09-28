extends Node2D

export var dialouge = [
	{
		"Nama" : "Ryan",
		"Dialog" : "Jaka, Penerus semangat gatot kaca",
		"State" : "",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Memang Penerus penegak Keadilan selalu sempurna dalam keadaan apapun",
		"State" : "",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Sekalipun waktu telah di gentarkan oleh kekacauan .....",
		"State" : "",
	},
	{
		"Nama" : "",
		"Dialog" : "Ryan Berbalik sambil tersenyum dan mendongkak kepala sejajar dengan pandangannya kearah jaka",
		"State" : "1to2",
	},
	{
		"Nama" : "",
		"Dialog" : "sambil mengangkat tangan kanannya dengan benda corak yang sangat rapi, benda itu sangat terang putih tetapi masih dilihat oleh mata telanjang",
		"State" : "2",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Kamu tetap tangguh ternyata",
		"State" : "2",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : "Ryan menjauhlah dari Jantung Nirvana, Jantung itu milik tanah air pribumi",
		"State" : "2",
	},
	{
		"Nama" : "",
		"Dialog" : "Jaka dengan baju yang banyak sobekan dan wajah serius ia meminta jantung nirvana dengan menjulurkan tangan kanannya tetapi ia tidak berjalan, ia hanya diam",
		"State" : "2",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Bukan jaka, benda ini milik pemenang",
		"State" : "2",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Menurutmu untuk apa sang pencipta membuat pagelaran ini, pagelaran hanya untuk penumpahan darah yang berarti untuk kepuasannya",
		"State" : "2",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : "Walau Begitu Jantung Nirvana tidak perlu digunakan kita harus mengembalikan ketempat semulanya lagi bersama",
		"State" : "2",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Bersama ? Itu tidak mungkin. Kamu pasti tau itu",
		"State" : "3",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Apa lagi dengan kata 'bersama' mu itu. Idealisku sangat berbeda denganmu",
		"State" : "3",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : "Walaupun idealis kita berbeda, ini sudah beda zaman, saat ini kamu bukan ken arok, kamu adalah Ryan",
		"State" : "3",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : "Ryan, Sang pencipta tidak akan memberikan kita semua kesempatan untuk ini. Jantung itu hanya memberi kesengsaraan",
		"State" : "3",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Hanya karena kamu memiliki ingatan dari Leluhur yang pernah memenangkan Pagelaran ini, kamu bisa seenaknya menasihati ku",
		"State" : "3",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : "Aku menasihati mu karena ingatan dari Leluhurku",
		"State" : "3",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Kalau begitu beri tahu aku seperti apa ingatan leluhur mu saat itu",
		"State" : "3",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : ". . . . . . . . .",
		"State" : "3",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : "Aku masih harus ada disini karena aku harus membantu masyarakat pribumi walaupun itu termasuk musuhku",
		"State" : "4",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : "Dan harusnya kamu tau tentang aturan pagelaran ini bukan ?",
		"State" : "4",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Ya aku sangat tau aturan pagelaran ini, malah seluruh peserta tau semua. dan yang paling diingat adalah salah satu aturan itu walau maut datang sekalipun",
		"State" : "4",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : "Ya benar, Peserta Pagelaran tidak boleh mengucapkan nama dan menceritakan ingatan leluhurnya masing-masing hingga ketelinga siapapun termasuk itu hewan",
		"State" : "4",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : "Tetapi Peserta lain boleh menebak leluhurnya dan membagi-bagi informasi tentang leluhurnya yang mereka ketahui",
		"State" : "4",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Jika dilanggar Peserta akan terlempar ke Tegal Penangsaran(seperti neraka), dan ingatan seluruh orang tentang peserta itu akan dihapus termasuk jejak keberadaannya selama masih hidup",
		"State" : "4",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Hingga buku sejarah dunia pun seperti tidak menulis tentang nya, tetapi para peserta masih dapat mengenal dan mengingatnya",
		"State" : "4",
	},
	{
		"Nama" : "",
		"Dialog" : "Ryan tersenyum besar dan ia tertawa sangat besar",
		"State" : "5",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "HAHAHAHA !!!! HIHIHIHI !!!! HAH HAH HAH HAHAHAHA !!!",
		"State" : "5",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "Kamu sangat peduli dengan keberadaan ku sekarang dan masa depan ku juga, tetapi kamu tidak bisa memberikan informasi yang singkat itu kepadaku",
		"State" : "5",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "KATANYA PENEGAK KEADILAN !!! MASAK BAGI NYAWA UNTUK KEADILAN SATU ORANG PRIBUMI SAJA TIDAK BISA ??!!",
		"State" : "5",
	},
	{
		"Nama" : "Jaka",
		"Dialog" : "BERIKAN JANTUNG ITU KEPADA KU RYAN !!!!",
		"State" : "5",
	},
	{
		"Nama" : "Ryan",
		"Dialog" : "LEWATI DULU MAYAT KU DAN IDEALIS KU DASAR BEDEBAH !!",
		"State" : "5",
	},
	{
		"Nama" : "Jaka & Ryan",
		"Dialog" : "HIYYAAHHHH !!!!",
		"State" : "6",
	},
]
