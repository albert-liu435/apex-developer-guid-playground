@IsTest
private  class StringServiceTest {
    // public StringServiceTest() {

    // }


     static testMethod void testAbbreviate1() {
        Test.startTest();
        String s = 'Hello Maximillian';
         //返回'Hello...
        String s2=StringService.abbreviate(s, 8);
        //         String s = 'Hello Maximillian';
        // String s2 = s.abbreviate(8);
        System.assertEquals('Hello...', s2);
        System.assertEquals(8, s2.length());

        test.stopTest();

     }


      static testMethod void capitalize() {
         String s = 'hello maximillian';
         String s2 = s.capitalize();
         System.assertEquals('Hello maximillian', s2);
     }





//     static testMethod void testMethod1() {
//         Test.startTest();
//         data_warehouse_account_c__x dwa = new data_warehouse_account_c__x(
//             name__c='TestAcc1',
//             account_phone__c='13112345678'
//         );
//         data_warehouse_account_c__x dwa2 = new data_warehouse_account_c__x(
//             name__c='TestAcc2',
//             account_phone__c='13112345678'
//         );
//         ExternalRequestModel.dwalist.add(dwa);
//         ExternalRequestModel.dwalist.add(dwa2);
//         System.debug(dwa.Id);
//     	A2_VFC_CallCenter.saveHistory('789456123','13185236974',dwa.Id);
//     	A2_VFC_CallCenter.searchAccount('13112345678', '789456123','abc','abc');
//     	test.stopTest();

//     }
//     static testMethod void testMethod2() {
//         Test.startTest();
//         data_warehouse_fans_leads_c__x dwf = new data_warehouse_fans_leads_c__x(
//             leads_name__c='TestLead',
//             phone__c='13198765432'
//         );
//          data_warehouse_fans_leads_c__x dwf2 = new data_warehouse_fans_leads_c__x(
//             leads_name__c='TestLead2',
//             phone__c='13198765432'
//         );
//         ExternalRequestModel.dwflist.add(dwf);
//         ExternalRequestModel.dwflist.add(dwf2);
//         A2_VFC_CallCenter.saveHistory('789456123','13185236974',dwf.Id);
//         A2_VFC_CallCenter.searchAccount('13198765432', '789456123','abc','abc');
//         test.stopTest();

//     }
//     static testMethod void testMethod3() {
//         Test.startTest();
//         List<work_order__c> wolist=CS_TestDataFactory.createWorkOrder(1);
//         insert wolist;
//         A2_VFC_CallCenter.saveHistory('789456123','13185236974',wolist[0].Id);
//         A2_VFC_CallCenter.searchAccount('13185236974', '789456123','abc','abc');
//         test.stopTest();

//     }
//     static testMethod void testMethod4() {
//         insert CS_TestDataFactory.createSystemParameters();
//         Test.startTest();
//         A2_VFC_CallCenter.agentCancle('8101');
//         A2_VFC_CallCenter.searchAccount('', '','abc','abc');
//         test.stopTest();

//     }
// }

}