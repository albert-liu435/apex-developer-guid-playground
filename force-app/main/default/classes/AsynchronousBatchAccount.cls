/**
 * 批处理框架,最多可以执行5000万数据
 * 1.start()方法执行后，数据便无法修改;

2.execute()原则上可以执行多次，比如在调用的时规定执行次数，则按照规定次数执行execute();

3.finish()方法执行以后，批处理类用到的所有的变量对象都会恢复到最开始的状态，即值回滚到最开始状态;

4.如果批处理类不实现Database.Stateful接口，则变量只在相应方法起作用，当方法执行完成，变量则会回滚到初始状态。

eg：在类中声明成员变量A，在start()方法对A进行处理，如果类不实现上述接口，则方法执行完start()方法后A会回滚到初始状态，在execute()方法或者finish()方法调用A时值为最开始声明的值，在start方法的处理结果不保留。
执行语句如下：

Database.executeBatch(new BatchAccount(0));
//分两个批次进行执行
Database.executeBatch(new BatchAccount(0),2);
 */
global with sharing class AsynchronousBatchAccount implements Database.Batchable<sObject>{

    Integer queryCount = 0;
    
    public AsynchronousBatchAccount(Integer queryCount){
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