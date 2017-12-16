var init_email_lookup;
init_email_lookup = function(){
    $('#search-email-form').on('ajax:success', function(event, data, status){
        $('#search-email-result').replaceWith(data);
        init_email_lookup();
    });

}
$(document).ready(function() {
    init_email_lookup();
});
