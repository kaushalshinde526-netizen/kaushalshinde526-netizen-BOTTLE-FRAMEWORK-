<!DOCTYPE html>
<html>

<head>

<title>Create Account</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">


<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins','Segoe UI',sans-serif;
}


body{

height:100vh;

display:flex;
justify-content:center;
align-items:center;

background:

radial-gradient(circle at top left,#312e81,#020617 45%),
linear-gradient(135deg,#020617,#111827);


overflow:hidden;

}


/* bubbles */


.bubble{

position:absolute;

border-radius:50%;


background:

linear-gradient(
135deg,
rgba(255,255,255,.25),
rgba(255,255,255,.05)
);


box-shadow:

inset 0 0 30px rgba(255,255,255,.2);



animation:move 8s infinite alternate;

}



.b1{

width:220px;
height:220px;

top:-80px;
left:-80px;

}



.b2{

width:140px;
height:140px;

right:15%;
top:10%;

animation-delay:2s;

}



.b3{

width:90px;
height:90px;

bottom:15%;
left:15%;


}


.b4{

width:170px;
height:170px;

bottom:-60px;
right:-40px;


animation-delay:3s;

}



@keyframes move{


from{

transform:translateY(0);

}


to{

transform:translateY(40px);

}


}



/* card */


.card{


width:400px;


padding:45px;



background:

rgba(255,255,255,.12);



backdrop-filter:blur(25px);



border-radius:30px;



border:

1px solid rgba(255,255,255,.25);



box-shadow:

0 30px 80px rgba(0,0,0,.6);



color:white;



z-index:2;


animation:show 1s ease;


}




@keyframes show{


from{

opacity:0;

transform:translateY(40px);

}



to{

opacity:1;

transform:translateY(0);

}



}




.logo{


font-size:75px;


text-align:center;


margin-bottom:15px;


animation:rocket 3s infinite;


}



@keyframes rocket{


50%{

transform:translateY(-15px);

}


}





h1{


text-align:center;


font-size:38px;



background:

linear-gradient(
90deg,
#38bdf8,
#a855f7
);



-webkit-background-clip:text;

color:transparent;



}




.subtitle{


text-align:center;


color:#cbd5e1;


margin:12px 0 35px;


font-size:14px;


}




.input{


margin-bottom:18px;


}




input{


width:100%;


padding:16px 20px;


border:none;


outline:none;


border-radius:18px;



background:

rgba(255,255,255,.18);



color:white;



font-size:15px;



transition:.3s;


}



input::placeholder{

color:#ddd;

}



input:focus{


background:

rgba(255,255,255,.28);


box-shadow:

0 0 20px #38bdf8;


}




button{


width:100%;


padding:16px;



border:none;


border-radius:20px;



margin-top:10px;



font-size:18px;


font-weight:600;


color:white;



background:


linear-gradient(
90deg,
#2563eb,
#9333ea
);



cursor:pointer;



transition:.4s;



}



button:hover{


transform:

translateY(-5px);



box-shadow:

0 15px 30px #7c3aed;



}




.link{


text-align:center;


margin-top:25px;


}



.link a{


color:#93c5fd;


text-decoration:none;


font-weight:600;


}




</style>

</head>


<body>


<div class="bubble b1"></div>
<div class="bubble b2"></div>
<div class="bubble b3"></div>
<div class="bubble b4"></div>



<div class="card">


<div class="logo">

🚀

</div>



<h1>

Create Account

</h1>


<p class="subtitle">

Join Auth App by Kaushal

</p>



<form method="POST">



<div class="input">

<input 
type="text"
name="un"
placeholder="👤 Username"
required>

</div>



<div class="input">

<input
type="password"
name="pw"
placeholder="🔒 Password"
required>

</div>



<div class="input">

<input
type="password"
name="cpw"
placeholder="🔐 Confirm Password"
required>

</div>



<button>

Create Account

</button>


</form>



<div class="link">


<a href="/login">

Already have an account?

</a>


</div>


</div>


</body>

</html>