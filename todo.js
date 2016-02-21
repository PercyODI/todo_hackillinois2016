function newTask(addBeforeElem) {
    var newTaskTextField;

    function newTaskTextFieldFinished() {
        //Remove TaskTextField
        newTaskTextField.fadeOut("fast", function() {
            if(newTaskTextField.val() != "") {
                addBeforeElem.before("<li>" + newTaskTextField.val() + "</li>");
            }
            this.remove();
        });
    }

    console.log("A new task needs to be created!");
    addBeforeElem.before(
        "<li><input type='text' id='newTaskTextField' class='form-control' placeholder='Insert New Task'></input></li>");
    newTaskTextField = $("#newTaskTextField");

    newTaskTextField.focus();

    //What to do on field deselected
    newTaskTextField.blur(function() {
        newTaskTextFieldFinished();
        return;
    });

    //What to do on enter key selected
    newTaskTextField.keypress(function(e) {
        var key = e.which;
        if(key === 13) {
            newTaskTextFieldFinished();
            newTaskTextField.off();
        }
    });
}

$(document).ready(function() {
	$("#taskList").append("<li id='newTaskBtn' class='cursor-pointer'>+ Add Task</li>");

	var newTaskBtn = $("#newTaskBtn");

	newTaskBtn.click(function() {
        newTask(newTaskBtn);
    });
});

