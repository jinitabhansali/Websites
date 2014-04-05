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

<title>Displaying Details On Click</title>


</head>
    <body>
        <div class ="container display-movie-container">
            <h1>Search For Movie</h1>
            <input type="text" placeholder="Enter Movie Name" class="get-movie-name" style="width:500px;"/>
            <input style="margin:20px;" type="button" value="Get Movies" class="btn btn-info get-movies">
       
            <div class="row display-movie-row">
               <div class="col-md-8">
                 <ul class="display-movie list-unstyled"></ul>
               </div>
            </div>
         </div>

         <div class="movie-details container" style="margin:15px;display:none;">
         </div>  
         
    </body>

    <script>
        $(function () {
            $(".get-movies").click(getEventHandler);
        });

        function getEventHandler() {
            var name = $(".get-movie-name").val();

            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=48fv438wmjsh44bqutgd3gzn&q=" + name + "&page_limit=5",
                dataType: "jsonp",
                success: function (response) {
                    $(".display-movie").empty();
                    var ul = $(".display-movie");
                    for (var i = 0; i < response.movies.length; i++) {
                        var img = $("<img>").attr("src", response.movies[i].posters.original)
                                            .attr("id", i)
                                            .attr("data-placement", "right")
                                            .attr("class", "img-popover")
                                            .on('click',response,click_pressed)
                                            .css({
                                                 width: 200,
                                                 height: 200,
                                                 margin: 20
                                             });

                        var div = $("<div>").append(img)
                        $("<li>").append(div)
                                 .appendTo(ul);
                    }
                }
            });
        }

        function click_pressed(response) {
            $(".display-movie-row").css('display', 'none');
            $(".movie-details").css('display', 'table')
                               .append($("<img>").attr('src', response.data.movies[response.target.id].posters.thumbnail),
                                       $("<h3>").html(response.data.movies[response.target.id].title));
        }
    </script>



    <p style="margin:15px;">
        In this experiment , when you search click on any movie a new page will be displayed with the details of that movie.
        There is no different page since this is a single page application. Only certain div's will be displayed and certain will hide.
        The code used is as follows : 
    </p>

    <pre style="margin:15px;">
            function click_pressed(response) {
            $(&quot;.display-movie-row&quot;).css(&apos;display&apos;, &apos;none&apos;);
            $(&quot;.movie-details&quot;).css(&apos;display&apos;, &apos;table&apos;)
                               .append($(&quot;&lt;img&gt;&quot;).attr(&apos;src&apos;, response.data.movies[response.target.id].posters.thumbnail),
                                       $(&quot;&lt;h3&gt;&quot;).html(response.data.movies[response.target.id].title));
        }
    </pre>

    <pre style="margin:15px;">
      <a href="../../fileview/Default.aspx?~/experiments/week5/exp5.2.aspx">View Source</a>
    </pre>
    </html>