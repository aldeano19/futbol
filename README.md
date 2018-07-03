# DOCS
##  Perform POST on \<tr> click:

##### the_view.html.erb
    <tr onclick="foo(param1, '<%= form_authenticity_token %>')
    
##### application.js:

    var foo = function(param1, auth_token){
        // This payload is accessible with params[:the_key_name] from the rails controller
        var payload = {"param1" : param1, "authenticity_token" : auth_token};
        $.post("/a_rails_route", payload, function (data, status) {
            console.log("DONE!");
        })
    }