########boostrap
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

<style>
.card_img{
  width: 100%;
}

.card_img:after {
  content: "";
  display: block;
  padding-bottom: 100%;
}
</style>


<div id="game"></div>

<script>
var opens = []; #####the cards that you see
var openCard = -1;
var openId = -1;
var cantplay=false;

function play_card(card,id){
  if(cantplay)
    return;
  var element = document.getElementById('img'+id);
  if(opens.includes(id))
  {
    return;
  }
  if(id == openId)
  {
    return;
  }
  
  
  element.style.opacity = "1";
  element.style.filter  = 'alpha(opacity=100)';
  
  if(openId==-1)
  {  
    openId = id;
    openCard = card;
    return;  
  }

  

  if(card == openCard)
  {
    
    opens.push(id);
    opens.push(openId);
    openCard=-1;
    openId=-1;
    return;
  }
  cantplay=true;
  var element2 = document.getElementById('img'+openId);
  setTimeout(function(){
  element.style.opacity = "0";
  element.style.filter  = 'alpha(opacity=0)';
  element2.style.opacity = "0";
  element2.style.filter  = 'alpha(opacity=0)';
  cantplay=false;
  },500);
  
  openCard=-1;
  openId=-1;  

}

###########3
function generateBoard(){ 
  
  truerandom = [];
  var numOfImgs = 2350; #####num of existing pictutrs
  var numOfpair = 6*6/2;// 6x6 game board ########num of cards
  var text = "<div class='container' style='width:50%'><div class='row'>";
  var cardsInARow=6;
  
  ########## lesaiem shoora vematchilim hadasha

  for(var i = 0; i<numOfpair*2;i++){ ##########creating the cards
    if(i!=0 && i%cardsInARow==0) 
      text+='</div><div class="row">';
    text+='<div class="col"><div class="card mb-4 shadow-sm" style="background-color: cyan;"><img class="card_img" id="img'+i+'"></div></div>'; #######I - mispar tmona
  }
  text+="</div>"; 
  document.getElementById('game').innerHTML = text;
  var randomNums = [];//all the pair
  for(var i = 0; i < numOfpair; i++){
    

    randomNum = Math.floor(Math.random() * (numOfImgs - randomNums.length))//num of img - num of img that was choosen = num of img remaind to us
    //truerandom.push(randomNum); //testing
    for(var j = 0; j < randomNums.length; j++){  // * - can choose it
                // ^ - cant choose it
                // 
                 // ****^***** so from this we want to remove the ^
                // ********* +1 when >= to the ^ location
      if(randomNum >= randomNums[j]){
        randomNum++;
      }
    }
    randomNums.push(randomNum);
    randomNums.sort(function(a, b){return a-b});   //sort for the algorithm above
  }
  randomNums = randomNums.concat(randomNums);
  randomNums.sort(function(a, b){return Math.random()-0.5});//sorting randomly = shuffeling
  randomNums.sort(function(a, b){return Math.random()-0.5});//sorting randomly = shuffeling
  randomNums.sort(function(a, b){return Math.random()-0.5});//sorting randomly = shuffeling
  randomNums.sort(function(a, b){return Math.random()-0.5});//sorting randomly = shuffeling
  randomNums.sort(function(a, b){return Math.random()-0.5});//sorting randomly = shuffeling
  randomNums.sort(function(a, b){return Math.random()-0.5});//sorting randomly = shuffeling
  for(var i = 0; i<randomNums.length; i++){
    document.getElementById("img"+i).src = "imgs/"+randomNums[i]+".png";
    document.getElementById("img"+i).setAttribute('onclick','play_card(\''+randomNums[i]+'\',\''+i+'\')');
    document.getElementById("img"+i).style.opacity = "0"; 
    document.getElementById("img"+i).style.filter  = 'alpha(opacity=0)';
  }
}
generateBoard();
</script>