$(document).ready(function () {

    $("#smBooking").hide();

    $('.smName_btn').on("click", (e) => {
        var smName = e.target.value;
        $("#smName").html(smName);
    });


    //테스트용 데이터
    var allTime = {
        " ": "시간 선택",
        "A": "09:00",
        "B": "10:00",
        "C": "11:00",
        "D": "12:00",
        "E": "13:00",
        "F": "14:00",
        "G": "15:00",
        "H": "16:00"
    };

    //allTime이 A일경우
    var time_A = {
        "A01": "09:00 ~ 10:00",
        "A02": "09:00 ~ 11:00",
        "A03": "09:00 ~ 12:00"
    };

    //allTime이 B일경우
    var time_B = {
        "B01": "10:00 ~ 11:00",
        "B02": "10:00 ~ 12:00",
        "B03": "10:00 ~ 13:00"
    };

    //allTime이 C일경우
    var time_C = {
        "C01": "11:00 ~ 12:00",
        "C02": "11:00 ~ 13:00",
        "C03": "11:00 ~ 14:00"
    };

    //allTime이 D일경우
    var time_D = {
        "D01": "12:00 ~ 13:00",
        "D02": "12:00 ~ 14:00",
        "D03": "12:00 ~ 15:00"
    };

    //allTime이 E일경우
    var time_E = {
        "E01": "13:00 ~ 14:00",
        "E02": "13:00 ~ 15:00",
        "E03": "13:00 ~ 16:00"
    };

    //allTime이 F일경우
    var time_F = {
        "F01": "14:00 ~ 15:00",
        "F02": "14:00 ~ 16:00",
        "F03": "14:00 ~ 17:00"
    };

    //allTime이 G일경우
    var time_G = {
        "G01": "15:00 ~ 16:00",
        "G02": "15:00 ~ 17:00"
    };

    //allTime이 H일경우
    var time_H = {
        "H01": "16:00 ~ 17:00"
    };



    //allTime에 서버에서 받아온 값을 넣기위해..
    // map배열과 select 태그 id를 넘겨주면 option 태그를 붙여줌.
    // map[키이름] = 그 키에 해당하는 value를 반환한다.
    //retOption(데이터맵, select함수 id)
    function retOption(mapArr, select) {
        var html = '';
        var keys = Object.keys(mapArr);
        for (var i in keys) {
            html += "<option value=" + "'" + keys[i] + "'>" + mapArr[keys[i]] + "</option>";
        }

        $("select[id='" + select + "']").html(html);
    }


    $("select[id='allTime']").on("change", () => {
        var option = $("#allTime option:selected").val();
        var subSelName = '';
        if (option == "A") {
            subSelName = "time_A";
            $("#smBooking").show();
        } else if (option == "B") {
            subSelName = "time_B";
            $("#smBooking").show();
        } else if (option == "C") {
            subSelName = "time_C";
            $("#smBooking").show();
        } else if (option == "D") {
            subSelName = "time_D";
            $("#smBooking").show();
        } else if (option == "E") {
            subSelName = "time_E";
            $("#smBooking").show();
        } else if (option == "F") {
            subSelName = "time_F";
            $("#smBooking").show();
        } else if (option == "G") {
            subSelName = "time_G";
            $("#smBooking").show();
        } else if (option == "H") {
            subSelName = "time_H";
            $("#smBooking").show();
        } else {
            $("#time").hide();
            $("#smBooking").hide();
            return;
        }
        $("#time").show();
        retOption(eval(subSelName), "time");
    })
    retOption(allTime, "allTime");
});
