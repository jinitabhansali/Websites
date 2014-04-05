<%@ Page Language="C#" %>

<script runat="server">
    <%-- This demo page has no server side script --%>
</script>

<!DOCTYPE html>

<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> 
<script src="../../bootstrap/js/bootstrap.js"></script>  
<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="../../style1.css">
<link rel="stylesheet" type="text/css" href="../../responsive.css">
<meta charset='utf-8' />

<title>Web Services</title>


</head>
    <body>
        <div class ="container">
            <div>
        <input type="text" placeholder="Enter Movie Name" class="get-movie-name"/>
        <input style="padding: 20px 20px; margin:20px;" type="button" value="Get Movies" class="get-movies"></div>
       <div class="row">
           <div class="col-md-8">
         <ul class="display-movie">
         </ul>
           </div>

           <div class="col-md-3 well well-md">
              <h3>Sources :</h3>
              <ul>
              <li><a href="../../fileview/Default.aspx?~/experiments/week4/exp4.2.aspx">ASPX Source</a></li>
              <li>CSS Source </li>
              </ul>
           </div>
           </div>

           <div class="row" style="margin:20px; padding:15px 15px;">
               In this experiment, I have got an API from the site of Rotten Tomatoes. The text box above allows you to enter the name of the movie that
               you wish to search. After entering the movie, when you press the 'Get Movies' button , the results would be displayed. The results will be
               in the form of a list with an image on the left and the name of the movie on the right. For this experiment, i have set the page_limit to be
               5, so by default only 5 results will be displayed.
               The main code for this is as follows :
               <pre>
                $.ajax({
                    url: &quot;http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=48fv438wmjsh44bqutgd3gzn&amp;q=&quot; +name+ &quot;&amp;page_limit=5&quot;,
                    dataType: &quot;jsonp&quot;,
                    success: function (response) {
                        var ul = $(&quot;.display-movie&quot;);
                        for (var i = 0 ; i &lt; response.movies.length; i++) {
                            var row = &apos;&lt;li&gt;&apos; +
                            &apos;&lt;div&gt; &lt;img src=&quot; &apos; + response.movies[i].posters.thumbnail + &apos;&quot; width=&quot;200px&quot; height=&quot;200px&quot; style=&quot;margin:20px;&quot; /&gt;&apos; +
                                      response.movies[i].title + &apos;&lt;/div&gt;&apos; +
                            &apos;&lt;/li&gt;&apos;
                             ul.append(row);
                            console.log(response);
                    };
                }
            });
                   </pre>
               </div>
        </div>
    </body>

    <script>
        $(function () {
            $(".get-movies").click(getEventHandler);
        });

        function getEventHandler() {
            var params = {
                apikey: "48fv438wmjsh44bqutgd3gzn",
                dataType: "jsonp",
                page_limit: "5"
            };
            var name = $(".get-movie-name").val();

            $.ajax({

                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=48fv438wmjsh44bqutgd3gzn&q=" +name+ "&page_limit=5",
                dataType: "jsonp",
                success: function (response) {
                    $(".display-movie").empty();
                    var ul = $(".display-movie");
                    for (var i = 0 ; i < response.movies.length; i++) {
                        var row = '<li>' +
                            '<div> <img src=" ' + response.movies[i].posters.thumbnail + '" width="200px" height="200px" style="margin:20px;" />' +
                                      response.movies[i].title + '</div>' +
                            '</li>'
                        ul.append(row);
                        console.log(response);
                    };
                }
            });
        }

    </script>

    </html>