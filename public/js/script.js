/*$('#search-input').keypress(function(e) {
    var key = e.which;
    if (key == 13) {
        location.href = "timkiem.html";
        return;
    }
});*/


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

$('.user-panel #edit-fullname').click(function() {
    $('.user-panel #user-fullname').attr('readonly', false);
    $('.user-panel #user-fullname').addClass('edit');
});

function sendMail() {
    $.ajax({
        type: 'POST',
        url: 'https://mandrillapp.com/api/1.0/messages/send.json',
        data: {
            'key': 'ea6bdf6eb667052162fe952ba75994fa-us15',
            'message': {
                'from_email': 'swiftbook@gmail.com',
                'to': [{
                    'email': 'khanhnhat12@yahoo.com.vn',
                    'name': 'RECIPIENT NAME (OPTIONAL)',
                    'type': 'to'
                }],
                'autotext': 'true',
                'subject': 'YOUR SUBJECT HERE!',
                'html': 'YOUR EMAIL CONTENT HERE! YOU CAN USE HTML!'
            }
        }
    }).done(function(response) {
        alert(response); // if you're into that sorta thing
    });
}

Number.prototype.formatMoney = function(c, d, t){
    var n = this,
        c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
        j = (j = i.length) > 3 ? j % 3 : 0;
    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};