/* 
 * Simplify data-driven processes 
 * Using the Einstein Analytics Apex SDK
 * 
 * Dreamforce '17
 *  
 * Nils Rosen <nr@qkom.de>
 * Dominic Ley <dl@qkom.de>
 */

public class AnalyticsConnector{  
    @auraEnabled
    public static void queryAmountAccount(Id caseId){
        Id accountId = [SELECT Id, AccountId FROM Case WHERE Id =:caseId][0].AccountId;
        
        Wave.ProjectionNode[] prn = new Wave.ProjectionNode[]{
            Wave.QueryBuilder.get('Amount').sum().alias('sum_amount')
        };

        String query = Wave.QueryBuilder.load('0Fb0Y000000TQOzSAO','0Fc0Y000000FMcGSAW')
            .filter('\'AccountId\' == "' + String.valueOf(accountId) + '"')	
        	.foreach(prn)
            .build('q');

        ConnectApi.LiteralJson result = ConnectApi.Wave.executeQuery(query);
        
  		List<Object> ql = AnalyticsHelper.parseResponse(result.json);
        Decimal amount = (Decimal)AnalyticsHelper.parseField(ql[0],'sum_amount');

        AnalyticsConnector.updateCase(caseId, amount);
    }
    
    /* you can't save a record in the same execution context after executing a query */
    @future 
    public static void updateCase(Id caseId, Decimal amount){
        Case c = new Case();
        c.Id = caseId;
        c.ExpectedAmountAccount__c = amount;
        upsert(c);
    }
}
