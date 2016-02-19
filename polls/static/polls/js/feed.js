
function append(){
      $.ajax({
        url: "/api/feed",
        success: function(response){
          console.log(response);
          for(i=0;i < response.length; i++){
            var html = " <div class=\"panel panel-default\">\
                      <a data-toggle=\"collapse\" data-parent=\"#accordion\" class=\"questions\" style=\"text-decoration:none;\" href=\"#question"+i+"\">\
                           <div class=\"panel-heading\">\
                               <div class=\"question-description\">\
                                  "+ response[i].category+" &bull; "+ response[i].modified +
                               "</div>\
                               <h4 class=\"panel-title\">\
                                  "+response[i].text + 
                               "</h4>\
                            </div>\
                        </a>\
                        <div id=\"question"+i+"\" class=\"panel-collapse collapse\">\
                            <div class=\"panel-body\">\
                                <div class=\"row\">"
                            for(j=0;j < response[i].choices.length; j++){
                                html += "<div class=\"col-sm-6\">\
                                  <div class=\"radio\">\
                                    <label><input type=\"radio\" name=\"optradio\">"+response[i].choices[j]+"</label>\
                                  </div>\
                                  </div>"
                                }
                              html += "</div></div></div></div>"
                $(html).appendTo("#accordion");
          }
        }
        });
}