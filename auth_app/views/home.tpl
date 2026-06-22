<!DOCTYPE html>
<html>
<head>

<title>Home Page | Auth App</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

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

    overflow:hidden;

    background:linear-gradient(
        120deg,
        #020617,
        #0f172a,
        #1e293b
    );

    transition:.5s;

}


/* Animated Background */

body::before{

    content:"";

    position:absolute;

    width:500px;
    height:500px;

    background:#2563eb;

    border-radius:50%;

    filter:blur(120px);

    top:-150px;
    left:-150px;

    animation:move 6s infinite alternate;

}


body::after{

    content:"";

    position:absolute;

    width:450px;
    height:450px;

    background:#9333ea;

    border-radius:50%;

    filter:blur(120px);

    bottom:-150px;
    right:-150px;

    animation:move2 7s infinite alternate;

}



@keyframes move{

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



/* Theme Button */

.theme-btn{


position:absolute;

top:25px;

right:25px;


padding:12px 22px;


border:none;

border-radius:50px;


cursor:pointer;


font-size:16px;


background:white;

color:#111827;


box-shadow:0 5px 20px rgba(0,0,0,.3);


}



/* Card */


.card{


position:relative;


width:90%;

max-width:600px;


padding:55px 45px;


border-radius:35px;



background:rgba(255,255,255,0.12);


backdrop-filter:blur(20px);


border:1px solid rgba(255,255,255,.25);



box-shadow:

0 25px 60px rgba(0,0,0,.5);



text-align:center;


color:white;



animation:show 1s ease;


}



@keyframes show{


from{

opacity:0;

transform:translateY(50px) scale(.9);

}


to{

opacity:1;

transform:translateY(0) scale(1);

}


}



/* Icon */


.welcome-icon{


font-size:90px;


margin-bottom:20px;


animation:bounce 2s infinite;


}


@keyframes bounce{


50%{

transform:translateY(-15px);

}

}



/* Text */


h1{


font-size:52px;

letter-spacing:2px;


margin-bottom:15px;



background:linear-gradient(
90deg,
#38bdf8,
#c084fc
);


-webkit-background-clip:text;

color:transparent;


}



h2{


font-size:28px;


color:#e2e8f0;


margin-bottom:35px;


}



/* Button */


input[type="submit"]{


width:100%;


padding:18px;


border:none;


border-radius:20px;


font-size:22px;


font-weight:bold;



color:white;



background:

linear-gradient(
135deg,
#2563eb,
#9333ea
);



cursor:pointer;



box-shadow:

0 10px 25px rgba(37,99,235,.5);



transition:.4s;


}



input[type="submit"]:hover{


transform:translateY(-5px) scale(1.03);


box-shadow:

0 15px 35px rgba(147,51,234,.7);



}




/* Mobile */


@media(max-width:600px){


.card{

padding:40px 25px;

}


h1{

font-size:38px;

}


h2{

font-size:22px;

}


.welcome-icon{

font-size:70px;

}


}


</style>

</head>



<body>



<button class="theme-btn" onclick="changeTheme()">

🌙 Theme

</button>



<div class="card">


<div class="welcome-icon">

🏠

</div>



<h1>

Home Page

</h1>



<h2>

Welcome {{ msg }}

</h2>




<form method="POST">


<input type="submit" value="Logout">


</form>


</div>





<script>


function changeTheme(){


document.body.style.background =

"linear-gradient(120deg,#dbeafe,#f8fafc,#e0f2fe)";


document.querySelector(".card").style.color="#111827";


}


</script>



</body>

</html>