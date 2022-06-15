


#### Live project link: [CLICK HERE](http://52.43.27.14:8080/calculatorServlet/)


&nbsp;

homepage of calculator:


<img src="https://user-images.githubusercontent.com/65856669/173229034-3b4c8074-2c7f-4a8f-8913-6fbe20429c45.png" width="400">



To check history of calculations:


<img src = "https://user-images.githubusercontent.com/65856669/173229066-984f4eeb-e731-4687-a81b-5c42b28ca548.png" width="400">


&nbsp;


# How to use regex, regular expression


     var regex = /[^0-9-/*-+%.]/gi

above expression says that include all letters except 0 to 9 and except '/' ,'*','-','+','%','.',

**Note:** regex returns group of character(i think so)

- we write regex inside(two forward slash) /regular expression/

- ^(caret) means except

-  from ^0-9 this we are adding all letters, so regex will contains characters like a-z, and all special characters, operators

    - yahh but for calculator we need to write operators(+,-,*,/) in input field also
      so we have subtracted operators /,*,-,+,% and even .(dot) from regex,
      
      
      
 
&nbsp;

### Logic for input to avoid writing alphabet and some other special characters like @,#,etc,
- we have added all character that we dont in to add to input field in regex variable,
- now we will use oninput attribute of input tag, to check if new input character is added,
- and for that new input character we will check if new input is equals to regex, means we will check if new input
is some unnecessery character or not if it is some unnecesory charater like a-z or '%','#',etc then we will write "" in input box.
- below javascript code restrict input field oninput, it will not add alphabets and some other special characters which is needed in calculator

      function restriction(input){
      var num = /[^0-9-/*-+%.]/gi;
      input.value = input.value.replace(num,"");
      }
