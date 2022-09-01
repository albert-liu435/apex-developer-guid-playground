@isTest
public with sharing class AsynchronousFutureTest {
    public AsynchronousFutureTest() {

    }

    static testMethod void myUnitTest() {
        Test.startTest();
        List<ID> ids= new ID[]{'0012800000Hz6ozAAB','0012800000Hz6oxAAB'};
        AsynchronousFuture.futuremethod(ids);
        Test.stopTest();
    }





// @isTest static void test1() {
//         User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
//        // System.runAs() allows mixed DML operations in test context
//         System.runAs(thisUser) {
//             // startTest/stopTest block to run future method synchronously
//             Test.startTest();        
//             MixedDMLFuture.useFutureMethod();
//             Test.stopTest();
//         }
//         // The future method will run after Test.stopTest();
    
//         // Verify account is inserted
//         Account[] accts = [SELECT Id from Account WHERE Name='Acme'];
//         System.assertEquals(1, accts.size());
//         // Verify user is inserted
//         User[] users = [SELECT Id from User where username='mruiz@awcomputing.com'];
//         System.assertEquals(1, users.size());
//     }




}