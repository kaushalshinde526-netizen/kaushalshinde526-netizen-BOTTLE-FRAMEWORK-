<html>
<head>
    <title>Motivational Msg App</title>

    <style>
        * {
            font-size: 40px;
            text-align: center;
        }

        body {
            background-color: azure;
        }

        .fc {
            border: solid;
            padding: 2%;
            width: 50%;
            margin: auto;
            border-radius: 30px;
            background-color: lightblue;
        }

        h2 {
            border: solid;
            padding: 2%;
            width: 50%;
            margin: auto;
            border-radius: 30px;
        }

        input[type="submit"]:disabled {
            background-color: gray;
            cursor: not-allowed;
        }
    </style>

    <script>
        function featchMsg() {

            let btn = document.getElementById("btn");

            btn.disabled = true;

            btn.value = "Fetching...";
        }
    </script>

</head>

<body>

    <h1>Motivational Message App</h1>

    <div class="fc">

        <form method="POST" onsubmit="featchMsg()">

            <input type="submit" value="Show" id="btn" />

        </form>

    </div>

    <br/>

    <h2>
        {{msg}}
    </h2>

    <br/>

    <h2>
        {{aut}}
    </h2>

</body>
</html>