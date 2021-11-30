$(()=>{

    // ajax calls for each field
    // With the current Show/Hide logic, the next field will only be shown once the value of the previous field has been changed

    $("#customer_id").change(function(){
       $("#building").show(); 
        let customer = $(this).val();
        // The ajax will call a method that will return an json object, on success, it will iterate all of the selections needed
        $.ajax({
            url: "/update_buildings",
            method: "GET",
            data: {customer_id: customer},
            dataType: "json",
            success: function (response) {
                $("#building_id").empty();
                $("#building_id").append("<option value="+""+"> Select </option>");

                for (let i = 0; i < response['buildings'].length; i++) {
                    $("#building_id").append("<option value="+ response['buildings'][i].id +">"+ response['buildings'][i].address_building +"</option>");
                }
            }
        })

        if($("#battery_id").val() || $("#column_id").val() || $("#elevator_id").val() != ""){
            $("#battery").hide();
            $("#column").hide();
            $("#elevator").hide();
            $("#battery_id").empty();
            $("#column_id").empty();
            $("#elevator_id").empty();
        } 
    })

    $("#building_id").change(function(){
       $("#battery").show(); 
        let building = $(this).val();

        $.ajax({
            url: "/update_battery",
            method: "GET",
            data: {building_id: building},
            dataType: "json",
            success: function (response) {
                $("#battery_id").empty();
                $("#battery_id").append("<option value="+""+"> Select </option>");

                for (let i = 0; i < response['batteries'].length; i++) {
                    $("#battery_id").append("<option value="+ response['batteries'][i].id +">"+ response['batteries'][i].id +"</option>");
                    
                }
            }
        })

         if($("#building_id").val() == ""){
            $("#battery").hide();
            $("#column").hide();
            $("#elevator").hide();
        }

    })

    $("#battery_id").change(function(){
       $("#column").show(); 
        let battery = $(this).val();

        $.ajax({
            url: "/update_column",
            method: "GET",
            data: {battery_id: battery},
            dataType: "json",
            success: function (response) {
                $("#column_id").empty();
                $("#column_id").append("<option value="+""+"> Select </option>");
                if($("#battery_id").val() != ""){$("#elevator").hide();}

                for (let i = 0; i < response['columns'].length; i++) {
                    $("#column_id").append("<option value="+ response['columns'][i].id +">"+ response['columns'][i].id +"</option>");

                }
            }
        })

        if($("#battery_id").val() == ""){
            $("#column").hide();
            $("#elevator").hide();
        }

    })

    $("#column_id").change(function(){
       $("#elevator").show(); 
        let column = $(this).val();

        $.ajax({
            url: "/update_elevator",
            method: "GET",
            data: {column_id: column},
            dataType: "json",
            success: function (response) {
                $("#elevator_id").empty();
                $("#elevator_id").append("<option value="+""+"> Select </option>");

                for (let i = 0; i < response['elevators'].length; i++) {
                    $("#elevator_id").append("<option value="+ response['elevators'][i].id +">"+ response['elevators'][i].id +"</option>");
                }
            }
        })

    })

})