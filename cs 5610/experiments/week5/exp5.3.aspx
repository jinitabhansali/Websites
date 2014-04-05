<html>

    <head>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> 
        <title>Trial</title>
    </head>

    <body>
        <div class="work">
            <a href="#">This is a text of which the link I want to remove</a>
            <p></p>
        </div>
    </body>
    <script>
        $(function () {
            $("p").html(( $(".work a").html()));
        })
    </script>
</html>