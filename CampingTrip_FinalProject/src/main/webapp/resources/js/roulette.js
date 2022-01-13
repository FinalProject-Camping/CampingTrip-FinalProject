$(document).ready(function () {
    var gift;
    var present = [1, 2, 3, 4, 5, 6]

    iniGame = function (num) {
        gift = num;
        TweenLite.killTweensOf($(".board_on"));
        TweenLite.to($(".board_on"), 0, { css: { rotation: rotationPos[gift] } });
        TweenLite.from($(".board_on"), 5, { css: { rotation: -3000 }, onComplete: endGame, ease: Sine.easeOut });
        console.log("gift 숫자 : " + (gift + 1) + "rotationPos" + rotationPos);
    }

    var rotationPos = new Array(60, 120, 180, 240, 300, 360);

    TweenLite.to($(".board_on"), 360, { css: { rotation: -4000 }, ease: Linear.easeNone });
    function endGame() {
        var copImg = "../resources/img/coupon" + (gift + 1) + ".png";
        console.log("이미지 : " + copImg);

        $("#popup_gift .lottery_present").text(function () { return "축하드립니다." + present[gift] + " 룰렛숫장" + (gift + 1) + " 당첨 되셨습니다."; });
        $('<img  src="' + copImg + '" />').prependTo("#popup_gift .lottery_present");
        setTimeout(function () { openPopup("popup_gift"); }, 1000);
    }

    $(".popup .btn").on("click", function () {
        location.reload();
    });
    function openPopup(id) {
        closePopup();
        $('.popup').slideUp(0);
        var popupid = id
        $('body').append('<div id="fade"></div>');
        $('#fade').css({
            'filter': 'alpha(opacity=60)'
        }).fadeIn(300);
        var popuptopmargin = ($('#' + popupid).height()) / 2;
        var popupleftmargin = ($('#' + popupid).width()) / 2;
        $('#' + popupid).css({
            'margin-left': -popupleftmargin
        });
        $('#' + popupid).slideDown(500);
    }
    function closePopup() {
        $('#fade').fadeOut(300, function () {
            // $(".player").html('');
        });
        $('.popup').slideUp(400);
        return false
    }
    $(".close").click(closePopup);

});



$(function () {
    var clicked = 0;
    for (i = 1; i < 7; i++) {
        // 상품쪽 이미지 수정 필요
        var pictures = "../resources/img/coupon" + i + ".png";
        $(".board_on").append('<img  src="' + pictures + '" />');
    }

    $(".join").on("mousedown", function () {
        if (clicked <= 0) { iniGame(Math.floor(Math.random() * 6)); }
        else if (clicked >= 1) { event.preventDefault(); alert("이벤트에 이미 참여 하셨습니다."); }
        clicked++
    });
})