trigger AccountRecordUpdate on Account (after update) {
    
    if(Trigger.isUpdate || Trigger.isAfter) {
        //Call Handler
        AccountRecordUpdateHandler.onAfterUpdate(Trigger.new, Trigger.oldMap);
    } 

}