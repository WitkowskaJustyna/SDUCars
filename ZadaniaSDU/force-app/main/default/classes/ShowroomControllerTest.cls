@isTest
private with sharing class ShowroomControllerTest {
    @isTest static void getShowroomTest1() {

        Account account = TestDataFactory.getAccount();
        insert account;

        Showroom__c showroom1 = TestDataFactory.getShowroom(account, 'Test1');
        Showroom__c showroom2 = TestDataFactory.getShowroom(account, 'Test2');
        Showroom__c showroom3 = TestDataFactory.getShowroom(account, 'Test3');
        Showroom__c showroom4 = TestDataFactory.getShowroom(account, 'Test4');
        insert showroom1;
        insert showroom2;
        insert showroom3;
        insert showroom4;

        String accountId = String.valueOf(account.Id);

        Test.startTest();
        List<Showroom__c> showrooms = ShowroomController.getShowroom(accountId);
        Test.stopTest();

        System.assertEquals(4, showrooms.size());

    }
    
     @isTest static void getShowroomTest2() {

        Account account1 = TestDataFactory.getAccount();
        Account account2 = TestDataFactory.getAccount();
        insert account1;
        insert account2;

        Showroom__c showroom1 = TestDataFactory.getShowroom(account1, 'Test1');
        Showroom__c showroom2 = TestDataFactory.getShowroom(account1, 'Test2');
        Showroom__c showroom3 = TestDataFactory.getShowroom(account2, 'Test3');
        Showroom__c showroom4 = TestDataFactory.getShowroom(account2, 'Test4');
        insert showroom1;
        insert showroom2;
        insert showroom3;
        insert showroom4;

        String accountId = String.valueOf(account1.Id);

        Test.startTest();
        List<Showroom__c> showrooms = ShowroomController.getShowroom(accountId);
        Test.stopTest();

        System.assertEquals(2, showrooms.size());
    }
}
