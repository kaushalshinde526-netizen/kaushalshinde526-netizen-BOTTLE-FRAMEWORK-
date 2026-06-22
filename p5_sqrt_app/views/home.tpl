<html>
    <head>
        <title> Square Root App </title>
        <style>
            * {
                font-size:40px;
                text-align:center;
            }
            body {
                background-color: lavender;
            }
        </style>
    </head>
    <body>
        <h1> Square Root App </h1>
        <form method="POST">
            <input type="number"
                   step = "0.01"
                   name="num"
                   placeholder="Enter Number" />
            <br/><br/>
            <input type="submit"
                   value="Find Square Root"/>
        </form>
        <h2>
            {{ msg }}
        </h2>
    </body>
</html>
