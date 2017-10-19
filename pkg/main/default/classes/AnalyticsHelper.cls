/*
 * Simplify data-driven processes
 * Using the Einstein Analytics Apex SDK
 *
 * Dreamforce '17
 *
 * Nils Rosen <nr@qkom.de>
 * Dominic Ley <dl@qkom.de>
 */

public class AnalyticsHelper{
  public static object parseField(object fieldData, String fieldName){
    return ((Map<String,Object>)JSON.deserializeUntyped(JSON.serialize(fieldData))).get(fieldName);
  }

  public static List<Object> parseResponse(String response){
    Map<String,Object> q = (Map<String,Object>)JSON.deserializeUntyped(response).get('results');
    //q = (Map<String,Object>)q.get('results');
    return (List<Object>)q.get('records');
  }
}
