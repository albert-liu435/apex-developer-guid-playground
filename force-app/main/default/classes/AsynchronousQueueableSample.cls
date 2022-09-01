public with sharing class AsynchronousQueueableSample implements Queueable{
     
    private List<ID> ids{get;set;}
     
    public QueueableSample(List<ID> ids) {
        this.ids = ids;
    }
     
    public void execute(QueueableContext qc) {
        String sql = 'select Id,Name from Account where Id in :ids';
        List<Account> accounts = Database.query(sql);
        for(Account account : accounts) {
            System.debug(account.Id);
        }
    }
}