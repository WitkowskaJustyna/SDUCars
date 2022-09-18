public with sharing class RelatedVehicleController {
    @AuraEnabled (cacheable=true)
    public static List<Offer__c> getRelatedVehicles(String  showroomId){
        
       return [
            SELECT Id, Showroom__c, Brand__c, Model__c
            FROM Offer__c
            WHERE Showroom__c = :showroomId 
            
            ];
    }
}
