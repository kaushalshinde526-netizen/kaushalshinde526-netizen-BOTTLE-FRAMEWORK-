<!DOCTYPE html>
<html>

<head>

<title>Login | Auth App</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">


<style>


*{

margin:0;
padding:0;
box-sizing:border-box;

font-family:'Segoe UI',Arial,sans-serif;

}



body{


min-height:100vh;

display:flex;

justify-content:center;

align-items:center;


background:

linear-gradient(
135deg,
#020617,
#0f172a,
#312e81
);


overflow:hidden;


}


/* Background Glow */


body::before{


content:"";


position:absolute;


width:450px;
height:450px;


background:#2563eb;


border-radius:50%;


filter:blur(130px);


top:-150px;

left:-120px;


animation:move1 6s infinite alternate;


}



body::after{


content:"";


position:absolute;


width:450px;
height:450px;


background:#9333ea;


border-radius:50%;


filter:blur(130px);


bottom:-150px;

right:-120px;


animation:move2 6s infinite alternate;


}



@keyframes move1{


from{

transform:translate(0);

}

to{

transform:translate(120px,80px);

}

}



@keyframes move2{


from{

transform:translate(0);

}

to{

transform:translate(-120px,-80px);

}

}




/* Card */


.card{


width:90%;


max-width:470px;


padding:50px 45px;



background:

rgba(255,255,255,0.12);



backdrop-filter:blur(20px);



border-radius:35px;



border:

1px solid rgba(255,255,255,.25);



box-shadow:

0 25px 60px rgba(0,0,0,.6);



color:white;



animation:

show 1s ease;



position:relative;

z-index:1;


}



@keyframes show{


from{


opacity:0;

transform:translateY(50px) scale(.8);


}


to{


opacity:1;

transform:translateY(0) scale(1);


}



}




/* Logo */


.logo{


text-align:center;


font-size:90px;


margin-bottom:20px;


animation:float 3s infinite;


}



@keyframes float{


50%{

transform:translateY(-15px);

}

}





h1{


text-align:center;


font-size:45px;


letter-spacing:1px;


background:

linear-gradient(
90deg,
#38bdf8,
#c084fc
);


-webkit-background-clip:text;


color:transparent;


}



.sub{


text-align:center;


margin-top:15px;


margin-bottom:35px;


color:#cbd5e1;


font-size:17px;


}




/* Inputs */


.input-box{


margin-bottom:22px;


}



input{


width:100%;


padding:18px;


border:none;


outline:none;


border-radius:18px;



background:

rgba(255,255,255,.15);



color:white;


font-size:17px;


transition:.3s;


}




input::placeholder{


color:#cbd5e1;


}




input:focus{


transform:scale(1.03);


box-shadow:

0 0 20px #38bdf8;


}




/* Password eye */


.password{


position:relative;


}



.eye{


position:absolute;


right:20px;


top:18px;


cursor:pointer;


}




/* Button */


.btn{


margin-top:10px;


background:


linear-gradient(
135deg,
#2563eb,
#9333ea
);



font-size:22px;


font-weight:bold;


cursor:pointer;


}



.btn:hover{


transform:

translateY(-5px);


box-shadow:

0 15px 30px rgba(147,51,234,.6);


}




/* Link */


.link{


text-align:center;


margin-top:25px;


}



.link a{


color:#93c5fd;


font-size:17px;


font-weight:bold;


text-decoration:none;


}



.link a:hover{


color:white;


}




/* Message */


.msg{


text-align:center;


margin-top:20px;


font-size:20px;


color:#fca5a5;


}





@media(max-width:600px){



.card{


padding:35px 25px;


}



h1{


font-size:35px;


}



.logo{


font-size:65px;


}


}



</style>


</head>



<body>



<div class="card">



<div class="logo">

🔐

</div>



<h1>

Welcome Back

</h1>



<div class="sub">

Login to continue your journey

</div>




<form method="POST">



<div class="input-box">


<input

type="text"

name="un"

placeholder="Username"

required>


</div>





<div class="input-box password">


<input

type="password"

id="pw"

name="pw"

placeholder="Password"

required>



<span class="eye" onclick="showPassword()">

👁️

</span>


</div>





<input

type="submit"

value="Login"

class="btn">



</form>




<div class="link">


<a href="/signup">

Create New Account

</a>


</div>



<h2 class="msg">

{{msg}}

</h2>



</div>





<script>


function showPassword(){


let pass=document.getElementById("pw");


if(pass.type==="password"){


pass.type="text";


}

else{


pass.type="password";


}


}



</script>




</body>

</html>