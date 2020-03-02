console.log('hello !');

$("#search-project").keyup(function() {
    var val = $.trim(this.value).toUpperCase();
    // If the search bar is empty, show everything
    if (val === "")
    {
        $("#content.container .liz-repository-project-item").show();
        $( "#content.container .liz-repository-title" ).show();
     }
     // Hide everything then show projects and titles corresponding to the search bar
    else {
        $("#content.container .liz-repository-project-item").hide();
        $( "#content.container .liz-repository-title" ).hide();

        val = val.toUpperCase();
        $rows.filter(function() {
             return -1 != $(this).text().toUpperCase().indexOf(val);
         }).closest('.liz-repository-project-item').show();

         $rows.filter(function() {
             return -1 != $(this).text().toUpperCase().indexOf(val);
         }).closest('.liz-repository-project-list').prev('.liz-repository-title').show();

    }
});

var theme = {};
theme = {
  'poisson': ['montpellier~events','montpellier~montpellier'],
  'temperature': ['in1~CD_34_Inclusin_Num','inedit1~CD_34_Inclusin_Num_edition'],
  'herbier': ['gpx1~projet_gpx','vosges1~vosges'],
  'gorgone': ['pb1~Petit-Bourg', 'pb2~peti_bourg'],
  'acoustique': ['rea1~raepa_32620']
};

function filterProject(elem){
  var val = elem.name;
  console.log(val);
  if (val != ""){
    $("#content.container .liz-repository-project-item").hide();
    var tab = theme[val];
    console.log(tab);
    for(var t in tab){
      console.log('#'+tab[t]);
      $('.'+tab[t].split('~').join('.')).show();
    }
  }

}
