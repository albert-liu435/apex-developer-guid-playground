@isTest
private  class PickListValuesUtilTest {



    static testMethod void getPicklistValues() {
        Test.startTest();
        // List<ID> ids= new ID[]{'0012800000Hz6ozAAB','0012800000Hz6oxAAB'};
        // QueueableSample sample = new QueueableSample(ids);
        // ID jobID = System.enqueueJob(sample);
        Map<String,object> educationValues = PickListValuesUtil.getPicklistValues('Student__c','Education__c');
        System.debug(educationValues);
        Test.stopTest();
    }

}