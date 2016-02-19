

var next = "/api/feed?page=1"
var i = 0;
parseFeed();
console.log($('#user_id').text());
function parseFeed(){
  $.ajax({
  url: next,
  //beforeSend: function(xhr){xhr.setRequestHeader('X-User', $('#user_id').text())},
  success: function(response){
    page = response.page;
    next = response.next;
    console.log(response);
    results = response.results;
    for(i=0;i < results.length; i++){
      is_voted = results[i].is_voted;
      var html = " <div class=\"panel panel-default\">\
                <a data-toggle=\"collapse\" data-parent=\"#accordion\" class=\"questions\" style=\"text-decoration:none;\" href=\"#question-"+page+"-"+i+"\">\
                     <div class=\"panel-heading\">\
                         <div class=\"question-description\">\
                            "+ results[i].category+" &bull; "+ results[i].modified +
                         "</div>\
                         <h4 class=\"panel-title\">\
                            "+results[i].text + 
                         "</h4><div class= \"row\"><div class=\"col-sm-4\"> asked by "+results[i].author+"</div><div class=\"col-sm-8\">";
                  if(is_voted){
                    html += "<div><span style=\"font-size:14px;background-color:#0099ff;color:white;\">&nbsp Voted &nbsp<span></div>";
                  }
                      html += "</div></div></div>\
                  </a>\
                  <div id=\"question-"+page+"-"+i+"\" class=\"panel-collapse collapse\">\
                      <div class=\"panel-body\">\
                          <div class=\"row\">";
                      
                      if(!is_voted){
                        for(j=0;j < results[i].choices.length; j++){
                          html += "<div class=\"col-sm-6\">\
                          <label class=\"mdl-radio mdl-js-radio mdl-js-ripple-effect\" for=\"option-"+i+"-"+j+"\">\
                            <input type=\"radio\" id=\"option-"+i+"-"+j+"\" class=\"mdl-radio__button\" name=\"options\" value=\""+results[i].choices[j].id+"\"/>\
                            <span class=\"mdl-radio__label\">"+results[i].choices[j].text+"</span>\
                          </label>\
                            </div>";
                          }  
                      }
                      else{
                        for(j=0;j < results[i].results.length; j++){
                          html += "<div class=\"col-sm-6\">\
                            <div>\
                              <div style=\"padding:10px\"><i class=\"zmdi zmdi-collection-item-"+(j+1)+" zmdi-hc-lg \"></i>&nbsp\
                              "+results[i].results[j].text+" - "+results[i].results[j].votes+"</div>\
                            </div>\
                            </div>";
                          }
                      }
          if(is_voted)
          html += "<div class = \"col-sm-4\"></div><div class = \"col-sm-7\"><a href=\"/"+results[i].id+"/results/\" target=\"_self\" id=\"result-button\" class=\"mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--accent mdl-color-text--accent-contrast\" data-upgraded=\",MaterialButton,MaterialRipple\">View More<span class=\"mdl-button__ripple-container\"><span class=\"mdl-ripple is-animating\" style=\"width: 207.437px; height: 207.437px; transform: translate(-50%, -50%) translate(62px, 34px);\"></span></span></a>\
          </div></div></div></div></div>";
          else
            html += "</div></div></div></div>";
          $(html).appendTo("#accordion");
          
    }
    if(next != null){
      var html = "<div style=\"margin-top:20px\" class=\"row\">\
                  <div class=\"col-sm-5\"></div><div class=\"col-sm-6\">\
                  <button id=\"view-more\" type=\"button\" class=\"btn btn-primary\">View More</button>\
                  </div></div>\
                  </div>"
      $(html).appendTo("#accordion");
    }
  }
  
  });
}
$(document).on("click","#view-more",function(){
  $("#view-more").html("<div class=\"mdl-spinner mdl-js-spinner is-active\"></div>");
  setTimeout(function(){ console.log("hello"); }, 3000);
  parseFeed();
  $("#view-more").detach();
  console.log(next);
});

function drawGooglePie(choices, chart_id){
// Load the Visualization API and the piechart package.
    google.load('visualization', '1.0', {'packages':['corechart']});

    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {

      // Create the data table.
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Choice');
      data.addColumn('number', 'Votes');
      dataRow = [];
      for(i in choices){
        dataRow.push([choices[i].text, parseInt(choices[i].votes)]);
      }
      data.addRows(dataRow);

      // Set chart options
      var options = {'title':'Opinion Distribution',
                     'width':300,
                     'height':300};

      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.PieChart($("#"+chart_id));
      chart.draw(data, options);
    }
    
}

// For search
$("#sample6").keyup(function(e){
var suggestionbox = $("#well")
var url ="/search/"+$("#sample6").val()
console.log(url)
$.getJSON( url, function( data ) {
  var items = [];
  suggestionbox.empty();
  $.each( data, function( key, val ) {
    suggestionbox.append(
    "<a href= \'' "+key + "/\' class=\"list-group-item\">" + val + "</a>");
        });

  }).error(function(){
    suggestionbox.empty();
  });

  });