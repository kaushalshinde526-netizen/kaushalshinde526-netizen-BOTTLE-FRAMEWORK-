<html>
    <head>
        <title>Kaushal's Cafe</title>
        <style>
            *{font-size:40px;text-align:center;}
            .nav{background-color:black;}
            .nav a{color:white;text-decoration:none;margin:5%;}
            body{background-color:azure;}
            table{width:80%;margin:auto;}
        </style>
    </head>
    <body>
        <div class="nav">
            <a href="/">Home</a>
            <a href="/create">Create</a>
        </div>

        <h1>Home Page</h1>

        <table border="5">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Review</th>
                </tr>
            </thead>

            <tbody>

                % for m in msg:

                <tr>
                    <td>{{m[0]}}</td>
                    <td>{{m[1]}}</td>
                </tr>

                % end

            </tbody>
        </table>

    </body>
</html>