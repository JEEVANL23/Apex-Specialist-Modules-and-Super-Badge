trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> newtask = new List<Task>();
  
    for(Opportunity op:Trigger.New){
        if(op.StageName == 'Closed Won'){
            newtask.add(new Task(Subject = 'Follow Up Test Task', WhatId = op.Id));
       
    	}
    }
    if(newtask.size()>0){
        insert newtask;
    }
}
