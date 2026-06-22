<html>

<head>

    <title>Multiple CC App</title>

    <style>

        *{
            font-size:30px;
            text-align:center;
        }

        body{
            background-color:azure;
        }

        .fc{
            border:solid;
            padding:2%;
            width:50%;
            margin:auto;
            border-radius:30px;
            background-color:lightblue;
        }

        h2{
            border:solid;
            padding:2%;
            width:50%;
            margin:auto;
            border-radius:30px;
        }

        .row{
            display:flex;
            justify-content:center;
            gap:60px;
        }

        select{
            width:180px;
            height:50px;
        }

        input[type="number"]{
            width:300px;
            height:50px;
        }

        input[type="submit"]{
            width:220px;
            height:60px;
        }

        input[type="submit"]:disabled{
            background-color:gray;
            cursor:not-allowed;
        }

    </style>

    <script>

        function fetchMsg(){

            let btn = document.getElementById("btn");

            btn.disabled = true;

            btn.value = "Converting...";

        }

    </script>

</head>

<body>

    <h1>Multiple CC App</h1>

    <div class="fc">

        <form method="POST" onsubmit="fetchMsg()">

            <label>Source</label>

            <br/><br/>

            <input type="number"
                   name="amt"
                   step="0.01"
                   placeholder="Enter Amount"
                   required/>

            <br/><br/>

            <div class="row">

                <div>

                    <label>Source</label>

                    <br/><br/>

                    <select name="src">

                        <option value="USD">USD</option>

                        <option value="INR">INR</option>

                        <option value="GBP">GBP</option>

                        <option value="EUR">EUR</option>
			<option value="SGD">SGD</option>


                    </select>

                </div>

                <div>

                    <label>Destination</label>

                    <br/><br/>

                    <select name="dest">

                        <option value="USD">USD</option>

                        <option value="GBP">GBP</option>

                        <option value="SGD">SGD</option>

                        <option value="INR">INR</option>

                    </select>

                </div>

            </div>

            <br/><br/>

            <input type="submit"
                   value="Convert"
                   id="btn"/>

        </form>

    </div>

    <br/>

    <h2>
        {{msg}}
    </h2>

</body>

</html>