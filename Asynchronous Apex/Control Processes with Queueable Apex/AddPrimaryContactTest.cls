@IsTest
public class AddPrimaryContactTest {
    
    static testmethod void testQueueable(){
        List<Account> testAccounts = new List<Account>();
        for(Integer i=0; i<50; i++){
            testAccounts.add(new Account(Name = 'Account' +i, Billingstate='CA'));
        }
        for(Integer j = 0;j<50;j++){
            testAccounts.add(new Account(Name = 'Account' +j, Billingstate='da'));
        }
        insert testAccounts;
        Contact testContact = new Contact(FirstName = 'john', LastName = 'doe');
        
        insert testContact;
        AddprimaryContact addit = new addPrimaryContact(testContact, 'CA');
        Test.startTest();
        system.enqueueJob(addit);
        Test.stopTest();
        
        System.assertEquals(50,[Select count() from Contact where accountId in (Select ID from Account where BillingState ='CA')]);
        
        
    }

}
