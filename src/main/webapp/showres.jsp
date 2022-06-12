<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="script.js"></script>
</head>
<body>
 <%

           //getting all history of expression evalution from servlet
          ArrayList<String> hislis = (ArrayList) request.getAttribute("history");


        System.out.println("size of history list: "+hislis.size());

%>
    <div class="hisBox" id="hbox">

     <%   for(int i=0;i<hislis.size();i++){ %>

               <div class="hisEle" onClick="document.getElementById('uinput').value='<%=hislis.get(i).split("=")[0] %> ' "><%=hislis.get(i) %></div>

           <% }  %>

    </div>
    <form class="calculator" name="calc" action="solve">
        <input type="text" id="uinput" class="value" name="txt" value="<%=request.getAttribute("answer") %>" autofocus>
        <span class="number clear" onclick="document.getElementById('uinput').value=''">c</span>
        <span class="history" id="hisele" onClick="showHistory()">H</span>
        <span class="number" onclick="document.getElementById('uinput').value+='%'">%</span>
        <span class="number" onclick="document.getElementById('uinput').value+='/'">/</span>
        <span class="number" onclick="document.getElementById('uinput').value+='7'">7</span>
        <span class="number" onclick="document.getElementById('uinput').value+='8'">8</span>
        <span class="number" onclick="document.getElementById('uinput').value+='9'">9</span>
        <span class="number" onclick="document.getElementById('uinput').value+='*'">*</span>
        <span class="number" onclick="document.getElementById('uinput').value+='4'">4</span>
        <span class="number" onclick="document.getElementById('uinput').value+='5'">5</span>
        <span class="number" onclick="document.getElementById('uinput').value+='6'">6</span>
        <span class="number" onclick="document.getElementById('uinput').value+='-'">-</span>
        <span class="number" onclick="document.getElementById('uinput').value+='1'">1</span>
        <span class="number" onclick="document.getElementById('uinput').value+='2'">2</span>
        <span class="number" onclick="document.getElementById('uinput').value+='3'">3</span>
        <!--<span class="number equal" onclick="solve()">=hello</span> -->
        <button class = "number equal" type="submit">=</button>
        <span class="number zero" onclick="document.getElementById('uinput').value+='0'">0</span>
        <span class="number" onclick="document.getElementById('uinput').value+='.'">.</span>
        <span class="number plus" onclick="document.getElementById('uinput').value+='+'">+</span>

    </form>


<script>

//below code is for showing history tab when clicked 'H'
let hclicked = false;
function showHistory(){
    if(!hclicked){

        hclicked=true

        let historytab = document.getElementById("hbox")

        historytab.style.display="block"

        let historyButton = document.getElementById("hisele")
        historyButton.style.backgroundColor = "#0fb9b1";
       let s = <%=hislis.size() %>





        <% int i=0; %>
        //for(let i=0;i<s;i++){
        //    let nelem = document.createElement("div");
        //    nelem.classList.add("hisEle")

         //   nelem.innerHTML = '<%// hislis.get(i++) %>'

          //  historytab.append(nelem)

        //}

        console.log("size if history stack :" ,s);


    }else{
        let historytab = document.getElementById("hbox")
        historytab.style.display="none"
        hclicked=false;

        let historyButton = document.getElementById("hisele")
        historyButton.style = "none"
    }


}


</script>

</body>
</html>