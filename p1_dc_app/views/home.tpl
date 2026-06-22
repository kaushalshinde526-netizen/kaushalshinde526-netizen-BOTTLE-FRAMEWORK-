<html>
    <head>
        <title>Distance Converter App</title>
        <style>
            *{
                font-size:40px;
                text-align:center;
            }
            body{
                background-color:azure;
            }
            input[type=radio]{
                width:2%;
                height:0.7em;
                margin-left:50px;
            }
        </style>
    </head>
    <body>
        <h1>Distance Converter App</h1>
        <form method="POST">
              <label>Distance</label>
              <br/>
              <input type="number"
                    step="0.01"
                    name="distance"
                    placeholder="Enter Distance"
                    required
                    min=0.1
                    />
            <br><br/>
            <label>source</label>
            <br/>
            <input type="radio"
                    name="src"
                    value="km"
                    checked=true
                    />km
            <input type="radio"
                    name="src"
                    vale="m"
                    />M
            <br/><br/>
            <label>Destination</label>
            <br/>
            <input type="radio"
                    name="dest"
                    value="km"
                    checked=true
                    />km
            <input type="radio"
                    name="dest"
                    value="m"
                />M
            <br/><br/>
            <input type="submit"
                   vaule="convert"/>
        </form>
        <h2>
            {{msg}}
        </h2>
        </body>
</html>


