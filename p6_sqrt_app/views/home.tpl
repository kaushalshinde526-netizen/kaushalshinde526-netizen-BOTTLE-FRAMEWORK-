<html>
<head>
    <title> Square Root App </title>
    <style>
        * {
            font-size:40px;
            text-align:center;
        }
        body {
            background-color: mistyrose;
        }
    </style>

    <script>
        function check()
        {
            let num = document.getElementById("id_num");
            let msg = document.getElementById("id_msg");

            if (num.value === "")
            {
                alert("please enter number");
                msg.textContent = "";
                num.focus();
                return false;
            }

            if (parseFloat(num.value) < 0)
            {
                alert("please enter number >= 0");
                msg.textContent = "";
                num.focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h1> Square Root App </h1>
    <form method="POST" onsubmit="return check()">
        <input type="number"
               step = "0.01"
               name="num"
               placeholder="Enter Number"
               id = "id_num"
               />
        <br/><br/>

        <input type="submit"
               value="Find Square Root"/>
    </form>
    <h2 id="id_msg">
        {{ msg }}
    </h2>
</body>
</html>
