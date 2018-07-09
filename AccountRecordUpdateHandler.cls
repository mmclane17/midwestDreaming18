public class AccountRecordUpdateHandler {

    public static void onAfterUpdate(List <Account> accts, Map <Id, Account> oldMap) {
		//Call Helper
        AccountRecordUpdateHelper.actRecordUpdate (accts, oldMap);
    }
}