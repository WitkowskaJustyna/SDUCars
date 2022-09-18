@isTest
private with sharing class AccountControllerTest {
    @isTest static void getAccountsTest1() {

        Account account1 = TestDataFactory.getAccount();
        Account account2 = TestDataFactory.getAccount();
        Account account3 = TestDataFactory.getAccount();
        insert account1;
        insert account2;
        insert account3;

        Test.startTest();
        List<Account> accounts = AccountController.getAccounts();
        Test.stopTest();

        System.assertEquals(3, accounts.size());

    }
    @isTest static void getAccountsTest2() {

        Account account1 = TestDataFactory.getAccount();
        insert account1;
        
        Test.startTest();
        List<Account> accounts = AccountController.getAccounts();
        Test.stopTest();

        System.assertEquals(1, accounts.size());

    }
}
