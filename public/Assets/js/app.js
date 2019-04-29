function validInput(){
    var valid= true;
    $('.friend_form').each(function(){
        if($(this).val()==""){
            valid=false
        }
    })
    $('.q_select').each(function(){
        if($(this).val()==""){
            valid=false
        }
    })
    return valid; 
}

if (validInput()){
    var userdata={
        name: $('#name').val(),
        photo: $('#pic').val(),
        scores: [$("#q1").val(),
        $("#q2").val(),
        $("#q3").val(),
        $("#q4").val(),
        $("#q5").val(),
        $("#q6").val(),
        $("#q7").val(),
        $("#q8").val(),
        $("#q9").val(),
        $("#q10").val()
      ]

    };
}

$.post('/api/friends', userdata, function (data) {});