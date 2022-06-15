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

    int size=0;
    if(hislis==null){
        System.out.println("history is empty");
        size=0;
    }
    else{
        size=hislis.size();
        System.out.println("size of history list: "+hislis.size());
    }

%>
<div class="hisBox" id="hbox">

    <%   int s=size;
        for(int i=0;i<s;i++){ %>

    <div class="hisEle" onClick="document.getElementById('uinput').value='<%= hislis.get(i).split("=")[0]=false?null:hislis.get(i).split("=")[0] %> ' "> <%= hislis.get(i) %></div>

    <% }  %>

</div>
<form class="calculator" name="calc" action="solve" method="post">
<%--    <input type="text" id="uinput" class="value" oninput="restriction(this)" name="txt" value=${answer}  >--%>
    <input type="text"
           id="uinput"
           class="value"
           oninput="javascript:(function(input) {
                                     var num = /[^0-9-/*-+%.]/gi
                                     input.value = input.value.replace(num,'')
                                                })(this)"
          name="txt"
          value=${answer} >
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
            let s = <%=s %>





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

    /*How to use regex, regular expression,

    -> var regex = /[^0-9-/*-+%.]/gi

    above expression says that include all letters except 0 to 9 and except '/' ,'*','-','+','%','.',

    note - regex returns group of character(i think so)

    -> we write regex inside(two forward slash) /regular expression/

    ^(caret) means except

    from ^0-9 this we are adding all letters,
     so regex will contains characters like a-z, and all special characters, operators

     yahh but for calculator we need to write operators(+,-,*,/) in input field also
     so we have subtracted operators /,*,-,+,% and even .(dot) from regex,

     Logic for input to avoid writing alphabet and some other special characters like @,#,etc,
        -> we have added all character that we dont in to add to input field in regex variable,
        -> now we will use oninput attribute of input tag, to check if new input character is added,
        -> and for that new input character we will check if new input is equals to regex, means we will check if new input
         is some unnecessery character or not if it is some unnecesory charater like a-z or '%','#',etc then we will write "" in input box.






     */
    // //restrict input field
    // function restriction(input){
    //     var num = /[^0-9-/*-+%.]/gi;
    //     input.value = input.value.replace(num,"");
    // }

</script>

</body>
</html>
