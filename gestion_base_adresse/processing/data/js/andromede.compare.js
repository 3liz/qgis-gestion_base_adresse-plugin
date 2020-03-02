lizMap.events.on({
    'uicreated':function(evt){
        if ( !('compareFeatures' in lizUrls) ) {
            $('#getCompareModal').remove();
            $('#compare-button').parent().remove();
            $('#compare').remove();
            return;
        }

        $('#compare button.btn-compare-close').click(function(){
            if( $('#mapmenu .nav-list > li.compare').hasClass('active') ){
                $('#button-compare').click();
            }
        });

        $('body').append($('#getCompareModal')).modal({show:false,backdrop:'static'});

        $('#getCompareModal .btn-primary').click(function(){
          var url = OpenLayers.Util.urlAppend(lizUrls.comparePrint
            ,OpenLayers.Util.getParameterString(lizUrls.params)
          );
          url += '&layer='+$('#getCompareModal input[name="layer"]').val();
          url += '&group='+$('#getCompareModal select').val();
          url += '&fid='+$.map($('#getCompareModal input.feature:checked'), function(e, i){
            return $(e).attr('name');
          }).join(',');
          window.open(url);
          $('#getCompareModal').modal('hide');
        });

        $('#GetCompare').click(function(){
          var extent = evt.map.getExtent();
          extent.transform(evt.map.getProjection(),'EPSG:4326');
          $('#loading').dialog('open');
          $.get(lizUrls['compareFeatures'],{
            repository:lizUrls.params.repository,
            project:lizUrls.params.project,
            bbox:extent.toBBOX(),
            layer:$('#compare-layer-list').val()
          }, function( aHtml ) {
            $('#getCompareModal input.all').unbind('click');
            $('#getCompareModal .modal-body').html( aHtml );
            $('#loading').dialog('close');
            $('#getCompareModal input.all').click(function(){
                if ($(this).is(':checked'))
                    $('#getCompareModal input.feature:not(:checked)').click();
                else
                    $('#getCompareModal input.feature:checked').click();
            });
            $('#getCompareModal').modal('show');
          });
          return false;
        });

        $('#compare-layer-list').removeAttr('disabled');
      }
});