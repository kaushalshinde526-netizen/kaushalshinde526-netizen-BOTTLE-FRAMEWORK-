<!DOCTYPE html>
<html>
<head>
    <title>BMI Calculator App</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{
            background:#dfecee;
            font-family:"Times New Roman", serif;
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .container{
            width:100%;
            max-width:650px;
            padding:30px;
            text-align:center;
        }

        h1{
            font-size:55px;
            margin-bottom:30px;
        }

        label{
            display:block;
            font-size:30px;
            margin-top:20px;
            margin-bottom:8px;
        }

        input,
        select{
            width:100%;
            height:60px;
            font-size:22px;
            text-align:center;
            border:1px solid #666;
            border-radius:5px;
            padding:10px;
            background:white;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button{
            -webkit-appearance:none;
            margin:0;
        }

        input[type=number]{
            appearance:textfield;
        }

        button{
            width:100%;
            height:60px;
            margin-top:30px;
            font-size:28px;
            font-weight:bold;
            border:none;
            border-radius:5px;
            background:#1e88e5;
            color:white;
            cursor:pointer;
        }

        button:hover{
            opacity:0.9;
        }

        .result{
            margin-top:25px;
            color:green;
            font-size:28px;
            font-weight:bold;
        }

        .error{
            margin-top:20px;
            color:red;
            font-size:24px;
            font-weight:bold;
        }

        .download-btn{
            text-decoration:none;
        }

        .download-btn button{
            background:green;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>BMI Calculator App</h1>

    <form action="/calculate" method="post" id="bmiForm">

        <label for="name">Full Name</label>
        <input
            type="text"
            name="name"
            id="name"
            placeholder="Enter your full name"
            required
        >

        <label for="age">Age</label>
        <input
            type="number"
            name="age"
            id="age"
            placeholder="Enter your age"
            required
        >

        <label for="gender">Gender</label>
        <select name="gender" id="gender" required>
            <option value="">Select Gender</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>

        <label for="weight">Weight (kg)</label>
        <input
            type="number"
            name="weight"
            id="weight"
            step="0.01"
            placeholder="Enter weight"
            required
        >

        <label for="height">Height (cm)</label>
        <input
            type="number"
            name="height"
            id="height"
            step="0.01"
            placeholder="Enter height"
            required
        >

        <button type="submit">Calculate BMI</button>

    </form>

    <div class="error">{{error}}</div>

    % if result:
        <div class="result">{{result}}</div>
    % end

    % if pdf_file:
        <br>
        <a class="download-btn" href="/download/{{pdf_file}}">
            <button>Download BMI Report</button>
        </a>
    % end

</div>

<script>

document.getElementById("bmiForm").addEventListener("submit", function(e){

    let name = document.getElementById("name").value.trim();
    let age = parseInt(document.getElementById("age").value);
    let gender = document.getElementById("gender").value;
    let weight = parseFloat(document.getElementById("weight").value);
    let height = parseFloat(document.getElementById("height").value);

    let errorBox = document.querySelector(".error");
    errorBox.innerHTML = "";

    if(name.length < 2){
        e.preventDefault();
        errorBox.innerHTML = "Please enter a valid name.";
        return;
    }

    if(isNaN(age) || age <= 0){
        e.preventDefault();
        errorBox.innerHTML = "Please enter a valid age.";
        return;
    }

    if(gender === ""){
        e.preventDefault();
        errorBox.innerHTML = "Please select gender.";
        return;
    }

    if(isNaN(weight) || weight <= 0){
        e.preventDefault();
        errorBox.innerHTML = "Please enter positive weight value.";
        return;
    }

    if(isNaN(height) || height <= 0){
        e.preventDefault();
        errorBox.innerHTML = "Please enter positive height value.";
        return;
    }

});

</script>

</body>
</html>