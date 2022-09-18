public with sharing class ShowroomController {
    public String showroomId{get;set;}
    public Showroom__c showroomObj{get;set;}

    public ShowroomController(){
        showroomObj = new Showroom__c();
        
    }
    @AuraEnabled (cacheable=true)
        public static List<Showroom__c> getShowroom(String  accountId){
        
       return [
            SELECT Showroom_Name__c, Id
            FROM Showroom__c
            WHERE Account__c = :accountId
            ORDER BY Showroom_Name__c
            ];
    }
}
