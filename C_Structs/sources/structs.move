module firat::c_structs;

use std::string::String;

// Struct'lar, farklı tiplerdeki verileri tek bir mantıksal birimde gruplanmasına olanak tanıyan özel veri tipleridir.
// Bir struct tanımı yaparken => " public struct [struct_ismi] has [drop/key/store/copy] " şeklinde bir kullanım vardır.
// Burada has anahtarı ile kullanılan 4 farklı abilitiy (yetenek) vardır.
// Copy: Struct'ın kopyalanabilmesini sağlar. 
// Drop: Struct'ın bir fonksiyon veya kapsam sonunda kayıp edilmesini sağlar. Yani drop özelleğine sahip bir struct'ın her zaman açıkça kullanılmasına ya da transfer edilmesine gerek yoktur.
// Store: Struct'ın zincir üzerinde (on-chain) kalıcı olarak saklanmasına veya başka bir 'store' yapı içinde alan (field) olmasına izin verir.
// Key: Struct'ın SUI Nesnesi (Object) olmasını, zincirde benzersiz bir ID (UID) taşımasını ve adresler arasında transfer edilebilir olmasını belirtir.


//! NOT: Şuana kadar yapılan işlemleri çoğunu fonksiyon içerisinde yapıldı çünkü move için gerekli bir syntax. Burada önemli olan sadece konunun
//! mantığını anlayabilmek. Fonksiyondaki "return"ler test aşaması için kullanıyor.

public struct Topluluk has drop{ // Drop olduğu için açıkça kullanılmasına veya transfer edilmesine gerek yoktur.
    isim: String, 
    uye_sayisi: u128,
    aktiflik: bool, // bool tipi atanmış bir eleman
}

public fun firat_blockchain_topluluk(): Topluluk{
    let firat_blockchain:Topluluk = Topluluk{ // Struct'lar kullanılacağı zaman içinde bulundurduğu bütün elemanlar yazılmalıdır.
        isim:b"FIRAT Blockchain".to_string(),
        uye_sayisi: 350,
        aktiflik:true,
    };

    // Bu örnekteki gibi "Topluluk" struct'ı aslında bir veri tipine bürünmüştür. 
    // Tanımlama yapılırken özel olarak tip belirtmesine gerek yoktur. Daha net gözükmesi için burada tip belirtilmiştir.

    firat_blockchain
}

public fun yeni_topluluk(isim: String, uye_sayisi: u128, aktiflik:bool): Topluluk{
    Topluluk{
        isim,
        uye_sayisi,
        aktiflik
    }
}

#[test_only]
use std::debug::print;

#[test]
fun firat_blockchain_topluluk_test(){
    let firat_blockchain_test = firat_blockchain_topluluk();
    print(&firat_blockchain_test); // struct çıktısı
    print(&firat_blockchain_test.isim); // struct'ın isim çıktısı
    print(&firat_blockchain_test.uye_sayisi); // struct'ın uye_sayisi çıktısı
    print(&firat_blockchain_test.aktiflik); // struct'ın aktiflik çıktısı
}

#[test]
fun yeni_topluluk_test(){
    let yeni_topluluk_test = yeni_topluluk(b"X Topluluk".to_string(),256,false);
    print(&yeni_topluluk_test);
}
