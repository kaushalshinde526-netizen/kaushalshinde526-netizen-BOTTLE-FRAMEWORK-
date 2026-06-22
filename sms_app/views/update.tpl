<html>
    <head>
         <title>SMS App</title>
        <style>
        *{font-size:50px; text-align:center;}
        .nav{background-color:black;}
        .nav a{color:white; text-decoration:none;margin:5%}
        table{width:80%; margin:auto;}
        </style>
    </head>
    <body>
        <div class="nav">
        <a href"/">Home</a>
        <a href="/">Create</a>
        </div>
        <br/>
        <h1>Update page</h1>
        <form method="POST">
            <input type="number" name="rno" placeholder="Enter Rno"required value="{{msg[0]}}" readonly/>
            <br/><br/>
             <input type="text" name="name" placeholder="Enter Name"required value="{{msg[1]}}"/>
            <br/><br/>
             <input type="number" name="marks" placeholder="Enter Marks"required value="{{msg[2]}}"/>
            <br/><br/>
		<input type="submit"/>
		<br/><br/>
        </form>
    </body>
</html>
