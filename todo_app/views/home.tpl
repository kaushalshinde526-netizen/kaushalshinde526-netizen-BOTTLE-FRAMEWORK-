<html>
      <head>
            <title>TODO App </title>
            <style> 
                  *{font-size:50px; text-align:center;}
                  table{width:80%;  margin:auto;}
            </style>
      </head>
      <body>
            <h1>ToDo App</h1>
            <form method="POST">
                   <input type="text" name="task" placeholder="Enter Task Name"
                   required/>
                        <br/><br/>
                        <input type="submit" value="Create"/>
                        <br/><br/>
                  </form>
                  <table border="5">
                        <thed>
                              <tr>
                                    <th>Task</th>
                                    <th>Task DT</th>
                                    <th>Delete</th>
                              </tr>
                        </thed>
                  <tbody>
                        % if msg:
                              % for m in msg:
                              <tr>
                              <td>{{m[1]}}</td>
                              <td>{{m[2]}}</td>
                              <td><button onclick="return confirm('r u sure??')">
<a href="/delete/{{m[0]}}"> Delete </a> </button></td>
                              </tr>
                              %end
                        %end
                  </tbody>
            </table>
      </body>
</html>
                  

      