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

    <form method="POST" onsubmit="return check(event)">

        <label>Distance</label>
        <br/>

        <input type="number"
               step="0.01"
               name="distance"
               placeholder="Enter Distance"
               id="id_distance"
        />

        <br/><br/>

        <label>Source</label>
        <br/>

        <input type="radio"
               name="src"
               value="km"
               checked=true
        />KM

        <input type="radio"
               name="src"
               value="m"
        />M

        <br/><br/>

        <label>Destination</label>
        <br/>

        <input type="radio"
               name="dest"
               value="km"
               checked=true
        />KM

        <input type="radio"
               name="dest"
               value="m"
        />M

        <br/><br/>

        <input type="submit"
               value="Convert"
        />

    </form>

    <h2 id="id_msg">
        {{msg}}
    </h2>

    <script>

        function check(event)
        {
            let distance = document.getElementById("id_distance");
            let msg = document.getElementById("id_msg");

            if(distance.value === "")
            {
                alert("Distance cannot be empty");
                msg.textContent = "";
                distance.focus();
                return false;
            }

            if(distance.value <= 0)
            {
                alert("Distance should be greater than 0");
                msg.textContent = "";
                distance.focus();
                return false;
            }

            return true;
        }

    </script>

</body>
</html>