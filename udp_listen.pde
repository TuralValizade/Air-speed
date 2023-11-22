
float prevudplatitude,prevudplongitude;

int udpgear,udpflaps;
int interval=1000;
boolean udpfreeze;
float time_stamp,alt_stamp,ik_stamp,ralt_stamp,vs,turnRate,vsralt,groundspeed;
// groundspeed vasitəsilə cari hərəkət sürətimizi təyin edirik

private String bytesToHex(byte[] data) {
  char[] hexArray = "0123456789ABCDEF".toCharArray();
  char[] hexChars = new char[data.length * 2];
  for ( int j = 0; j < data.length; j++ ) {
    int v = data[j] & 0xFF;
    hexChars[j * 2] = hexArray[v >>> 4];
    hexChars[j * 2 + 1] = hexArray[v & 0x0F];
  }
  return new String(hexChars);
}

float get4bytesFloatOffset(byte[] data, int offset) {
  String hexint=hex(data[offset+3])+hex(data[offset+2])+hex(data[offset+1])+hex(data[offset]);
  return Float.intBitsToFloat(unhex(hexint));
}

float get2bytesFloatOffset(byte[] data, int offset) {
  String hexint=hex(data[offset+1])+hex(data[offset]);
  return Float.intBitsToFloat(unhex(hexint));
}

float get4bytesFloat(byte[] data) {
  String hexint=hex(data[3])+hex(data[2])+hex(data[1])+hex(data[0]);
  return Float.intBitsToFloat(unhex(hexint));
}

int getHistFloat(byte[] data) {
  String hexint=hex(data[1])+hex(data[0])+hex(data[3])+hex(data[2]);
  int Hist = round(0.000022916405 *(unhex(hexint))- 0.000007637796);
  return Hist;
}

float getTGFloat(byte[] data) {
  String hexint=hex(data[1])+hex(data[0])+hex(data[3])+hex(data[2]);
  float TG = 0.0000000104774 *(unhex(hexint));
  return TG;
}

float getKRENFloat(byte[] data) {
  String hexint=hex(data[1])+hex(data[0])+hex(data[3])+hex(data[2]);
  float KREN = 0.0000000419095 *(unhex(hexint));
  return KREN;
}

float getIKFloat(byte[] data) {
  String hexint=hex(data[1])+hex(data[0]);
  float IK = 0.010986328125 *(unhex(hexint));
  return IK;
}

int getGEARFloat(byte[] data) {
  String hexint=hex(data[1])+hex(data[0]);
  int GEAR = round(0.002747  *(unhex(hexint))+0.0005);
  return GEAR;
}

int getFLAPSFloat(byte[] data) {
  String hexint=hex(data[1])+hex(data[0]);
  int FLAPS = round(0.0014  *(unhex(hexint))+0.0002);
  return FLAPS;
}

float getVS(float altitude) {
  return (60*1000000/interval*(altitude-alt_stamp)/(millis()-time_stamp));
}

float getTurnRate(float ik) {
  return (1000000/interval*(ik-ik_stamp)/(millis()-time_stamp));//per second
}

float getClosureRateToTerrain(float altitude) {
  return (60*1000000/interval*(altitude-ralt_stamp)/(millis()-time_stamp));
}

boolean getFreeze(byte[] data) {
  String hexint=hex(data[1])+hex(data[0]);
  if (unhex(hexint)==0)
  {
   return false; 
  }
  else
  {
    return true;
  }
}

double get8bytesDouble(byte[] data) {
  long longData = 0;
for (int i = 0 ; i < 8 ; i++) {
  longData <<= 8;
  longData += (data[i] & 0x00ff);
}
  return Double.longBitsToDouble(longData);
}

float get2bytesFloat(byte[] data) {
  String hexint=hex(data[1])+hex(data[0]);
  return Float.intBitsToFloat(unhex(hexint));
}

void receive( byte[] data ) {          
       
        if (
        (data.length == 368)// əgər qəbul olunan məlumatın həcmi 368 baytdırsa 
        )
                    {
                        byte[] fi = new byte[8];// latitude üçün 8 bayt ayırırıq
                        byte[] la = new byte[8];// longitude üçün 8 bayt ayırırıq
                        //byte[] il76freeze = new byte[2];// freeze marker by il76
                        byte[] Hist1 = new byte[4];// истинная высота from aeroport level 30 000 m
                        //byte[] TG1 = new byte[4];// Pitch - тангаж
                        //byte[] KREN1 = new byte[4];// Roll - крен
                        byte[] IK = new byte[2];// True Heading
                        byte[] GEAR = new byte[2];// GEAR
                        byte[] FLAPS = new byte[2];// FLAPS
                      
                        arrayCopy(data, 300, fi, 0, 8);
                        arrayCopy(data, 308, la, 0, 8); // longitude
                        //arrayCopy(data, 46, il76freeze, 0, 2); // freeze - do not delete
                        arrayCopy(data, 78, Hist1, 0, 4); // hist1
                        //arrayCopy(data, 170, TG1, 0, 4); // TG1
                        //arrayCopy(data, 174, KREN1, 0, 4); // KREN1
                        arrayCopy(data, 202, IK, 0, 2); // IK
                        arrayCopy(data, 326, GEAR, 0, 2); // GEAR
                        arrayCopy(data, 336, FLAPS, 0, 2); // KURS1
                        fi=reverse(fi);
                        la=reverse(la);
                        //il76freeze=reverse(il76freeze);// freeze - do not delete
                        udplatitude = (float)get8bytesDouble(fi);
                        udplongitude = (float)get8bytesDouble(la);
                        udpaltfeet = getHistFloat(Hist1);
                        udpik = getIKFloat(IK);
                        //udptg = getTGFloat(TG1);
                        //udpkren = getKRENFloat(KREN1);
                        udpgear = getGEARFloat(GEAR);
                        udpflaps = getFLAPSFloat(FLAPS);
                        //udpfreeze = getFreeze(il76freeze);
                        if ((millis()-time_stamp)>=interval)
                        {
                        vs = getVS(udpaltfeet);
                        //turnRate=getTurnRate(udpik);
 //                       vsralt = getClosureRateToTerrain(RAlt);
                        groundspeed = calc_speed(udplatitude,udplongitude,prevudplatitude,prevudplongitude,time_stamp);
                        alt_stamp=udpaltfeet;
                        //ik_stamp=udpik;
 //                       ralt_stamp=RAlt;
                        prevudplatitude = udplatitude;
                        prevudplongitude = udplongitude;
                        time_stamp=millis();
                        }
                                                //println("Hist:"+udpaltfeet);//Hist1 = BitConverter.GetBytes( (Hist1);
                                                println("Suret:"+groundspeed);
                                                Suret = (int)groundspeed;
                                               
                                                
                        //println("Udpik-ik_stamp:"+(udpik-ik_stamp));
                        //println("GEAR:"+udpgear);
                        //println("FLAPS:"+udpflaps);
                       //println("latitude:"+udplatitude);//reverse(Hist1, 0, Hist1.Length);// Hist
                        //println("longitude:"+udplongitude);//reverse(TG1, 0, TG1.Length);// Hist
                        //println("freeze:"+udpfreeze);
                        //println("TG:"+udptg);
                        /*println("KREN:"+udpkren);
                        println("IK:"+udpik);
                        println("GEAR:"+udpgear);
                        println("FLAPS:"+udpflaps);
                        println("Hist:"+udpaltfeet);//Hist1 = BitConverter.GetBytes( (Hist1);
                        println("VS:"+vs);
                        println("Groundspeed:"+groundspeed);
                        println("TurnRate:"+turnRate);*/
                    }
                    //println("4:"+millis());
}
