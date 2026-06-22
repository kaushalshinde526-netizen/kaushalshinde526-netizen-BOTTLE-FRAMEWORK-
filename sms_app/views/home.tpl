<head>
            
    <title>SMS by kaushal</title>
        <style>
            *{font-size:50px; text-align:center; }
            .nav{background-color:black;}
            .nav a{color:white;text-decoration:none;margin:5%}
            table{width:80%; margin:auto;}
        </style>
</head>
    <body>
        <div class="nav">
        <a href="/" > Home </a>
        <a href="/create"> Create</a>
        </div>
        <br/>
        <table border="5">
        <thread>
        <tr>
            <th>Rno</th>
            <th>Name</th>
            <th>Marks</th>
            <th>Delete</th>
            <th>Update</th>
        </tr>
            </thread>
                <tbody>
                % for m in msg:
                <tr>
                    <td>{{m[0]}}</td>
                    <td>{{m[1]}}</td>
                    <td>{{m[2]}}</td>
                    <td><button onclick="return confirm('r u sure???')"><a href="/delete/{{m[0]}}">Delete</a></button></td>
                    <td><button><a href="/update/{{m[0]}}">update<a>
                    </button></td>
                </tr>
                %end
            </tbody>
        </table>
    <body>
</html>