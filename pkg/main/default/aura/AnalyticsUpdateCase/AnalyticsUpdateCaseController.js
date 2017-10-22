({
  "queryAmount" : function(cmp) {
    var action = cmp.get("c.queryAmountAccount");
    
    action.setParams({
      caseId : cmp.get("v.recordId")
    });
    
    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        alert("Update initialized");
      }
      else if (state === "ERROR") {
        var errors = response.getError();
        if (errors) {
          if (errors[0] && errors[0].message) {
            console.log("Error message: " + 
              errors[0].message);
          }
        } 
        else {
          console.log("Unknown error");
        }
      }
    });
    $A.enqueueAction(action);
  }
})
