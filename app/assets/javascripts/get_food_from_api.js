$( document ).ready(function() {

  $('#btn-get-food').on('click', (e)=>{
    let input_food_value = $('#food-name-input').val();

    $.ajax({
      type: "GET",
      url: "https://api.edamam.com/api/food-database/parser?ingr="+ input_food_value +"&app_id=49781241&app_key=19c2bf858b0124e2f77912923f95f1bf",
      success: function(data, textStatus, jqXHR){
        var resultsFoods = jqXHR.responseJSON.hints;

        function isAllParams(value){
          nutrition = value.food.nutrients
          return nutrition.ENERC_KCAL != undefined && nutrition.CHOCDF != undefined && nutrition.PROCNT != undefined && nutrition.FAT != undefined
        }

        var filteredFoods = resultsFoods.filter(isAllParams);

        if (filteredFoods == 0) {
          alert("We didn't find :(, write your own products");
        } else {
          filteredFoods.forEach( (food)=>{
            $('#list-food').append("<li class='list-group-item' data-name="+ food.food.label + " data-carbohydrates="+ food.food.nutrients.CHOCDF +" data-protein="+ food.food.nutrients.PROCNT +"  data-fat="+ food.food.nutrients.FAT +" data-calories="+ food.food.nutrients.ENERC_KCAL+">"+food.food.label+" </li>");
          })

          var list_food = $('#list-food li').on('click', (e)=>{
            $($('#calories-input')[0]).val(parseFloat(e.target.dataset.calories).toFixed(2));
            $($('#carbo-input')[0]).val(parseFloat(e.target.dataset.carbohydrates).toFixed(2));
            $($('#protein-input')[0]).val(parseFloat(e.target.dataset.protein).toFixed(2));
            $($('#fat-input')[0]).val(parseFloat(e.target.dataset.fat).toFixed(2));
            $($('#food-name-input')[0]).val(e.target.dataset.name);
            list_food.remove();
          })
        };
        $('.hidden-inputs').css('display', 'block');
      },
      error: function(textStatus){
        //console.log(textStatus);
        $('#list-food').append("<li class='list-group-item>Not found</li>");
      }
    });

  });
});
