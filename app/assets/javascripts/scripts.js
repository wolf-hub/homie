window.onload = function(){


       
    //Check File API support
    if(window.File && window.FileList && window.FileReader)
    {
        var filesInput = document.getElementById("files");

        if (filesInput) {

            filesInput.addEventListener("change", function(event){
            
            var files = event.target.files; //FileList object
            var output = document.getElementById("result");
            
            for(var i = 0; i< files.length; i++)
            {
                var file = files[i];
                
                //Only pics
                if(!file.type.match('image'))
                  continue;
                
                var picReader = new FileReader();
                
                picReader.addEventListener("load",function(event){
                    
                    var picFile = event.target;
                    
                    var div = document.createElement("div");
                    
                    div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                            "title='" + picFile.name + "'/> <a href='javascript:void(0);' class='remove_pict'>X</a>";
                    
                    output.insertBefore(div,null);   
                    div.children[1].addEventListener("click", function(event){
                       div.parentNode.removeChild(div);
                    });         
                
                });
                
                 //Read the image
                picReader.readAsDataURL(file);
            }                               
           
        });


        }
        
        
    }
    else
    {
        console.log("Your browser does not support File API");
    }
}

// function myFunction() {
//   var x = document.getElementById("password-input");
//   if (x.type === "password") {
//     x.type = "text";
//   } else {
//     x.type = "password";
//   }
// }
jQuery(document).ready(function() {

 $menu = $('.chat-menu1');

$(document).mouseup(function (e) {
  if (!$menu.is(e.target)
  && $menu.has(e.target).length === 0)
  {
    $menu.removeClass('show-menu');
 }
});

$('.l-profile-img').on('click', () => {
 $menu.toggleClass('show-menu');
});
function step1validcity(cityfield) {
    if (cityfield != '') {
        return true;
    } else {
        return false;
    }
}

function step1valid(addrfield) {
    if (addrfield != '') {
        return true;
    } else {
        return false;
    }
}

function step2valid(hometype) {
    if (hometype.is(":checked")) {
        return true;
    } else {
        return false;
    }
}

function step5valid(duration) {
    if (duration.is(":checked")) {
        return true;
    } else {
        return false;
    }
}

function step6validmin(minbudg) {
    if (minbudg != '') {
        return true;
    } else {
        return false;
    }
}

function step6validmax(maxbudg) {
    if (maxbudg != '') {
        return true;
    } else {
        return false;
    }
}

jQuery('#step1-btn').click(function(e){
    e.preventDefault();
    var addrfield = jQuery('.address-val').val();
    var cityfield = jQuery('.city-val').val();
    if (!step1validcity(cityfield)) {
        alert('City should be not empty!');
    } else if (!step1valid(addrfield)) {
        alert('District should be not empty!');
    } else {        
        jQuery('#step1').hide();
        jQuery('#step2').show();
    }    
});    

jQuery('#step2-btn').click(function(e){
    e.preventDefault();
    var hometype = jQuery('input[name="request[home_type]"]');
    if (step2valid(hometype)) {
        jQuery('#step2').hide();
        jQuery('#step3').show();
    } else {
        alert('Please select Home Type!');
    }
    
}); 

jQuery('#step3-btn').click(function(e){
    e.preventDefault();
    jQuery('#step3').hide();
    jQuery('#step4').show();
}); 

jQuery('#step4-btn').click(function(e){
    e.preventDefault();
    jQuery('#step4').hide();
    jQuery('#step5').show();
}); 

jQuery('#step5-btn').click(function(e){
    e.preventDefault();
    var duration = jQuery('input[name="request[duration]"]');
    if (step2valid(duration)) {
        jQuery('#step5').hide();
        jQuery('#step6').show();
    } else {
        alert('Please select how much you want to stay!');
    }
}); 

jQuery('#stepfinish').click(function(e){
    e.preventDefault();
    var minbudg = jQuery('#request_min_budget').val();
    var maxbudg = jQuery('#request_max_budget').val();
    if (!step6validmin(minbudg) ) {
        alert('Please add your min budget!');
    } else if (!step6validmax(maxbudg)) {
        alert('Please add your max budget!');
    } else if (parseInt(minbudg) > parseInt(maxbudg)) {
        alert('Max budget should be bigger than min budget!');
    } else {
        $('#exampleModalCenter').modal();
        //jQuery('#new_request').submit();
    }
});

jQuery('#stepfinishsign').click(function(e){
    e.preventDefault();
    var minbudg = jQuery('#request_min_budget').val();
    var maxbudg = jQuery('#request_max_budget').val();
    if (!step6validmin(minbudg) ) {
        alert('Please add your min budget!');
    } else if (!step6validmax(maxbudg)) {
        alert('Please add your max budget!');
    } else if (parseInt(minbudg) > parseInt(maxbudg)) {
        alert('Max budget should be bigger than min budget!');
    } else {
        jQuery('#new_request').submit();
    }
});

jQuery('#pstepfinish').click(function(e){
    e.preventDefault();
    $('#exampleModalCenter2').modal();
});

jQuery('#pstepfinishsign').click(function(e){
    e.preventDefault();
    jQuery('#new_property').submit();
});
 

jQuery('#step6-prev').click(function(e){
    e.preventDefault();
    jQuery('#step6').hide();
    jQuery('#step5').show();
}); 

jQuery('#step5-prev').click(function(e){
    e.preventDefault();
    jQuery('#step5').hide();
    jQuery('#step4').show();
}); 

jQuery('#step4-prev').click(function(e){
    e.preventDefault();
    jQuery('#step4').hide();
    jQuery('#step3').show();
}); 

jQuery('#step3-prev').click(function(e){
    e.preventDefault();
    jQuery('#step3').hide();
    jQuery('#step2').show();
}); 

jQuery('#step2-prev').click(function(e){
    e.preventDefault();
    jQuery('#step2').hide();
    jQuery('#step1').show();
}); 

function pstep1validcity(procity) {
    if (procity != '') {
        return true;
    } else {
        return false;
    }
}

function pstep1validadd(address) {
    if (address != '') {
        return true;
    } else {
        return false;
    }
}

function pstep1validnam(proname) {
    if (proname != '') {
        return true;
    } else {
        return false;
    }
}

function pstep1validinf(proinfo) {
    if (proinfo != '') {
        return true;
    } else {
        return false;
    }
}

jQuery('#pstep1-btn').click(function(e){
    e.preventDefault();
    var procity = jQuery('#property_city').val();
    var address = jQuery('#property_address').val();
    var proname = jQuery('#property_property_name').val();
    var proinfo = jQuery('#property_summary').val();
    if (!pstep1validcity(procity)) {
        alert('Please add city of your property!')
    } else if (!pstep1validadd(address)) {
        alert('Please add district of your property');
    } else if (!pstep1validnam(proname)) {
        alert('Please add name of your propery');
    } else if (!pstep1validinf(proinfo)) {
        alert('Please add description of your proprty');
    } else {
        jQuery('#pstep1').hide();
        jQuery('#pstep2').show();
    }
    
});    

function pstep2validhome(phometype) {
    if (phometype.is(":checked")) {
        return true;
    } else {
        return false;
    }
}

jQuery('#pstep2-btn').click(function(e){
    e.preventDefault();
    var phometype = jQuery('input[name="property[home_type]"]');
    if (!pstep2validhome(phometype)) {
        alert('Please select type of your property');
    } else {
        jQuery('#pstep2').hide();
    jQuery('#pstep3').show();
    }    
}); 

jQuery('#pstep3-btn').click(function(e){
    e.preventDefault();
    jQuery('#pstep3').hide();
    jQuery('#pstep4').show();
}); 

jQuery('#pstep4-btn').click(function(e){
    e.preventDefault();
    jQuery('#pstep4').hide();
    jQuery('#pstep5').show();
}); 

function pstep5validleas(lease) {
    if (lease.is(":checked")) {
        return true;
    } else {
        return false;
    }
}

function pstep5validprice(pprice) {
    if (pprice != '') {
        return true;
    } else {
        return false;
    }
}

jQuery('#pstep5-btn').click(function(e){
    e.preventDefault();
    var lease = jQuery('input[name="property[minimum_lease]"]');
    var pprice = jQuery('#property_price').val();
    if (!pstep5validleas(lease)) {
        alert('Please select minimal lease period');
    } else if (!pstep5validprice(pprice)) {
        alert('Please enter price with which you want rent your property');
    } else {
        jQuery('#pstep5').hide();
        jQuery('#pstep6').show();
    }    
}); 

 

jQuery('#pstep6-prev').click(function(e){
    e.preventDefault();
    jQuery('#pstep6').hide();
    jQuery('#pstep5').show();
}); 

jQuery('#pstep5-prev').click(function(e){
    e.preventDefault();
    jQuery('#pstep5').hide();
    jQuery('#pstep4').show();
}); 

jQuery('#pstep4-prev').click(function(e){
    e.preventDefault();
    jQuery('#pstep4').hide();
    jQuery('#pstep3').show();
}); 

jQuery('#pstep3-prev').click(function(e){
    e.preventDefault();
    jQuery('#pstep3').hide();
    jQuery('#pstep2').show();
}); 

jQuery('#pstep2-prev').click(function(e){
    e.preventDefault();
    jQuery('#pstep2').hide();
    jQuery('#pstep1').show();
}); 


var owl = $('.property-slider-01');
              owl.owlCarousel({
                margin:0,
                nav: true,
                loop: true,
                dots: false,
                responsive: {
                  0: {
                    items: 1
                  }
                  
                }
              })    

jQuery('.timeago').timeago();    
jQuery('.menu-btn').on('click', function () {
    jQuery('#bs-navbar').toggleClass('slide-menu')
	jQuery('.navbar-header').toggleClass('active-menu')
});

jQuery('.ellipsis').click(function(e) {
    e.preventDefault();
    jQuery('.chat-menu').toggleClass("show-menu");
});

jQuery(window).scroll(function() {    
    var scroll = $(window).scrollTop();

    if (scroll >=100) {
        jQuery(".header").addClass("fixed-header");
    } else {
        jQuery(".header").removeClass("fixed-header");
    }
});

              var owl = $('.latest-insights-slider');
              owl.owlCarousel({
                stagePadding: 50,
                margin:25,
                nav: true,
                loop: true,
				dots: false,
                responsive: {
                  0: {
                    items: 1
                  },
                  600: {
                    items: 2
                  },
                  1000: {
                    items: 3
                  }
                }
              })
			  
			  var owl = $('.property-slider-01');
              owl.owlCarousel({
                margin:0,
                nav: true,
                loop: true,
				dots: false,
                responsive: {
                  0: {
                    items: 1
                  }
                  
                }
              })
jQuery('.check1').click(function() {
    jQuery('.tenant').toggleClass("active");
});
jQuery('.check2').click(function() {
    jQuery('.landlord').toggleClass("active");
});	 

jQuery('.visible-pw').click(function() {
    debugger;
    $input = $($(this).closest('.form-group').find('input'));
    // if($input.val() != "")
    // {
        if ($(this).hasClass("not-visible-pw"))
        {
            $input.attr("type","text");
            $(this).removeClass("not-visible-pw");
            $($(this).children('img')[0]).attr("src","assets/visible.png");
        }else{
            $(this).addClass("not-visible-pw");
            $input.attr("type","password");
            $($(this).children('img')[0]).attr("src","assets/not-visible.png");
        }
    // }
});

$('.toggleTypeIcon1').click(function(){
    if($($(this).closest('.user-label')).hasClass("active")){
        $($(this).closest('.user-label')).removeClass("active");
    }else{
        $($(this).closest('.user-label')).addClass("active");
        $('.toggleTypeIcon2').closest('.user-label').removeClass("active");
    }
});

$('.toggleTypeIcon2').click(function(){
    if($($(this).closest('.user-label')).hasClass("active")){
        $($(this).closest('.user-label')).removeClass("active");
    }else{
        $($(this).closest('.user-label')).addClass("active");
        $('.toggleTypeIcon1').closest('.user-label').removeClass("active");
    }
});







});



$(document).ready(function() {

    var sync1 = $("#sync1");
    var sync2 = $("#sync2");
    var slidesPerPage = 4; //globaly define number of elements per page
    var syncedSecondary = true;

    sync1.owlCarousel({
        items: 1,
        slideSpeed: 2000,
        nav: true,
        autoplay: false, 
        dots: false,
        loop: true,
        responsiveRefreshRate: 200,
    }).on('changed.owl.carousel', syncPosition);

    sync2
        .on('initialized.owl.carousel', function() {
            sync2.find(".owl-item").eq(0).addClass("current");
        })
        .owlCarousel({
            items: slidesPerPage,
            dots: false,
            nav: false,
            smartSpeed: 200,
            slideSpeed: 500,
			margin:10,
            slideBy: slidesPerPage, //alternatively you can slide by 1, this way the active slide will stick to the first item in the second carousel
            responsiveRefreshRate: 100
        }).on('changed.owl.carousel', syncPosition2);

    function syncPosition(el) {
        //if you set loop to false, you have to restore this next line
        //var current = el.item.index;

        //if you disable loop you have to comment this block
        var count = el.item.count - 1;
        var current = Math.round(el.item.index - (el.item.count / 2) - .5);

        if (current < 0) {
            current = count;
        }
        if (current > count) {
            current = 0;
        }

        //end block

        sync2
            .find(".owl-item")
            .removeClass("current")
            .eq(current)
            .addClass("current");
        var onscreen = sync2.find('.owl-item.active').length - 1;
        var start = sync2.find('.owl-item.active').first().index();
        var end = sync2.find('.owl-item.active').last().index();

        if (current > end) {
            sync2.data('owl.carousel').to(current, 100, true);
        }
        if (current < start) {
            sync2.data('owl.carousel').to(current - onscreen, 100, true);
        }
    }

    function syncPosition2(el) {
        if (syncedSecondary) {
            var number = el.item.index;
            sync1.data('owl.carousel').to(number, 100, true);
        }
    }

    sync2.on("click", ".owl-item", function(e) {
        e.preventDefault();
        var number = $(this).index();
        sync1.data('owl.carousel').to(number, 300, true);
    });
});

$(document).ready(function() {
jQuery('option').mousedown(function(e) {
    e.preventDefault();
    jQuery(this).toggleClass('selected');
  
    jQuery(this).prop('selected', !jQuery(this).prop('selected'));
    return false;
});

var elem = document.getElementById("request_city");
if(elem != null)
{
    elem.onchange = function(e){
        var hiddenDiv = document.getElementById("distts-sec");
        hiddenDiv.style.display = (this.value == "") ? "none":"block";
    };
}
});


$(document).ready(function() {

var elem = document.getElementById("property_city");
if (elem != null)
{
    elem.onchange = function(e){
        var hiddenDiv = document.getElementById("distt-sec");
        hiddenDiv.style.display = (this.value == "") ? "none":"block";
    };
}
});

$('.toggleTypeIcon1').click(function(){
    if($($(this).closest('.user-label')).hasClass("active")){
        $($(this).closest('.user-label')).removeClass("active");
    }else{
        $($(this).closest('.user-label')).addClass("active");
        $('.toggleTypeIcon2').closest('.user-label').removeClass("active");
    }
});

$('.toggleTypeIcon2').click(function(){
    if($($(this).closest('.user-label')).hasClass("active")){
        $($(this).closest('.user-label')).removeClass("active");
    }else{
        $($(this).closest('.user-label')).addClass("active");
        $('.toggleTypeIcon1').closest('.user-label').removeClass("active");
    }
});
