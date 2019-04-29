$("#insert_name").submit(function(e){

    e.preventDefault();
    var name =$("#insert_name input[name='name']").val();

    

    $.ajax({
        url: '/api/friends',
        method: 'POST',
        data: {name: name,  }
    }).then(function(message){
    getFriends();
    
    })

})