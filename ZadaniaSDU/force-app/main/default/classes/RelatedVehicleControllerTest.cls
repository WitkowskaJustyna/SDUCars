@isTest
private with sharing class RelatedVehicleControllerTest {
    @isTest static void getRelatedVehiclesTest1() {

        Account account = TestDataFactory.getAccount();
        insert account;

        Showroom__c showroom1 = TestDataFactory.getShowroom(account, 'Test');
        insert showroom1;

        Vehicle__c vehicle1 = TestDataFactory.getVehicle('testtest');
        Vehicle__c vehicle2 = TestDataFactory.getVehicle('12345678');
        insert vehicle1;
        insert vehicle2;

        Offer__c offer1 = TestDataFactory.getOffer(showroom1, vehicle1, 'virtual');
        Offer__c offer2 = TestDataFactory.getOffer(showroom1, vehicle2, 'virtual');
        insert offer1;
        insert offer2;
       
        String showroom1Id = String.valueOf(showroom1.Id);
        

        Test.startTest();
        List<Offer__c> offers = RelatedVehicleController.getRelatedVehicles(showroom1Id);
        Test.stopTest();

        System.assertEquals(2, offers.size());
    }
    @isTest static void getRelatedVehiclesTest2() {

        Account account = TestDataFactory.getAccount();
        insert account;

        Showroom__c showroom1 = TestDataFactory.getShowroom(account, 'Test1');
        Showroom__c showroom2 = TestDataFactory.getShowroom(account, 'Test2');
        insert showroom1;
        insert showroom2;

        Vehicle__c vehicle1 = TestDataFactory.getVehicle('testtest');
        Vehicle__c vehicle2 = TestDataFactory.getVehicle('12345678');
        Vehicle__c vehicle3 = TestDataFactory.getVehicle('test1234');
        Vehicle__c vehicle4 = TestDataFactory.getVehicle('1234test');
        insert vehicle1;
        insert vehicle2;
        insert vehicle3;
        insert vehicle4;

        Offer__c offer1 = TestDataFactory.getOffer(showroom1, vehicle1, 'virtual');
        Offer__c offer2 = TestDataFactory.getOffer(showroom1, vehicle2, 'physical');
        Offer__c offer3 = TestDataFactory.getOffer(showroom2, vehicle3, 'physical');
        Offer__c offer4 = TestDataFactory.getOffer(showroom2, vehicle4, 'virtual');
        insert offer1;
        insert offer2;
       
        String showroom1Id = String.valueOf(showroom1.Id);
        

        Test.startTest();
        List<Offer__c> offers = RelatedVehicleController.getRelatedVehicles(showroom1Id);
        Test.stopTest();

        System.assertEquals(2, offers.size());
    }
}
