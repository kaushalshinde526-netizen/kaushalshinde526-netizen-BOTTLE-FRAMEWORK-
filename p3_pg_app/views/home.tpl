<html>
<head>
    <title> Password Generator </title>
    <style>
        * {
            font-size: 40px;
            text-align : center;
        }
        body {
            background-color: linen;
        }
        input[type=checkbox] {
            width:2%;
            height:0.7em;
        }
    </style>
</head>
<body>
    <h1> Password Generator App </h1>
    <form method="POST" onsubmit="return check(event)">
        <label> Password Length </label>
        <br/>
        <input type="number"
               step="0.01"
               name="plength"
               placeholder="Enter Password Length"
               id = "id_plength"
        />
        <br/><br/>
        <input type="checkbox" name="uc"/> Uppercase
        <input type="checkbox" name="di"/> Digits
        <input type="checkbox" name="sp"/> Special Characters
        <br/><br/>
        <input type="submit"
               value="Generate Password" />
    </form>
    <h2 id="id_msg">
        {{ msg }}
    </h2>

    <script>
        function check(event)
        {
            let plength = document.getElementById("id_plength");
            let msg = document.getElementById("id_msg");

            if (plength.value === "")
            {
                alert("please enter password length");
                msg.textContent = "";
                plength.focus();
                return false;
            }

            let pl = parseInt(plength.value);
            if ( (pl < 6) || ( pl > 12) )
            {
                alert("password length shud be between 6 and 12");
                msg.textContent = "";
                plength.focus();
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
