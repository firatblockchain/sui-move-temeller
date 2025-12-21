module firat::key_store;
use std::string::String;

public struct EssizTopluluk has key, store{ // key ve store, yeteneklerine sahip EssizTopluluk isminde bir struct.
    id:UID, // Eşsizliğin tanımı olarak UID tipini id'ye veriliyor.
    isim: String,
    uye_sayisi: u8
}

public struct EssizOgrenci has key, store{
    id: UID,
    isim: String,
    topluluk: vector<EssizTopluluk> //! Vectör tipi ilerleye aşamalarda görülecek.
}

public fun yeni_essiz_topluluk(ctx: &mut TxContext, isim: String, uye_sayisi:u8):EssizTopluluk{
    EssizTopluluk{
        id: object::new(ctx),
        isim,
        uye_sayisi
    } 
    
    // EssizTopluluk key yeteneğine sahip olduğu için fonksiyonda döndürüyoruz yoksa drop hatası alınır çünkü key yeteneğine sahip structlarda drop yeteneği olmayan tipler vardır.
    // Burada ise UID tipindeki id drop yeteneğine sahip değilder. O yüzden direkt olarak kullanılması gerekiyor. İlerleyen aşamalarda bunun için
    // kullanılan freeze, transfer (sui kütüphanesinden alınan) gibi fonksiyonlar kullanarak bu drop hatalarını gidermeyi öğreneceksiniz.
    // Test ederek nasıl göründüğünü inceleyebilirsiniz. (CLI komutu = sui move test [test fonksiyonun ismi])
}

public fun yeni_essiz_uye(ctx: &mut TxContext, isim:String, topluluk: vector<EssizTopluluk>):EssizOgrenci{
    EssizOgrenci{
        id: object::new(ctx),
        isim,
        topluluk
    }
}

#[test_only]
const ADMIN: address= @0xAD;

#[test_only]
use sui::test_scenario;

#[test_only]
use std::debug::print;

#[test]
fun test_topluluk_olusturma() { //! (sui move test test_topluluk_olusturma)
    let mut scenario_val = test_scenario::begin(ADMIN);
    let scenario = &mut scenario_val;
        
    {
        let topluluk = yeni_essiz_topluluk(scenario.ctx(), b"Yazilim Toplulugu".to_string(), 50);
        print(&topluluk);
        transfer::public_transfer(topluluk, @0xAD);
    };

    test_scenario::next_tx(scenario, ADMIN);
    {
        assert!(test_scenario::has_most_recent_for_sender<EssizTopluluk>(scenario), 0);
    };

    test_scenario::end(scenario_val);
}

#[test]
fun test_ogrenci_olusturma() {
    let mut senaryo_deger = test_scenario::begin(ADMIN);
    let senaryo = &mut senaryo_deger;

    let topluluk_1 = yeni_essiz_topluluk(
        senaryo.ctx(), 
        b"Firat Blockchain".to_string(), 
        10
    );

    let mut topluluklar = vector::empty<EssizTopluluk>();
    vector::push_back(&mut topluluklar, topluluk_1);

    let ogrenci = yeni_essiz_uye(
        senaryo.ctx(), 
        b"MSIEZDMEUESYMBD".to_string(), 
        topluluklar
    );
    print(&ogrenci);

    transfer::public_transfer(ogrenci, ADMIN);

    test_scenario::next_tx(senaryo, ADMIN);
    {
        assert!(test_scenario::has_most_recent_for_sender<EssizOgrenci>(senaryo), 1);
    };
    test_scenario::end(senaryo_deger);
}




