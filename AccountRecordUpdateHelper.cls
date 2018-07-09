public class AccountRecordUpdateHelper {
    
    public static void actRecordUpdate (List <Account> accts, Map <Id, Account> oldMap) {
        //List of Platform Events to Publish
        List <Event_Status__e> events = new List <Event_Status__e>();
        
        //Loop through Updated Accounts
        for(Account act : accts) {
            
            //Check if value has changed
            if (act.Number_of_Speakers__c != oldMap.get(act.Id).Number_of_Speakers__c) {
                
                //Create new Platform Event
                Event_Status__e evt = new Event_Status__e();
                
                //Variables
                Decimal actNumSpeakers = act.Number_of_Speakers__c;
                String actId = act.Account_Identification__c;
               
                evt.Account_Identification__c = actId;
                evt.Number_of_Speakers__c = actNumSpeakers;
                events.add(evt);   
            }
        }
        //Publish Platform Events
        List<Database.SaveResult> results = EventBus.publish(events);
    }
}