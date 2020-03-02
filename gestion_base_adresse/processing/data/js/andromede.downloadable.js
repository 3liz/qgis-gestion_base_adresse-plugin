lizMap.events.on({
    'uicreated':function(evt){
        if ( !('downloadLayers' in lizUrls) ) {
            $('#downloadable-button').parent().remove();
            $('#downloadable').remove();
            return;
        }

        $('#downloadable form input[type="checkbox"]').change(function(){
            if ( $('#downloadable form input[type="checkbox"]:checked').length >= 6 ) {
                $('#downloadable form input[type="checkbox"]:not(:checked)').attr('disabled', 'disabled');
            } else if (  $('#downloadable form input[type="checkbox"]:disabled').length > 0 ) {
                $('#downloadable form input[type="checkbox"]:not(:checked)').removeAttr('disabled');
            }
        });

        $('#downloadable form .modal-footer button').click(function(){
            $('#loading').dialog('open');
            var form = $('#downloadable form');
            $.post( form.attr('action'), form.serialize(), function( data ) {
                $('#loading').dialog('close');
                if ( data.status == 0 )
                    lizMap.addMessage(data.msg,'error',true);
                else
                    lizMap.addMessage(data.msg,'success',true);
            });
            return false;
        });
    }
});