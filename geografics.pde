
public float sin2(float s) {
  // sine squared
  return pow(sin(s),2.0);
}

public float deg2rad(float deg) {
  // convert degrees to radians
  return deg*(PI/180.0);
}

/**
 * Calculate distance between two points in latitude and longitude taking
 * into account height difference. If you are not interested in height
 * difference pass 0.0. Uses Haversine method as its base.
 * 
 * lat1, lon1 Start point lat2, lon2 End point el1 Start altitude in meters
 * el2 End altitude in meters
 * @returns Distance in Meters
 */

public float haversine(float lat1, float lon1, 
                            float lat2, float lon2) 
    { 
        
        int R = 6378; // kilometres
        // convert to radians 
        lat1 = radians(lat1); 
        lat2 = radians(lat2); 
        
        // distance between latitudes and longitudes 
        float dLat = lat2 - lat1; 
        float dLon = radians(lon2 - lon1); 

float a = sin(dLat/2) * sin(dLat/2) +
          cos(lat1) * cos(lat2) *
          sin(dLon/2) * sin(dLon/2);
float c = (2 * atan2(sqrt(a), sqrt(1-a)));

return  R * c; // in kilometres
    } 
    
    public float bearingInDeg(float lat1, float lon1, 
                            float lat2, float lon2) 
    { 
        float dLon = radians(lon2 - lon1);
        float y = sin(dLon) * cos(radians(lat2));
        float x = cos(radians(lat1))*sin(radians(lat2)) - sin(radians(lat1))*cos(radians(lat2))*cos(dLon);
        return (float)(degrees(atan2(y,x)));
    } 


public float calc_kmperpixels(float latid,float longid)
{
  float radcurrlon=latid;
  float radcurrlat=longid;
  float lon = latid+1;
  float lat = longid+1;
  float distance=haversine(radcurrlat,radcurrlon,lat,lon)/300;
 return distance;
}

public float calc_speed(float latid,float longid, float prevlatid, float prevlongid,float timestamp)
{
  float speed=1943844.492*haversine(latid,longid,prevlatid,prevlongid)/(millis()-timestamp);//1 km/sec = 1943.844492 knots 
 return speed;
}

/**
* Calculates the end-point from a given source at a given range (meters)
* and bearing (degrees). This methods uses simple geometry equations to
* calculate the end-point.
* 
* @param point
*           Point of origin
* @param range
*           Range in meters
* @param bearing
*           Bearing in degrees
* @return End-point from the source given the desired range and bearing.
*/

public static class PointF
{
    public float x; //Latitude;
    public float y; //Longitude;
    
    PointF(float latit, float longit)
    {
      x=latit;
      y=longit;      
    }

}

public static PointF calculateDerivedPosition(PointF point,
            float range, float bearing)
    {
        float EarthRadius = 6378; // m

        float latA = radians(point.x);
        float lonA = radians(point.y);
        float angularDistance = range / EarthRadius;
        float trueCourse = radians(bearing);

        float lat = asin(
                sin(latA) * cos(angularDistance) +
                        cos(latA) * sin(angularDistance)
                        * cos(trueCourse));

        float dlon = atan2(
                sin(trueCourse) * sin(angularDistance)
                        * cos(latA),
                cos(angularDistance) - sin(latA) * sin(lat));

        float lon = ((lonA + dlon + PI) % (PI * 2)) - PI;

        lat = degrees(lat);
        lon = degrees(lon);

        PointF newPoint = new PointF((float) lat, (float) lon);

        return newPoint;

    }
    
       
        public static boolean pointIsInCircle(PointF pointForCheck, PointF center,
            float radius) {
        if (getDistanceBetweenTwoPoints(pointForCheck, center) <= radius)
            return true;
        else
            return false;
    }

public static float getDistanceBetweenTwoPoints(PointF p1, PointF p2) {
        float R = 6378137; // m
        float dLat = radians(p2.x - p1.x);
        float dLon = radians(p2.y - p1.y);
        float lat1 = radians(p1.x);
        float lat2 = radians(p2.x);

        float a = sin(dLat / 2) * sin(dLat / 2) + sin(dLon / 2)
                * sin(dLon / 2) * cos(lat1) * cos(lat2);
        float c = 2 * atan2(sqrt(a), sqrt(1 - a));
        float d = R * c;

        return d;
    }
