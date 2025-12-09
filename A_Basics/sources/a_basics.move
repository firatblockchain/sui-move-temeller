// SuiMove Diline Hoşgeldiniz

module firat_blockchain::a_basics;
// modüller, zincir üzerinde yayınlanınca çağrılabilir hale gelen temel program birimleridir. Tanımı ise şöyledir:
// module [paket_adresi]::[modül_adı];
// paket adresini "Move.toml" dosyasında "[addresses]" kısmından bulabilirsiniz.
// modul_adı ise genelde üstünde çalıştığınız ".move" uzantılı dosyanızın ya da çağırmak istediğiniz dosyanızın ismidir.
// Dikkat edilmesi gereken şey "snake_case" kullanılması gerektiğidir. Yani harflerin hepsi küçük ve boşluklar alt satır ile tanımlanmalı.


use sui::address;
use std::string::String;
// use anahtarı, kontrata dışardan farklı modüllere erişim için kullanılır.
// örneğin yukarıda standart kütüphanede bulunan "String" tipine erişim sağlanır.

//! <--------------------------------------------Temel Tipler------------------------------------------------->

// BAŞLAMADAN ÖNCE
// Move sayılarda 6 adet işaretsiz (unsigned) tam sayı tipini destekler. Bunlar: "u8, u16, u32, u64, u128, u256". (u8 -> 2^8 - 1 bitlik)

// const anahtarı belli bir değeri sabit halde tanımlamak için kullanılır. Değerin atanacağı sabitin ismi büyük harfle başlamalı ve tipi belirtilmeli.
// NOT: Tip belirtileceği zaman genelde "let/const [sabit_adı/değişken_adı]:[tip] = [değer]" kullanılır.  
const Sayi:u8 = 5;

fun temel_tipler(){

    // "let" anahtarı değişkenlere değer atamak için kullanılır.
    // "let" anahtarı tek başına kullanılması durumunda immutable yani değiştirilemez bir sabit tanımlaması yapar.
   
    let x =1;
    //// x=2; hata

    let mut y = 2; // mut anahtarının let ile kullanılması durumunda değişken artık mutable yani değiştirilebilir olur.
    y = 4;
    
    let z:u16 = 1256; // "let" anahtarı kullanılırken de tip belirtmesi yapılabilir. Hatta bunu yapmak çok daha sağlıklı olacaktır.
    // farklı bir yöntem ise -> let z = 1256u16;
    
    //! UYARI: Aritmatik işlemler yaparken değişken tiplerinin aynı olması ve sonuçta tanımlanacak değerin de aynı tipte olması gerekir.
    let w:u16 = y+z; // yukarıda y'nin tanımı yapılırken tip belirtilmemiştir fakat z belirtilmiştir. Bu tür durumlarda derleyici en yüksek tipi belirler ve ona uygun tür atamasını kendisi yapar.
    
    // "as" anahtarı kullanarak tam sayılarda tipler arasında geçiş sağlanır.
    let sayi1: u8= 255;
    let sayi2: u8= 255;
    let sayi3: u16 = (sayi1 as u16) + (sayi2 as u16);
   
    // Bool değerleri true ve false olmak üzere iki değere sahiptir ve genelde kontrol mekanizmalarında çokça kullanılır.
    // Bool değerleri mantıksal operatörler kullanarakta tanımlanabilir.
    let mut _bool = true; 
    let value = 1<2 && 2<5;

    // Metin verilerini temsilen "string" tipi kullanılır. Bu tipi kullanmak için use std::string::String tanımını yapmak gereklidir.
    let _string: String= b"FiratBlockchain".to_string();

    //! Uyarı: Kullanılmayan değişkenler derleme esnasında uyarı verir. Fakat uyarılar kodun derlenmesini engellemez. Kullanılmayan değişkenlerden kaynaklı uyarıları değişken adı yanına "_" eklenerek atlatılabilir.

    // ADRES TİPİ
    // Move, adresleri temsil etmek için "address" adında bir tür kullanır. Bu, blok zincirindeki herhangi bir adresi temsil edebilen 32 baytlık bir değerdir. 
    // Adresler iki biçimde yazılabilir: 0x önekine sahip HEXA_DECIMAL adresler ve adlandırılmış adresler.
    // Move, modül paketlerini birbirinden ayırmak için adresleri kullanır. Her bir paket, kendi adresine ve içinde tanımlı modüllere sahiptir.
    // Ayrıca bu adresler SUI'de nesneleri ve hesapları temsil etmek için de kullanılır.

    let _adres: address = @0xA; // bu adres 0x ön ekinden sonra son biti A olacak şekilde 0'larla doldurulmuş bir adresi temsil eder.
                                // 0x000000000000000000000000000000000000000000000000000000000000000A

    // Türlerin daha farklı kullanımları ve tanımlamaları ilerleyen bölümlerde karşınıza çıkacaktır.
}

public fun basit_alistirmalar(): String{
    let a_sayisi = 250u64; // u64 tipinde tanımlanmış 250 değeri.
    let b_sayisi = 1u128; // u128 tipinde tanımlanmış 1 değeri.

    let mut toplam:u128= (a_sayisi as u128) + b_sayisi; // a_sayisi'ni, b_sayisini'n tipine çevirip toplana.

    let c_sayisi: u16 = 12;  //u16 tipinde tanımlanmış 12 değeri.

    let dogru_sonuc= toplam > (c_sayisi  as u128) ; //Sonuç: dogru_sonuc = true

    let yeni_toplam = toplam.to_string(); // Tamsayıyı string'e çevirme.

    let adres = @0xFEDCBA; // 0x0000000000000000000000000000000000000000000000000000000000FEDCBA

    let adres_yeni:u256 = address::to_u256(@0x2); 
    let adres_2 = address::from_u256(adres_yeni); 

    let adres_string: String = address::to_string(@0x1); // Adresi string tipine çevirmek.

    yeni_toplam
}

// Buradan sonrası test'lerde kullanılmak ve incelemeniz için yazılmıştır. Testlere ve fonkisyonları ilerleyen zamanlarda detaylı göreceksiniz.
// Terminale "sui move test" yazmanız durumunda "[debug]çıktı" olarak sonuçları görebilirsiniz.
public fun tam_sayi_degeri():u32{
    let tam_sayi = 12u8;
    let tam_sayi_2: u32= 2_345_789;

    ((tam_sayi as u32) + tam_sayi_2)
}

public fun adres_deger(): address {
    let adres = @0xFBC;
    adres
}

public fun adres_deger_u256(): u256 {
    let adres:u256 = address::to_u256(@0xFBC); 
    adres
}

public fun string_deger(): String{
    let string = b"FIRAT Blockchain".to_string();
    string
}

public fun bool_degeri(): bool{
    let a= 23;
    let b= 43;

    let true_degeri= true;
    let bool_degeri= (a < b) == true_degeri;

    bool_degeri
}

#[test_only]
use std::debug::print;


#[test]
fun basit_alistirmalar_test(){
    let test = basit_alistirmalar();
    print(&test);
}

#[test]
fun bool_testi(){
    let test = bool_degeri();
    print(&test)
}

#[test]
fun string_testi(){
    let test = string_deger();
    print(&test);
}

#[test]
fun adres_testi(){
    let test= adres_deger();
    print(&test);
}

#[test]
fun tam_sayi_testi(){
    let test = tam_sayi_degeri();
    print(&test);
}

#[test]
fun adres_deger_u256_test(){
    let test = adres_deger_u256();
    print(&test);
}