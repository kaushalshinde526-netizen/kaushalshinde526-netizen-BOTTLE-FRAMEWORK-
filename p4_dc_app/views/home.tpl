<html>
    <head>
        <title>DIST_CONVERTER APP BY KAUSHAL</title>
        <style>
            * {
                font-size: 40px;
                text-align : center;
            }
            body {
                background-color: lightyellow;
            }
        </style>
    </head>
    <body>
        <h1> Distance Converter App </h1>
        <form method="POST" onsubmit="return check(event)">
            <label> Distance </label>
            <br/>
            <input type="number"
                   step="0.01"
                   name="distance"
                   placeholder="Enter Distance"
                   id = "id_distance"
                   />
            <br/><br/>
            <label> Source </label>
            <select name="src">
                <option value="km">KM</option>
                <option value="m">M</option>
            </select>
            <label> Destination </label>
            <select name="dest">
                <option value="km">KM</option>
                <option value="m">M</option>
            </select>
            <br/><br/>
            <input type="submit"
                   value="Convert" />
        </form>
        <h2 id="id_msg">
            {{ msg }}
        </h2>

        <script>
            function check(event)
            {
                let distance = document.getElementById("id_distance");
                let msg = document.getElementById("id_msg");
                            if (distance.value === "")
                {
                    alert("please enter distance");
                    msg.textContent = "";
                    distance.focus();
                    return false;
                }

                if (parseFloat(distance.value) <= 0)
                {
                    alert("distance shud be min of 0.1");
                    msg.textContent = "";
                    distance.focus();
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>




