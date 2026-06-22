<html>	
	<head>
		<title>Currency Converter App</title>
		<style>
			*{font-size:40px;text-align:center;}
			body{
				background-color:azure;
			}
  			.fc {
 				border:solid;
				paddding:2%;
				width:50%;
				margin:auto;
				border-radius:30px;
				background-color;lightblue;
			}
			h2{
				border:solid;
				padding:2%;
				width:50%;
				margin:auto;
				border-radius:30px;
			}
			
			input[type="submit"]:disabled{
				background-color:gray;
 				cursor.not-allowed;
				}
				</style>
				<script>
					function featch Msg()
  					{
						let btn = document.getElementByid("btn");
						btn.disabled=true;
 						btn.value="featching...";
					}
				</script>
	</head>
	<body>
		<h1>Live CC App </h1>
		<div class="fc">
			<form method="POST" onsubmit="fetchMsg()">
				<input type="number" step="0.01" name="amt"
                placeholder="Enter Amt in $" min=0.1  required />
                <br><br/>
                <input type="submit" value="convert to ₹" id="btn"/>
			</form>
		</div>
		<br/>
		<h2>
    			{{msg}}
		</h2>
		<br/>
		
	</body>
</html>