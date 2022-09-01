/**
 * https://www.cnblogs.com/zero-zyq/p/5287343.html
 * @Future注解的方法必须是静态方法
 * 返回值类型必须为void
 * 方法参数必须是primitive data types
 * 
 * 　1）future方法执行不保证质量，如果需要好的质量可以使用Queueable方法；

　　2）可以允许两个future方法同时运行，当两个future方法同时对一条记录进行操作时，可能引起记录锁定或者运行时异常。
 * 
 */
public with sharing class AsynchronousFuture {
    public AsynchronousFuture() {

    }

     @future
    public static void futuremethod(List<ID> ids) {
        String sql = 'select Id,Name from Account where Id in :ids';
        List<Account> accounts = Database.query(sql);
        for(Account account : accounts) {
            System.debug(account.Id);
        }
    }
}
