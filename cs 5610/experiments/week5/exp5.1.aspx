<%@ Page Language="C#" %>

<script runat="server">

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

<title>Displaying Popover on Hover</title>


</head>
    <body>
        <div class ="container">
        <h1>Search For Movie</h1>
        <input type="text" placeholder="Enter Movie Name" class="get-movie-name" style="width:500px;"/>
        <input style="margin:20px;" type="button" value="Get Movies" class="btn btn-info get-movies">
       
        <div class="row">
           <div class="col-md-8">
             <ul class="display-movie list-unstyled"></ul>
           </div>
        </div>
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
                                            .on("mouseover", response, getPopOver)
                                            .on("mouseout", hidePopOver)
                                         .css({
                                             width: 200,
                                             height: 200,
                                             margin: 20
                                         });

                        var div = $("<div>")
                            .append(img)
                        $("<li>")
                            .append(div)
                            .appendTo(ul);
                    }

                    $(".img-popover").popover({
                        title: "<h1 id='titlemovie'>",
                        trigger: "hover",
                        html: true,
                        content: "<img src='#' id='myImage' height='100' width='100' />"
                    });


                }
            });
        }

        function getPopOver(info) {
            console.log(info.currentTarget);
            console.log($("#titlemovie").html());
           // console.log($("#myImage").attr("id"));
            setTimeout(function () {
                $("#myImage").attr("src", info.currentTarget.src);
            }, 50);
        }


        function hidePopOver() {
           console.log("Leaving here");
//            $(".img-popover").popover("hide");
        }
    </script>

   <p> In this experiment , I will display all information of movies in a popover.</p>
    <pre style="margin:15px;">
          function getPopOver(info) {
            console.log(info);
            var image = &apos;&lt;img src = &quot; &apos; +info.data.movies[info.target.id].posters.thumbnail+ &apos; &quot; /&gt;&apos;;
            $(&quot;.img-popover&quot;).popover({
                title: info.data.movies[info.target.id].title,
                content: image,
                trigger: &quot;hover&quot;,
                html: true
            })
        }
    </pre>

    <pre style="margin:15px;">
        <a href="../../fileview/Default.aspx?~/experiments/week5/exp5.1.aspx">View Source</a>
    </pre>

    </html>