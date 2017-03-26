$('#search-input').keypress(function(e) {
    var key = e.which;
    if (key == 13) {
        location.href = "timkiem.html";
        return;
    }
});


$(".image-book .icon-small img").click(function() {
    var src = $(this).attr('src');
    $('.image-book .logo img').attr('src', src);
})

$('.info-book .change-number button:first-child').click(function() {
    var value = $('.info-book .change-number #number').val();
    value = parseInt(value);
    if (value <= 0)
        return;
    $('.info-book .change-number #number').attr('value', value - 1);
});

$('.info-book .change-number button:last-child').click(function() {
    var value = $('.info-book .change-number #number').val();
    value = parseInt(value);
    $('.info-book .change-number #number').attr('value', value + 1);
});