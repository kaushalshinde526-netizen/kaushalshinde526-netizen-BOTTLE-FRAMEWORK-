<html>
<head>
    <title> Kaushal's Cafe </title>
    <style>
        * { font-size: 40px; text-align:center;}
        .nav { background-color: black;}
        .nav a { color: white; text-decoration:none; margin:5%; }
        body { background-color: azure; }
        textarea { resize: none; }
    </style>
</head>
<body>
    <div class="nav">
        <a href="/"> Home </a>
        <a href="/create"> Create </a>
    </div>
    
    <h1> Create Page </h1>
    
    <form method="POST">
        <input type="text" name="name" placeholder="Enter Food Name" required/>
        <br/><br/>
        
        <textarea name="review" rows="3" cols="30" placeholder="Enter Food Review" required></textarea>
        <br/><br/>
        
        <input type="submit" />
    </form>
    
    <h2>
        {{ msg }}
    </h2>
</body>
</html>