import controlP5.*;
ControlP5 cp5,cp6;

int Suret;
int Limit ;
import hypermedia.net.*; //bu kitabxana vasitəsilə biz UDP protokolu ilə məlumatın qəbulu və ötürülməsi alqoritmlərini qoşuruq       
UDP udp; // UDP tipli dəyişəni elan edirik (sonradan bu dəyişən vasitəsilə biz şəbəkədəki UDP trafikini dinləyəcəyik)
int dragYprev,dragYcurr;
float udplatitude,udplongitude,udpaltfeet,udpik,udptg,udpkren; // udp protokolu vasitəsilə qəbul etdiyimiz dəyişənləri elan edirik
//udplatitude və udplongitude - müvafiq olaraq HGsinin coğrafi enliyi (parallel) və uzunluğudur (meridian)
//udpaltfeet - HG-sinin barometrik hündürlüyüdür (futlarla)
// updik (istinniy kurs - həqiqi kurs)
// udptg - tanqaj bucağıdır
// udpkren - kren bucağıdır

void setup (){
size(520,500);
 

frameRate(1);
cp5 = new ControlP5(this);
cp5.addSlider("Suret").setPosition(475,330).setSize(24,150).setRange(60,450);
cp6 = new ControlP5(this);
cp6.addSlider("Limit").setPosition(475,150).setSize(24,150).setRange(60,450);
udp = new UDP( this, 20514 );  //bu kompyüterdə 20514-cü porta göndərilən məlumatı dinləyən dəyişənə konkret arqumentlər təyin edirik
  //udp.log( true );         // debug loggeri (konsoldakı jurnalı işə salırıq)   
udp.listen( true );           // dinləməni aktiv edirik

}
float a,z;
int w,f;
void draw()
{
 
background(0);
sekkizbucaqlicek();
ic_ice_cevreler();
surupu_cek();
xetlericek();
xetlericek1();
xetlericek2();
xetlericek3();
sirlicevre();
adlariyaz();
reqemleriyaz();
goyduzbucaqicek();
goyduzbucaqli_yaziniyaz();
qalinxetlericek();
dordbucaqlilaricek();
agkavdratlar_yaziyaz();
hereket();
limits();
eqrebcek1();
eqrebcek2 ();
merkezde_cevrecek();
mouseDragged();
}
