$('#search-input').keypress(function(e) {
    var key = e.which;
    if (key == 13) {
        location.href = "timkiem.html";
        return;
    }
});