function newTask(addBeforeElem) {
    var newTaskTextField;
    console.log("A new task needs to be created!");
    addBeforeElem.before(
        "<li><input type='text' id='newTaskTextField' class='form-control' placeholder='Insert New Task'></input></li>");
    newTaskTextField = $("#newTaskTextField");

    newTaskTextField.focus();
    newTaskTextField.blur(function() {
        if(newTaskTextField.val() == "") {
            newTaskTextField.fadeOut(function() {
                this.remove();
            });
        } else {
            addBeforeElem.before("<li>" + newTaskTextField.val() + "</li>");
            newTaskTextField.remove();
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

