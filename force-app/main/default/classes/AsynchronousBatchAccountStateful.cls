/**
 * 
 * 可以通过如下执行方法返回相关的信息
 * ID batchprocessid = Database.executeBatch(new BatchAccountStateful(0),10);

AsyncApexJob aaj = [SELECT Id, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors 
                    FROM AsyncApexJob WHERE ID =: batchprocessid ];
 * 
 * 
 * 
 */

global with sharing class AsynchronousBatchAccountStateful implements Database.Batchable<sObject>,Database.Stateful{
     Integer queryCount = 0;
    
    public AsynchronousBatchAccountStateful(Integer queryCount){
        this.queryCount=queryCount;
    }

    public Database.QueryLocator start(Database.BatchableContext BC){
          return Database.getQueryLocator([select Id,name from Account]);
    }

    public void execute(Database.BatchableContext BC, List<Account> scope){
        for(Account account : scope){
            account.Name=account.Name;
            queryCount++;
            System.debug('过程数据为：'+queryCount);
        }
        update scope;
    }

    public void finish(Database.BatchableContext BC){
        //如果不实现Database.Stateful接口，则queryCount为0。因为在execute执行完成便会回滚到初始状态
        System.debug('最终的数据为：'+queryCount);

        //完成之后进行邮件发送
        // Get the ID of the AsyncApexJob representing this batch job
        // from Database.BatchableContext.
        // Query the AsyncApexJob object to retrieve the current job's information.
        //  AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
        //     TotalJobItems, CreatedBy.Email
        //     FROM AsyncApexJob WHERE Id =
        //     :BC.getJobId()];
        // // Send an email to the Apex job's submitter notifying of job completion.
        // Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // String[] toAddresses = new String[] {a.CreatedBy.Email};
        // mail.setToAddresses(toAddresses);
        // mail.setSubject('Apex Sharing Recalculation ' + a.Status);
        // mail.setPlainTextBody
        // ('The batch Apex job processed ' + a.TotalJobItems +
        //     ' batches with '+ a.NumberOfErrors + ' failures.');
        // Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}
