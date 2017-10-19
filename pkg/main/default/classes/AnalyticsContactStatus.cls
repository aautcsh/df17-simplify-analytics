public class AnalyticsContactStatus {
    @InvocableMethod(label='Insert Accounts' description='Inserts the accounts specified and returns the IDs of the new accounts.')
    public static Boolean[] isActive(String[] srcIds){
        Contact[] cn = [SELECT Id, UnitId__c FROM Contact WHERE Id IN :srcIds];
        Boolean[] isAct = new List<Boolean>();

        String query = 'q = load "0Fb0Y000000kEa1SAE/0Fc0Y000000n4lHSAQ";\nq = filter q by \'power_consumption_aggregation_1min_statement_1_cputime_value\' > 0;\nq = foreach q generate toDate((substr(\'time_searchReplace\', 1, 10) + \"T\") + substr(\'time_searchReplace\', 12, 8), \"yyyy-MM-ddTHH:mm:ss\") as \'Timestamp\', sum(\'power_consumption_aggregation_1min_statement_1_inputs_value\') as \'Powerconsumption\';\nq = order q by \'Timestamp\' asc;\nq = limit q 2000;';     
		//ToDo: Neue query,,,Query bei vortrag live
        ConnectApi.LiteralJson result = ConnectApi.Wave.executeQuery(query);
        List<Object> ql = AnalyticsHelper.parseResponse(result.json);

        for(Integer i = 0; i<cn.size(); i++){
            isAct.add((Integer)AnalyticsHelper.parseField(ql[i],'Powerconsumption')>50);
        }
        saveAccounts(srcIds, isAct);
        return isAct;
    }
    
    @future
    public static void saveAccounts(String[] srcIds, Boolean[] isAct){
        Contact[] cn = [SELECT Id, UnitId__c FROM Contact WHERE Id IN :srcIds];
        for(Integer i = 0; i<cn.size(); i++){
            cn[i].isActive__c = isAct[i];
        }
        upsert(cn);
    }

}
