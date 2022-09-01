@isTest
private class AsynchronousQueueableSampleTest {
    static testMethod void myUnitTest() {
        Test.startTest();
        List<ID> ids= new ID[]{'0012800000Hz6ozAAB','0012800000Hz6oxAAB'};
        AsynchronousQueueableSample sample = new AsynchronousQueueableSample(ids);
        ID jobID = System.enqueueJob(sample);
        Test.stopTest();
    }
}